# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Changed
- Release the files in this archive under the [MIT License](LICENSE).

## [0.8.0] - 2018-06-29
### Changed
- Adjust internal workings to new platform.

## [0.7.0] - 2018-05-01
### Changed
- Rename gfcc to realmq ([#1])

[#1]: https://github.com/realmq/dispatcher/issues/1

## [0.6.0] - 2018-03-26
### Changed
- Content serving on root domain gets replaced by serving of a dedicated subdomain for RTM broker
  websockets. All unrelated traffic gets redirected to the root domain ([#1]).
- Interface for configuring TLS got simplified. Instead of `TLD_SSL_*` and `WILDCARD_SSL_*` a single
  configuration pattern is used: `TLS_*` ([#1]).

[#1]: https://gitlab.com/gfcc/dispatcher/issues/1

## [0.5.0] - 2017-06-23
### Changed
- Redirect all unsecure traffic to related TLS endpoints ([green-field#49]).

[green-field#49]: https://gitlab.com/gfcc/green-field/issues/49

## [0.4.0] - 2017-02-13
### Added
- Requests forwared to api contain now `Host` and `X-Forwared-For` header
  fields.

## [0.3.0] - 2016-10-31
### Added
- GitLab CI configuration for building container images
- Container images are include vendor and version labels

## [0.2.0] - 2016-06-01
### Added
- Simple TLS setup
- Dedicated subdomain for API reverse proxy

## [0.1.0] - 2016-06-01
### Added
- Simple webserver setup

[Unreleased]: https://github.com/realmq/dispatcher/compare/0.8.0...HEAD
[0.8.0]: https://github.com/realmq/dispatcher/compare/0.7.0...0.8.0
[0.7.0]: https://github.com/realmq/dispatcher/compare/0.6.0...0.7.0
[0.6.0]: https://github.com/realmq/dispatcher/compare/0.5.0...0.6.0
[0.5.0]: https://github.com/realmq/dispatcher/compare/0.4.0...0.5.0
[0.4.0]: https://github.com/realmq/dispatcher/compare/0.3.0...0.4.0
[0.3.0]: https://github.com/realmq/dispatcher/compare/0.2.0...0.3.0
[0.2.0]: https://github.com/realmq/dispatcher/compare/0.1.0...0.2.0
[0.1.0]: https://github.com/realmq/dispatcher/compare/e6fe1e10...0.1.0
