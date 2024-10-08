# Changelog
All notable changes to this project will be documented in this file.

Since version 3.0.0, the format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Added
### Changed
### Fixed
### Removed

## 3.1.1 - 2024-09-25
- COVERAGE:  91.81% -- 3520/3834 lines in 49 files
- BRANCH COVERAGE:  87.03% -- 1074/1234 branches in 49 files
- 63.08% documented
### Added
- Improved Documentation
### Fixed
- Documentation typos
- Documentation in Yard (on RubyDoc.info)

## 3.1.0 - 2024-09-24
- COVERAGE:  91.81% -- 3520/3834 lines in 49 files
- BRANCH COVERAGE:  87.03% -- 1074/1234 branches in 49 files
- 63.08% documented
### Removed
- Direct dependency on logger, rexml, net-http, & uri
  - these stdlib gems became deprecated in favor of the stand alone versions in Ruby 3.3
  - they will begin to raise an error in Ruby 3.5.
  - Downstream code should add them explicitly to move away from the stdlib versions sooner than Ruby 3.5
  - Ref: https://github.com/rubygems/rubygems/issues/7178#issuecomment-2372558363

## 3.0.3 - 2024-09-24
### Fixed
- Add logger gem for Ruby 3.5 compatibility
- Restrict minitest to < 6, because first we must use assert_nil if expecting nil

## 3.0.2 - 2024-09-24
- COVERAGE:  91.72% -- 3522/3840 lines in 49 files
- BRANCH COVERAGE:  87.03% -- 1074/1234 branches in 49 files
- 63.08% documented
### Added
- Automatic loading via bundler

## 3.0.1 - 2024-09-20
- COVERAGE:  91.72% -- 3521/3839 lines in 48 files
- BRANCH COVERAGE:  87.03% -- 1074/1234 branches in 48 files
- 63.08% documented
### Added
- More and better documentation
### Fixed
- Code coverage reporting in specs
- Markdown formatting in documentation
- Rake tasks for generating yard documentation
- Added undeclared runtime dependencies:
  - `rexml`
  - `net-http` - removed from stdlib in Ruby 3.0
- Copyright years in LICENSE.txt

## 3.0.0 - 2024-09-04
- 3839 relevant lines, 3521 lines covered and 318 lines missed. ( 91.72% )
- 1234 total branches, 1073 branches covered and 161 branches missed. ( 86.95% )
### Fixed
- Compatibility with Ruby 2.7+
### Removed
- Support for Ruby < 2.7

## 2.9.2

