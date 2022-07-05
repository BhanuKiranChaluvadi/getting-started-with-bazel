package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//container:container.bzl", "container_bundle")

ARCHITECTURES = ["amd64"]
DISTROS = ["debian11"]

LABEL_USERS = [
    ("latest", "root"),
#    ("nonroot", "nonroot"),
]

ROS2 = {
    "{REGISTRY}/{PROJECT_ID}/ros2:" + tag_base + "-" + arch: "//ros2:" + label + "_" + user + "_" + arch + "_debian11"
    for arch in ARCHITECTURES
    for (tag_base, label, user) in [
        ("latest", "ros2", "root"),
#        ("nonroot", "ros2", "nonroot"),
        ("debug", "debug", "root"),
#        ("debug-nonroot", "debug", "nonroot"),
    ]
}

ROS2.update({
    "{REGISTRY}/{PROJECT_ID}/ros2-" + distro + ":" + tag_base + "-" + arch: "//ros2:" + label + "_" + user + "_" + arch + "_" + distro
    for arch in ARCHITECTURES
    for (tag_base, label, user) in [
        ("latest", "ros2", "root"),
#        ("nonroot", "ros2", "nonroot"),
        ("debug", "debug", "root"),
#        ("debug-nonroot", "debug", "nonroot"),
    ]
    for distro in DISTROS
})

ALL = {}

ALL.update(ROS2)

container_bundle(
    name = "all",
    images = ALL,
)

load("@io_bazel_rules_docker//contrib:push-all.bzl", "container_push")

container_push(
    name = "publish",
    bundle = ":all",
    format = "Docker",
    # Push images sequentially, to avoid a bug in rules_docker related to
    # pushing many images in parallel.
    # https://github.com/bazelbuild/rules_docker/issues/525
    sequential = True,
)