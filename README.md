# RealMQ dispatcher

## Environment Variables

| VAR   |  Description |
|-------|--------------| 
| **TLD** | The RealMQ toplevel domain. |
| **TLS_CERT** | Path to the TLS certificate covering all subdomains. |
| **TLS_CERT_KEY** | Path to the TLS certificate key covering all subdomains. |
| **TLS_CERT_ROOT** | Root certificate chain used for oscp stapling. |
| **PLATFORM_HOST** | Hostname of platfrom service, default: `platform`. |
| **PLATFORM_PORT** | Port of platfrom service, default: `8080`. |
| **BROKER_HOST** | Hostname of broker service, default: `broker`. |
| **BROKER_PORT** | Port of broker service, default: `8080`. |


## TLS Configuration
Links for tweaking ssl configuration:
- [Mozilla SSL Generator](https://mozilla.github.io/server-side-tls/ssl-config-generator/)
- [Android Version Distribution](https://developer.android.com/about/dashboards/index.html)
- [Client TLS Support](https://www.ssllabs.com/ssltest/clients.html)
