vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO ahsonkhan/azure-sdk-for-cpp
    REF azure-sdk-GA-usability
    SHA512 d36fb56c5e0626010117cb37fbbde1fc7c81a4ce60be32c330a173aa9a7e3c44fb8bc2c1df6302d43ebb5c823db81957a9845fbe6b74d31394a8e431ed6d0d82
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}/sdk/storage/azure-storage-files-shares/
    PREFER_NINJA
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_install_cmake()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_fixup_cmake_targets()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
