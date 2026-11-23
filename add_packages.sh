#!/usr/bin/env bash
set -euo pipefail

echo "Generating 30 MUR package manifests..."

mkdir -p "packages/curl"
cat << 'EOF' > "packages/curl/mur.pkg"
name=curl
version=8.21.0
arch=x86_64
license=MIT
description=Command-line tool for transferring data with URLs
url=https://github.com/moparisthebest/static-curl/releases/latest/download/curl-amd64
bin=curl
EOF

mkdir -p "packages/aria2c"
cat << 'EOF' > "packages/aria2c/mur.pkg"
name=aria2c
version=1.37.0
arch=x86_64
license=GPL-2.0
description=Lightweight multi-protocol command-line download utility
url=https://github.com/borestad/static-binaries/raw/main/x86_64/aria2c
bin=aria2c
EOF

mkdir -p "packages/socat"
cat << 'EOF' > "packages/socat/mur.pkg"
name=socat
version=1.8.0.0
arch=x86_64
license=GPL-2.0
description=Multipurpose relay for bidirectional data transfer between channels
url=https://github.com/ryanwoodsmall/static-binaries/raw/master/x86_64/socat
bin=socat
EOF

mkdir -p "packages/nc"
cat << 'EOF' > "packages/nc/mur.pkg"
name=nc
version=1.10
arch=x86_64
license=BSD-3-Clause
description=TCP/IP swiss army knife for network connections
url=https://github.com/ryanwoodsmall/static-binaries/raw/master/x86_64/nc
bin=nc
EOF

mkdir -p "packages/rsync"
cat << 'EOF' > "packages/rsync/mur.pkg"
name=rsync
version=3.3.0
arch=x86_64
license=GPL-3.0
description=Fast incremental file transfer and synchronization utility
url=https://github.com/ryanwoodsmall/static-binaries/raw/master/x86_64/rsync
bin=rsync
EOF

mkdir -p "packages/nmap"
cat << 'EOF' > "packages/nmap/mur.pkg"
name=nmap
version=7.80
arch=x86_64
license=NPSL
description=Network exploration tool and security port scanner
url=https://github.com/alex-sector/static-binaries/raw/main/x86_64/nmap
bin=nmap
EOF

mkdir -p "packages/tcpdump"
cat << 'EOF' > "packages/tcpdump/mur.pkg"
name=tcpdump
version=4.99.0
arch=x86_64
license=BSD-3-Clause
description=Command-line packet analyzer for network traffic debugging
url=https://github.com/alex-sector/static-binaries/raw/main/x86_64/tcpdump
bin=tcpdump
EOF

mkdir -p "packages/vim"
cat << 'EOF' > "packages/vim/mur.pkg"
name=vim
version=9.1
arch=x86_64
license=ISC
description=Lightweight modal text editor (neatvi static build)
url=https://github.com/ryanwoodsmall/static-binaries/raw/master/x86_64/neatvi
bin=vim
EOF

mkdir -p "packages/tmux"
cat << 'EOF' > "packages/tmux/mur.pkg"
name=tmux
version=3.4
arch=x86_64
license=ISC
description=Terminal multiplexer for managing multiple shell sessions
url=https://github.com/ryanwoodsmall/static-binaries/raw/master/x86_64/tmux
bin=tmux
EOF

mkdir -p "packages/screen"
cat << 'EOF' > "packages/screen/mur.pkg"
name=screen
version=4.9.1
arch=x86_64
license=GPL-3.0
description=Full-screen window manager multiplexing a physical terminal
url=https://github.com/ryanwoodsmall/static-binaries/raw/master/x86_64/screen
bin=screen
EOF

mkdir -p "packages/less"
cat << 'EOF' > "packages/less/mur.pkg"
name=less
version=643
arch=x86_64
license=GPL-3.0
description=Terminal pager program for viewing text files screen by screen
url=https://github.com/ryanwoodsmall/static-binaries/raw/master/x86_64/less
bin=less
EOF

mkdir -p "packages/rlwrap"
cat << 'EOF' > "packages/rlwrap/mur.pkg"
name=rlwrap
version=0.46.1
arch=x86_64
license=GPL-2.0
description=Readline wrapper adding line editing and history to CLI tools
url=https://github.com/ryanwoodsmall/static-binaries/raw/master/x86_64/rlwrap
bin=rlwrap
EOF

mkdir -p "packages/jq"
cat << 'EOF' > "packages/jq/mur.pkg"
name=jq
version=1.8.2
arch=x86_64
license=MIT
description=Lightweight and flexible command-line JSON processor
url=https://github.com/jqlang/jq/releases/latest/download/jq-linux-amd64
bin=jq
EOF

mkdir -p "packages/yq"
cat << 'EOF' > "packages/yq/mur.pkg"
name=yq
version=4.44.3
arch=x86_64
license=MIT
description=Portable command-line YAML, JSON, and XML processor
url=https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64
bin=yq
EOF

mkdir -p "packages/bat"
cat << 'EOF' > "packages/bat/mur.pkg"
name=bat
version=0.24.0
arch=x86_64
license=MIT
description=Cat clone with syntax highlighting and Git integration
url=https://github.com/borestad/static-binaries/raw/main/x86_64/bat
bin=bat
EOF

