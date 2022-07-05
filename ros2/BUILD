package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")

ARCHITECTURES = ["amd64"]
DISTROS = ["debian11"]

[
    container_image(
        name = ("ros2" if (not mode) else mode[1:]) + "_root_" + arch + "_" + distro,
        architecture = arch,
        base = ("@py3" + ("" if (not mode) else ("_" + mode[1:])) + "_image_base//image"),
        debs = [
            "@amd64_debian11_libpython3.9//file",
            "@amd64_debian11_libtinyxml2-8//file",
            "@amd64_debian11_libfmt7//file",
        ],
    )
    for mode in [
        "",
        ":debug",
    ]
    for arch in ARCHITECTURES
    for distro in DISTROS
]


[
    genrule(
        name = "ld_so_cache_" + arch + "_tar",
        srcs = [":ld.so." + arch + ".cache"],
        outs = ["ld_so_" + arch + "_cache.tar"],
        cmd = "$(location :make_ld_so_cache_tar.py) $(SRCS) $(OUTS)",
        tools = [":make_ld_so_cache_tar.py"],
    )
    for arch in ARCHITECTURES
]

[
    sh_binary(
        name = "generate_ldconfig_" + arch + "_cache",
        srcs = ["generate_ldconfig_cache.py"],
        data = [":python3_root_" + arch + "_debian11"],
        tags = [
            "manual",
            arch,
        ],
    )
    for arch in ARCHITECTURES
]

[
    genrule(
        name = "ld_so_cache_" + arch + "_new",
        srcs = [":python3_root_" + arch + "_debian11"],
        outs = ["ld.so.cache." + arch + ".new"],
        cmd = "$(location :generate_ldconfig_" + arch + "_cache) " + arch + " $(OUTS)",
        tags = [
            "manual",
            arch,
        ],
        tools = [":generate_ldconfig_" + arch + "_cache"],
    )
    for arch in ARCHITECTURES
]

[
    sh_test(
        name = "check_ld_so_" + arch + "_cache",
        srcs = ["check_ld_so_cache.py"],
        args = [
            "$(location :ld.so." + arch + ".cache)",
            "$(location :ld.so.cache." + arch + ".new)",
        ],
        data = [
            ":ld.so." + arch + ".cache",
            ":ld.so.cache." + arch + ".new",
        ],
        tags = [
            "manual",
            arch,
        ],
    )
    for arch in ARCHITECTURES
]

[
    container_test(
        name = "python3_" + user + "_" + arch + "_" + distro + "_test",
        size = "medium",
        configs = ["testdata/python3.yaml"],
        image = ":python3_" + user + "_" + arch + "_" + distro,
        tags = [
            "manual",
            arch,
        ],
    )
    for arch in ARCHITECTURES
    for user in [
        "root",
#        "nonroot",
    ]
    for distro in DISTROS
]

# tests for version-specific things
[
    container_test(
        name = "version_specific_" + user + "_" + arch + "_" + distro + "_test",
        size = "medium",
        configs = ["testdata/" + distro + ".yaml"],
        image = ":python3_" + user + "_" + arch + "_" + distro,
        tags = [
            "manual",
            arch,
        ],
    )
    for arch in ARCHITECTURES
    for user in [
        "root",
#        "nonroot",
    ]
    for distro in DISTROS
]