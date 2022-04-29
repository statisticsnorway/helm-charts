#!/usr/bin/env bash
#
# Package new chart versions and update index.
#
# Note that created timestamps will be updated for all indexed charts, even if
# there are no changes. This will not affect HelmReleases.

mkdir -p builds

for chart in $(ls -c1 source); do
    helm package -d builds "source/$chart"
done

changed=no
for package in $(ls -c1 builds); do
    if [ ! -f "charts/${package}" ]; then
        mv -f "builds/${package}" "charts/${package}"
        changed=yes
    else
        rm -f "builds/${package}"
    fi
done

if [ "$changed" = "yes" ]; then
    helm repo index --merge index.yaml .
fi
