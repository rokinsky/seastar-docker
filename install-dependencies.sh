#!/bin/bash
#
# This file is open source software, licensed to you under the terms
# of the Apache License, Version 2.0 (the "License").  See the NOTICE file
# distributed with this work for additional information regarding copyright
# ownership.  You may not use this file except in compliance with the License.
#
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

. /etc/os-release

# seastar doesn't directly depend on these packages. They are
# needed because we want to link seastar statically and pkg-config
# has no way of saying "static seastar, but dynamic transitive
# dependencies". They provide the various .so -> .so.ver symbolic
# links.
transitive=(libtool-ltdl-devel trousers-devel libidn2-devel libunistring-devel)

redhat_packages=(
    hwloc-devel
    numactl-devel
    libpciaccess-devel
    cryptopp-devel
    libxml2-devel
    xfsprogs-devel
    gnutls-devel
    lksctp-tools-devel
    lz4-devel
    gcc
    make
    protobuf-devel
    protobuf-compiler
    systemtap-sdt-devel
    libtool
    cmake
    yaml-cpp-devel
    c-ares-devel
    stow
    diffutils
    "${transitive[@]}"
)

fedora_packages=(
    "${redhat_packages[@]}"
    gcc-c++
    ninja-build
    ragel
    boost-devel
    fmt-devel
    libubsan
    libasan
    libatomic
    valgrind-devel
)

if [ "$ID" = "fedora" ]; then
    dnf install -y "${fedora_packages[@]}"
else
    echo "Your system ($ID) is not supported by this script. Please install dependencies manually."
    exit 1
fi
