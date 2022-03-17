fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios localbeta

```sh
[bundle exec] fastlane ios localbeta
```

Increment version, build app, push a new beta build to TestFlight, update branch

### ios risebeta

```sh
[bundle exec] fastlane ios risebeta
```

From bitrise, increment version, build app, push a new beta build to TestFlight, update branch

### ios incrementvb

```sh
[bundle exec] fastlane ios incrementvb
```



### ios build_and_deploy

```sh
[bundle exec] fastlane ios build_and_deploy
```



### ios commit_and_push

```sh
[bundle exec] fastlane ios commit_and_push
```



### ios certificate_and_provisioning

```sh
[bundle exec] fastlane ios certificate_and_provisioning
```



### ios code_signing

```sh
[bundle exec] fastlane ios code_signing
```



### ios inctest

```sh
[bundle exec] fastlane ios inctest
```



### ios incrementtest

```sh
[bundle exec] fastlane ios incrementtest
```



### ios beta

```sh
[bundle exec] fastlane ios beta
```

Push a new beta build to TestFlight

### ios testversion

```sh
[bundle exec] fastlane ios testversion
```



----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
