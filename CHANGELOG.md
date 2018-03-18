# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Changed
- Content serving on root domain gets replaced by serving of a dedicated subdomain for RTM broker
  websockets. All unrelated traffic gets redirected to the root domain ([#1]).
- Interface for configuring TLS got simplified. Instead of `TLD_SSL_*` and `WILDCARD_SSL_*` a single
  configuration pattern is used: `TLS_*` ([#1]).

[#1]: https://gitlab.com/gfcc/dispatcher/issues/1
