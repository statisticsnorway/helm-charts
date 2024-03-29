# Changelog - ssb-chart

## v4.0.2

Bugfix of tmp volumes not being present in deployment. 

## v4.0.1

Bugfix

## v4.0.0

Updates in this release:

* Introduced new field: `access` which replaces `networkpolicy`, `egress`, `exposed` and `istioEndUserAuth`
* Remove fields:
  - `networkpolicy`
  - `egress`
  - `istioEndUserAuth`
  - `exposed`
* The volume `/tmp` is mounted as default into all deployments
* Ingress and egress traffic is denied by default, except egress to kube-dns. Rules must be explicitly configured with the `access` field.

In summary: The updates are mostly related to making network access more readable.

PS: for access.egress.external we use Istio `ServiceEntry` p.t.. This opens egress for the entire namespace the deployment runs in.

### Migration guide

#### tmp volume

The explicit `/tmp` volume mount can now be removed from the helm chart as this is mounted as default for all new
volumes.

This means you can remove the following configration from our manifest:
```yaml
volumes:
- name: tmp-volume
  emptyDir: {}
volumeMounts:
- name: tmp-volume
  mountPath: /tmp
```


#### The new `access` field
See also examples under `tests` folder.


##### Exposed
Before:
```yaml
exposed: true
```

After:
```yaml
access:
  ingress:
    external:
      gateways:
        - type: public
```

##### networkpolicy
Before:
```yaml
networkpolicy:
  enabled: true
```

After:
No changes in access-fields necessary. All ingress traffic are not allowed by default.


Before:
```yaml
networkpolicy:
  enabled: false
```

After:
Fields must be set for ingress and egress rules since all network traffic are blocked by default in v4 of chart.

##### egress
Before:
```yaml
egress:
- "ssb.no"
- "secretmanager.googleapis.com"
```

After:
```yaml
access:
  egress:
    external:
    - hosts:
        - "ssb.no"
        - "secretmanager.googleapis.com"
      ports:
        - name: https
          port: 443
          protocol: HTTPS
```

##### istioEndUserAuth
Before:
```yaml
istioEndUserAuth:
  audiences:
  - jupyterhub
  excludePaths:
  - "/api-docs"
  - "/api-docs/*"

```

After:
Issuer must be specified
```yaml
access:
  ingress:
    external:
      gateways:
        - type: public
          allow:
            - jwt:
                issuer: https://keycloak.ssb.no/auth/realms/ssb
                audiences:
                  - jupyterhub
            - paths: [ "/api-docs/", "/api-docs/*" ]
```

##### Not exposed, no istioEndUserAuth, nor egress
Before:
```yaml
istioEndUserAuth:
  enabled: false
exposed: false
egress: []
```

After
No changes to access fields are necessary as it is restrictive and does not allow traffic by default.


---


## v3.0.1

Updates in this release:
* Documentation changes only

---

## v3.0.0

Updates in this release:
* Restricted security context for containers
* Updated default pod securitycontext

---

## v2.3.4

Updates in this release:

* Major documentation update

---

## v2.3.3

Updates in this release:

* Fixes an issue where a custom path to metrics is not honored in all templates

---

## v2.3.2

Updates in this release:

* Removed the secrets injector.
* Added golden file tests.

---

## v2.3.1

Update release notes.

---

## v2.3.0

A ServiceEntry should only take effect in the namespace where it is defined.

This fixes an issue that a ServiceEntry from one namespace can interfere with the traffic of another namespace.

The "exportTo" configuration with a value of "." defines an export to the same namespace that the service is declared in.

---

## v2.2.0

Support for using Cloud SQL connectors instead of the CloudSql proxy.

Cloud SQL connectors support IamAuthentication which gives improved security over cloudSql proxy.
If you're using Go, Java, or Python, consider using the corresponding Cloud SQL connector which does everything the
proxy does:
https://github.com/GoogleCloudPlatform/cloud-sql-proxy/blob/main/README.md

Example:
```YAML
cloudsql:
  enabled: true
  useSqlProxy: false
```
Setting the `useSqlProxy` option to `false` will skip the addition of the cloudsql-proxy, but will keep the creation
of the `ServiceEntry` making it possible to connect to the Cloud SQL database. The value defaults to `true` if not
set, for backward compatibility.

If the developers opt to use IamAuthentication to the Cloud SQL database the cloudsql-proxy is not needed.
The reason for using IamAuthentication is to simplify setup by using IAM instead of username and password.

Docs on using IamAuthentication via the connectors from Google directly in-process:
https://cloud.google.com/sql/docs/postgres/iam-logins#python

Also, reverted the change introduced in v2.1.0 as it seems the use case for this setting in the cloudsql-proxy could
is intended for connecting from your local machine (a database tool for instance)

---

## v2.1.0

Support for setting the "-enable-iam-login" argument for
the cloudsql-proxy.

This setting enables Postgresql database auth using the Workload Identity SA for the application.
Note that the Sqluser must be created with "type: CLOUD_IAM_SERVICE_ACCOUNT" and the username
must be set to the Workload Identity SA without the .gserviceaccount.com suffix. Requires
cloudsql-proxy >= 1.20.

---

## v2.0.0

Moved ssb-chart to this Helm chart repository.

This helm chart can now be referenced with a repository URL:
```YAML
spec:
  chart:
    repository: "https://raw.githubusercontent.com/statisticsnorway/helm-charts/main/"
    name: "ssb-chart"
    version: 2.0.0
  releaseName: __your-app-name__
```

---

## v1.3.1

Support for passing a named HTTP cookie in the Nginx proxy.

---

## v1.3.0

- All boolean variables tested to work both as string and non-string values.

---

## v1.2.0

- Added support for custom application names/urlhosts. Follow [this link](https://github.com/statisticsnorway/ssb-developer-guide/blob/master/docs/deploy/gitops/helm-operator.md) for more information.

---

## v1.1.0

- Added support for custom subdomain name. Follow [this link](https://github.com/statisticsnorway/ssb-developer-guide/blob/master/docs/deploy/gitops/helm-operator.md) for more information.

---

## v1.0.0

- Initial release of ssb-chart
