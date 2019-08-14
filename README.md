# RealMQ dispatcher
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Frealmq%2Frealmq-dispatcher.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2Frealmq%2Frealmq-dispatcher?ref=badge_shield)


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
| **DASHBOARD_HOST** | Hostname of dashboard service, default: `dashboard`. |
| **DASHBOARD_PORT** | Port of dashboard service, default: `8080`. |

## TLS Configuration
Links for tweaking ssl configuration:
- [Mozilla SSL Generator](https://mozilla.github.io/server-side-tls/ssl-config-generator/)
- [Android Version Distribution](https://developer.android.com/about/dashboards/index.html)
- [Client TLS Support](https://www.ssllabs.com/ssltest/clients.html)

## License
Copyright (c) 2018-2019 RealMQ GmbH.<br />
The files in this archive are released under the [MIT License](LICENSE).
<br />
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Frealmq%2Frealmq-dispatcher.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2Frealmq%2Frealmq-dispatcher?ref=badge_large)
