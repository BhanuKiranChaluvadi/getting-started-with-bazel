load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load("@io_bazel_rules_docker//docker/package_managers:download_pkgs.bzl", "download_pkgs")
load("@io_bazel_rules_docker//docker/package_managers:install_pkgs.bzl", "install_pkgs")

download_pkgs(
    name = "ros2_humble_pkgs",
    image_tar = "@debian11-slim//image",
    packages = [
        "libpython3.9",
        "libtinyxml2-8",
        "libfmt7",
    ],
)

'''
download_pkgs(
    name = "ros2_humble_pkgs",
    image_tar = "@python3-debian11//image",
    packages = [
        "libpython3.9",
        "libtinyxml2-8",
        "libfmt7",
    ],
)

install_pkgs(
    name = "ros2_pkgs_image",
    image_tar = "@python3-debian11//image",
    installables_tar = ":ros2_humble_pkgs.tar",
    installation_cleanup_commands = "rm -rf /var/lib/apt/lists/*",
    output_image_name = "java_python_pkgs_image",
)
'''
