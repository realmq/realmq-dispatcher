# Greenfield dispatcher

## Environment Variables

| VAR   |  Description |
|-------|--------------| 
| **TLD** | The greenfield toplevel domain. |
| **TLD_SSL_CERT** | Path to the toplevel domain ssl certificate. |
| **TLD_SSL_CERT_KEY** | Path to the toplevel domain ssl certificate key. |
| **TLD_SSL_CERT_ROOT** | Root certificate chain used for oscp stapling. |
| **WILDCARD_SSL_CERT** | Path to the wildcard (\*.tld) ssl certificate. |
| **WILDCARD_SSL_CERT_KEY** | Path to the wildcard (\*.tld) ssl certificate key. |
| **WILDCARD_SSL_CERT_ROOT** | Root certificate chain used for oscp stapling. |

## TLS Configuration
Links for tweaking ssl configuration:
- [Mozilla SSL Generator](https://mozilla.github.io/server-side-tls/ssl-config-generator/)
- [Android Version Distribution](https://developer.android.com/about/dashboards/index.html)
- [Client TLS Support](https://www.ssllabs.com/ssltest/clients.html)

## Changelog
### 0.5.0
- Expose MQTT websocket endpoint: `/mqtt`
- TLS/HTTPS only setup
