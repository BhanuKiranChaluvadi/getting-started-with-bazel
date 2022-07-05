# AUTO GENERATED
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

def repositories():
    http_file(
        name = "amd64_debian11_libpython3.9",
        downloaded_file_path = "libpython3.9_3.9.2-1_amd64.deb",
        sha256 = "97647869e7e9db643a7eeab949b7d140f9a175814fcc94289be70d426aa5fd1a",
        urls = ["https://snapshot.debian.org/archive/debian/20220611T211102Z/pool/main/p/python3.9/libpython3.9_3.9.2-1_amd64.deb"],
    )

    http_file(
        name = "amd64_debian11_libtinyxml2-8",
        downloaded_file_path = "libtinyxml2-8_8.0.0+dfsg-2_amd64.deb",
        sha256 = "6e078ea205a28f315b9ce74f1458a9d8be0a74a6c5f67be067a2265bc05f5723",
        urls = ["https://snapshot.debian.org/archive/debian/20220611T211102Z/pool/main/t/tinyxml2/libtinyxml2-8_8.0.0+dfsg-2_amd64.deb"],
    )

    http_file(
        name = "amd64_debian11_libfmt7",
        downloaded_file_path = "libfmt7_7.1.3+ds1-5_amd64.deb",
        sha256 = "d6348fcda5f44d4808b7538fd6f580143b65bb1063e4db89890b9263514d7523",
        urls = ["https://snapshot.debian.org/archive/debian/20220611T211102Z/pool/main/f/fmtlib/libfmt7_7.1.3+ds1-5_amd64.deb"],
    )