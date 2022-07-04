# getting-started-with-bazel
Some example with bazel

## Build
```bash
bazel build //...
```

## Links
* [rules_docker](https://github.com/bazelbuild/rules_docker)
* [rules_docker documentation](https://docs.aspect.build/bazelbuild/rules_docker/454981e65fa100d37b19210ee85fedb2f7af9626/readme)
* [examples](https://github.com/bazelbuild/rules_docker/tree/master/testing/examples)
* [custom base](https://github.com/bazelbuild/rules_docker#go_image-custom-base)

## Three Types of rules
* [Basic Rules](https://github.com/bazelbuild/rules_docker#basic-rules). This repository contains a set of rules for pulling down base images, augmenting them with build artifacts and assets, and publishing those images. These rules do not require / use Docker for pulling, building, or pushing images.
  * container_image (example)
  * container_bundle (example)
  * container_import
  * container_load
  * container_pull (example)
  * container_push (example)
* [Language Rules](https://github.com/bazelbuild/rules_docker#language-rules)
  * py_image (signature)
  * py3_image (signature)
  * nodejs_image (usage)
  * java_image (signature)
  * war_image (signature)
  * scala_image (signature)
  * groovy_image (signature)
  * cc_image (signature)
  * go_image (signature)
  * rust_image (signature)
  * d_image (signature)
* [Docker Rules](https://github.com/bazelbuild/rules_docker#docker-rules).This repo now includes rules that provide additional functionality to install packages and run commands inside docker containers. 
  * Package manager rules: rules to install apt-get packages.
  * Docker run rules: rules to run commands inside docker containers.