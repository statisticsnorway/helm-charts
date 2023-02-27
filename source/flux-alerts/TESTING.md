# Testing

## Helm unittest

### Running tests

Unit tests for the templates is located in the `tests/` folder and is run using
the [helm-unittest](https://github.com/quintush/helm-unittest) Helm plugin.

To run all tests:

```bash
helm unittest source/flux-alerts
```

### Writing tests

* The file containing the test must reside in the folder `tests/`
* The file containing the test must be suffixed `_test.yaml`

Please refer to the [Helm plugin documentation](https://github.com/quintush/helm-unittest/blob/master/DOCUMENT.md).

Snapshots can be updated using the `-u` parameter:

```bash
helm unittest source/ssb-chart/ -u
```

### Overriding values in the tests

There are two ways of specifying values that should override the default values in the chart:

* Using the `set` tag directly in the test
* Specifying a `values` file
