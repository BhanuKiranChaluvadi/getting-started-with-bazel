workspace(name = "distroless")

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
	"@io_bazel_rules_docker//repositories:deps.bzl", 
	container_deps = "deps",
)
container_deps()

# load distroless py images
load(
	"@io_bazel_rules_docker//python3:image.bzl",
	 _python_image_repos = "repositories"
)
_python_image_repos()

# load archive file
load(
	":debian_archives.bzl",
	debian_repositories = "repositories"
)
debian_repositories()