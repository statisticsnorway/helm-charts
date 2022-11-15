# Testing

## Helm unittest

### Running tests

Unit tests for the templates is located in the `tests/` folder and is run using
the [helm-unittest](https://github.com/quintush/helm-unittest) Helm plugin.

To run all tests:

```bash
helm unittest source/ssb-chart
```

### Writing tests

* The file containing the test must reside in the folder `tests/`
* The file containing the test must be suffixed `_test.yaml`

Please refer to the [Helm plugin documentation](https://github.com/quintush/helm-unittest/blob/master/DOCUMENT.md)
on how to write tests.

To avoid countless assertions we use Golden file testing with the `matchSnapshot` assertions to cover as "ground" much
as possible. The "all-values" tests below are likely to always change, while to "minimal" tests should normally only
change when there is a change to a default value.

* helmrelease-backend-all-values_test.yaml
* helmrelease-backend-minimal_test.yaml
* helmrelease-frontend-all-values_test.yaml
* helmrelease-frontend-minimal_test.yaml

When the changes in the output of the above tests are expected the snapshots can be updated accordingly using the
`-u` parameter:

```bash
helm unittest source/ssb-chart/ -u
```

### Overriding values in the tests

There are two ways of specifying values that should override the default values in the chart:

* Using the `set` tag directly in the test
* Specifying a `values` file