* Perform all checks before verifying endpoints.
  [#126](https://github.com/oauth-xx/ruby-openid2/pull/126)

## 2.9.1

* Updated CHANGELOG.md

## 2.9.0

* Remove deprecated `autorequire` from gemspec.
  [#123](https://github.com/oauth-xx/ruby-openid2/pull/123)
* Rescue from `Yadis::XRI::XRIHTTPError` on discovery.
  [#106](https://github.com/oauth-xx/ruby-openid2/pull/106)
* Avoid SSRF for claimed_id request.
  [#121](https://github.com/oauth-xx/ruby-openid2/pull/121)
* Updated documentation.
  [#115](https://github.com/oauth-xx/ruby-openid2/pull/115), [#116](https://github.com/oauth-xx/ruby-openid2/pull/116), [#117](https://github.com/oauth-xx/ruby-openid2/pull/117), [#118](https://github.com/oauth-xx/ruby-openid2/pull/118)
* Reduce warnings output in test runs.
  [#119](https://github.com/oauth-xx/ruby-openid2/pull/119)
* Drop deprecated option from gemspec.
  [#120](https://github.com/oauth-xx/ruby-openid2/pull/120)
* Remove circular require.
  [#113](https://github.com/oauth-xx/ruby-openid2/pull/113)
* Updated Travis CI config with Ruby 2.6
  [#114](https://github.com/oauth-xx/ruby-openid2/pull/114)
* Simplify Bundler require; remove need for extra `:require`.
  [#112](https://github.com/oauth-xx/ruby-openid2/pull/112)

## 2.8.0

* Fix `admin/mkassoc` script.
  See https://github.com/oauth-xx/ruby-openid2/pull/103
* Allow specifying timeout for `OpenID::StandardFetcher` in environment variables.
  See https://github.com/oauth-xx/ruby-openid2/pull/109
* Fixed some documentation.
  See https://github.com/oauth-xx/ruby-openid2/pull/111
* Fixed example server.
  See https://github.com/oauth-xx/ruby-openid2/pull/91
* Fixed tests.
  See https://github.com/oauth-xx/ruby-openid2/pull/86
* Misc. changes to the CI setup.
  See
  - https://github.com/oauth-xx/ruby-openid2/pull/110
  - https://github.com/oauth-xx/ruby-openid2/pull/108
  - https://github.com/oauth-xx/ruby-openid2/pull/107

## 2.7.0

* Use RFC 2396 compatible URI parser for trustroot - 7c84ec9ced3ccbdad575e02dbfa81e53b52f909e
  See https://github.com/oauth-xx/ruby-openid2/pull/85
* Use HMAC from OpenSSL rather than Digest - ce2e30d7ff3308f17ef7d8c19d6f4752f76c9c40
  See https://github.com/oauth-xx/ruby-openid2/pull/84
* Check if OpenSSL is loaded - 751e55820d958ee781f5abb466a576d83ddde6fd

## 2.6.0

* More safely build filenames - 1c4a90630b183e7572b8ab5f2e3a3e0c0fecd2c7
  See https://github.com/oauth-xx/ruby-openid2/pull/80
* The session serializer of Rails4.1 is json - b44a1eb511dec3be25a07930121bc80cacec0f1c
* Handle boolean value to fix signature issue - d65076269b77754da7db6e4b189edeeb9201600d
  See https://github.com/oauth-xx/ruby-openid2/pull/76

## 2.5.0

* Revert json serialization - 8dc60e553369df2300ebb4b83a29618aff643c2c
  See https://github.com/oauth-xx/ruby-openid2/pull/73

## 2.4.0

* Allow expecting a parameter to be nil during return_to verification - 708e992ab3e6c26d478283fc11faa6a0a74bfec0
* Serialize to objects that can be stored as json - db1d8f7b171a333dec4e861fe0fa53ac1d98b188
* Fixed missing XRDS HTTP header in sample provider - dc15fa07fd59fdcf46d659cce34c6ef7a6768fde

## 2.3.0

* Deprecated Ruby 1.8 support - 0694bebc83de0313cfef73a5d0ffd9a293ae71a0
* Fixed encoding errors in test suite - 7ac8e3978f9c733bd5ee8d6b742b515b5427ded2
* Be aware when using Hash or Array as default value for unknown Hash keys - #58
* Stop overwriting String#starts_with? and String#ends_with? if defined - #55
* Ignore Associations For OpenID2 (Google's Security Bug Fix) - #53
* Change "oauth" to "ui" in variable name in the UI extension - #52
* Eliminating runtime warnings - #50 #56
* Upgrade example Rails provider/consumer app to Rails 3 - #49

## 2.2.3

* Fixed 'invalid byte sequence in UTF-8' error in parse_link_attrs - 0f46921a97677b83b106366c805063105c5e9f20
* Fixed license information in gemspec - f032e949e1ca9078ab7508d9629398ca2c36980a
* Update starts/ends_with? to handle nil prefix - beee5e8d1dc24ad55725cfcc720eefba6bdbd279

## 2.2.2

* Limit fetching file size & disable XML entity expansion - be2bab5c21f04735045e071411b349afb790078f

  Avoid DoS attack to RPs using large XRDS / too many XML entity expansion in XRDS.

## 2.2.1

* Make bundle exec rake work - 2100f281172427d1557ebe76afbd24072a22d04f
* State license in gemspec for automated tools / rubygems.org page - 2d5c3cd8f2476b28d60609822120c79d71919b7b
* Use default-external encoding instead of ascii for badly encoded pages - a68d2591ac350459c874da10108e6ff5a8c08750
* Colorize output and reveal tests that never ran - 4b0143f0a3b10060d5f52346954219bba3375039

## 2.2.0

* Bundler compatibility and bundler gem tasks - 72d551945f9577bf5d0e516c673c648791b0e795
* register_namespace_alias for AX message - aeaf050d21aeb681a220758f1cc61b9086f73152
* Fixed JRuby (1.9 mode) incompatibilty - 40baed6cf7326025058a131c2b76047345618539
* Added UI extension support - a276a63d68639e985c1f327cf817489ccc5f9a17
* Add attr_reader for setup_url on SetupNeededResponse - 75a7e98005542ede6db3fc7f1fc551e0a2ca044a
* Encode form inputs - c9e9b5b52f8a23df3159c2387b6330d5df40f35b
* Fixed cleanup AR associations whose expiry is past, not upcoming - 2265179a6d5c8b51ccc741180db46b618dd3caf9
* Fixed issue with Memcache store and Dalli - ef84bf73da9c99c67b0632252bf0349e2360cbc7
* Improvements to ActiveRecordStore's gc rake task - 847e19bf60a6b8163c1e0d2e96dbd805c64e2880
