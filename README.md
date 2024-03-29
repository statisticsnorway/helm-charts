# helm-charts

This is a repository for Helm charts.

## Charts in this repository

* SSB Chart (See source/ssb-chart)

## Files in repo

```shell
├── bin/build.sh  # Script for packaging and indexing
├── index.yaml    # Helm repo index
├── builds/       # Temporary directory for new packages
├── charts/       # Packaged Helm charts
└── source/       # Source files for the Helm chart
```

## Updating Helm charts

1. Update the Helm chart in the `source/` directory
1. Add release notes to the helm charts `CHANGELOG.md` file
1. Increment the version string in the `Charts.yaml` file
1. Update the `Values` descriptions using the "[helm-docs](https://github.com/norwoodj/helm-docs)" command (` helm-docs -o README.md`)
1. Run unit tests `helm unittest source/ssb-chart`
1. Validate the changes to the test snapshots and rerun unit tests with `-u` to update
1. Run the `./bin/build.sh` script to package the new release
1. Commit the changes to a branch
1. You can test from the branch in a HelmRelease by changing the repository path

   E.g: `repository: https://raw.githubusercontent.com/statisticsnorway/helm-charts/<branch>/`
1. Create PR

In order to use a new version of a Helm chart, the version tag of the
HelmRelease has to be changed as well.

## Packaging and indexing of Helm charts

A convenience script is available for packaging the charts and updating the
"index.yaml" file.

```shell
./bin/build.sh
```

Note that created timestamps will be updated for all indexed charts, even if
there are no changes. This will not affect HelmReleases. But if you don't want
these to show in the commit use the `git add -i index.yaml` and cherry pick only
the relevant chart updates.

## Usage in HelmRelease

Example of how to use the ssb-chart in an HelmRelease.

```yaml
apiVersion: helm.fluxcd.io/v1
kind: HelmRelease
metadata:
  name: "myapp"
  namespace: "mynamespace"
  annotations:
    fluxcd.io/ignore: "false"
    fluxcd.io/automated: "true"
    fluxcd.io/tag.chart-image: "glob:*"
    fluxcd.io/locked: "false"
spec:
  chart:
    # Use the ssb-chart from the helm-charts repo.
    repository: "https://raw.githubusercontent.com/statisticsnorway/helm-charts/main/"
    name: "ssb-chart"
    version: 2.3.4
  releaseName: "myapp"
  helmVersion: v3
  valuesFrom:
  # Include common values required by ssb-chart
  - configMapKeyRef:
      name: ssb-chart-common-values
      namespace: shared-config
      key: values.yaml
      optional: false
  values:
    somekey: value
```

## Tests

Tests are automatically run in an Azure pipeline.
For local testing run:
```shell
helm unittest source/ssb-chart
```
