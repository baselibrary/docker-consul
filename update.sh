#!/bin/bash
set -e

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

versions=( "$@" )
if [ ${#versions[@]} -eq 0 ]; then
	versions=( */ )
fi
versions=( "${versions[@]%/}" )


for version in "${versions[@]}"; do
	fullVersion="$(git ls-remote --tags https://github.com/hashicorp/consul.git | cut -d$'\t' -f2 | grep -E '^refs/tags/v'"${version}"'.[0-9]$' | cut -dv -f2 | sort -rV | head -n1 )"
  (
		set -x
		sed '
			s/%%CONSUL_MAJOR%%/'"$version"'/g;
			s/%%CONSUL_RELEASE%%/'"$fullVersion"'/g;
		' Dockerfile.template > "$version/Dockerfile"
	)
done
