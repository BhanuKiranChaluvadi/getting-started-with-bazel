load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "b1e80761a8a8243d03ebca8845e9cc1ba6c82ce7c5179ce2b295cd36f7e394bf",
    urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.25.0/rules_docker-v0.25.0.tar.gz"],
)

load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)
container_repositories()

load(
    "@io_bazel_rules_docker//repositories:go_repositories.bzl",
    container_go_deps = "go_deps",
)
container_go_deps()

load(
	"@io_bazel_rules_docker//repositories:deps.bzl", 
	container_deps = "deps",
)
container_deps()

load("@io_bazel_rules_docker//container:container.bzl", "container_pull")
load("@io_bazel_rules_docker//python3:image.bzl", _python_image_repos = "repositories")

_python_image_repos()

container_pull(
	name = "python3-debian11",
	registry = "gcr.io",
	repository = "distroless/python3-debian11",
	digest = "sha256:acdc2936c01fe4db3f3b9c6fd23fc24132f1e6fda0ce5504ed07a97c2371efab",
	tag = "latest",
)

container_pull(
	name = "debian11-slim",
	registry = "docker.io",
	repository = "library/debian",
	digest = "sha256:d2285c63f42a27d633afa75929529c3761883faac292e7c1cf310d91c7399863",
	tag = "11-slim",
)