mkdir -p "packages/rg"
cat << 'EOF' > "packages/rg/mur.pkg"
name=rg
version=14.1.1
arch=x86_64
license=MIT
description=Recursively searches directories for a regex pattern at blazing speed
url=https://github.com/borestad/static-binaries/raw/main/x86_64/rg
bin=rg
EOF

mkdir -p "packages/fd"
cat << 'EOF' > "packages/fd/mur.pkg"
name=fd
version=10.2.0
arch=x86_64
license=MIT
description=Simple, fast and user-friendly alternative to find
url=https://github.com/borestad/static-binaries/raw/main/x86_64/fd
bin=fd
EOF

mkdir -p "packages/fzf"
cat << 'EOF' > "packages/fzf/mur.pkg"
name=fzf
version=0.55.0
arch=x86_64
license=MIT
description=General-purpose command-line fuzzy finder
url=https://github.com/borestad/static-binaries/raw/main/x86_64/fzf
bin=fzf
EOF

mkdir -p "packages/ag"
cat << 'EOF' > "packages/ag/mur.pkg"
name=ag
version=2.2.0
arch=x86_64
license=Apache-2.0
description=The Silver Searcher fast code searching tool
url=https://github.com/ryanwoodsmall/static-binaries/raw/master/x86_64/ag
bin=ag
EOF

mkdir -p "packages/mlr"
cat << 'EOF' > "packages/mlr/mur.pkg"
name=mlr
version=6.12.0
arch=x86_64
license=BSD-2-Clause
description=Miller awk, sed, cut, join, and sort for CSV/JSON data
url=https://github.com/ryanwoodsmall/static-binaries/raw/master/x86_64/mlr
bin=mlr
EOF

mkdir -p "packages/zstd"
cat << 'EOF' > "packages/zstd/mur.pkg"
name=zstd
version=1.5.6
arch=x86_64
license=BSD-3-Clause
description=Fast lossless compression algorithm targeting real-time scenarios
url=https://github.com/borestad/static-binaries/raw/main/x86_64/zstd
bin=zstd
EOF

mkdir -p "packages/xz"
cat << 'EOF' > "packages/xz/mur.pkg"
name=xz
version=5.6.2
arch=x86_64
license=0BSD
description=General-purpose data compression utility with high compression ratio
url=https://github.com/ryanwoodsmall/static-binaries/raw/master/x86_64/xz
bin=xz
EOF

mkdir -p "packages/bsdtar"
cat << 'EOF' > "packages/bsdtar/mur.pkg"
name=bsdtar
version=3.7.4
arch=x86_64
license=BSD-2-Clause
description=Multi-format archive and compression utility (tar, zip, iso, cpio)
url=https://github.com/ryanwoodsmall/static-binaries/raw/master/x86_64/bsdtar
bin=bsdtar
EOF

mkdir -p "packages/pv"
cat << 'EOF' > "packages/pv/mur.pkg"
name=pv
version=1.8.12
arch=x86_64
license=GPL-3.0
description=Pipe Viewer terminal tool for monitoring data progress through pipelines
url=https://github.com/ryanwoodsmall/static-binaries/raw/master/x86_64/pv
bin=pv
EOF

mkdir -p "packages/htop"
cat << 'EOF' > "packages/htop/mur.pkg"
name=htop
version=3.3.0
arch=x86_64
license=GPL-2.0
description=Interactive text-mode process viewer and system monitor
url=https://github.com/borestad/static-binaries/raw/main/x86_64/htop
bin=htop
EOF

mkdir -p "packages/strace"
cat << 'EOF' > "packages/strace/mur.pkg"
name=strace
version=6.10
arch=x86_64
license=LGPL-2.1
description=Diagnostic and debugging userspace tracer for Linux syscalls
url=https://github.com/ryanwoodsmall/static-binaries/raw/master/x86_64/strace
bin=strace
EOF

mkdir -p "packages/patchelf"
cat << 'EOF' > "packages/patchelf/mur.pkg"
name=patchelf
version=0.18.0
arch=x86_64
license=GPL-3.0
description=Utility to modify the dynamic linker and RPATH of ELF executables
url=https://github.com/ryanwoodsmall/static-binaries/raw/master/x86_64/patchelf
bin=patchelf
EOF

mkdir -p "packages/entr"
cat << 'EOF' > "packages/entr/mur.pkg"
name=entr
version=5.6
arch=x86_64
license=ISC
description=Run arbitrary commands when files change
url=https://github.com/ryanwoodsmall/static-binaries/raw/master/x86_64/entr
bin=entr
EOF

mkdir -p "packages/bc"
cat << 'EOF' > "packages/bc/mur.pkg"
name=bc
version=1.07.1
arch=x86_64
license=GPL-3.0
description=Arbitrary precision numeric processing calculator language
url=https://github.com/borestad/static-binaries/raw/main/x86_64/bc
bin=bc
EOF

mkdir -p "packages/make"
cat << 'EOF' > "packages/make/mur.pkg"
name=make
version=4.4.1
arch=x86_64
license=GPL-3.0
description=GNU Make build automation tool for compiling projects
url=https://github.com/ryanwoodsmall/static-binaries/raw/master/x86_64/make
bin=make
EOF

echo "Done! All 30 packages created under packages/."


