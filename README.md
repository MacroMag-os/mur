# MUR — MacroMag User Repository

[![DOI](https://zenodo.org/badge/1421486557.svg)](https://doi.org/10.5281/zenodo.24201693)

[![OpenSSF Best Practices](https://www.bestpractices.dev/projects/16688/badge)](https://www.bestpractices.dev/projects/16688)
[![Language: Rust & C](https://img.shields.io/badge/Language-Rust%20%26%20C-dea584.svg)](#)
[![Zero Telemetry](https://img.shields.io/badge/Telemetry-Zero-brightgreen.svg)](#)
[![Build MacroMag ISO](https://github.com/MacroMag-os/MacroMag-32/actions/workflows/release.yml/badge.svg)](https://github.com/MacroMag-os/MacroMag-32/actions/workflows/release.yml)
[![GitHub Stars](https://img.shields.io/github/stars/MacroMag-os/MacroMag-32?style=social)](https://github.com/MacroMag-os/MacroMag-32/stargazers)
[![GitHub Forks](https://img.shields.io/github/forks/MacroMag-os/MacroMag-32?style=social)](https://github.com/MacroMag-os/MacroMag-32/network/members)
[![GitHub Issues](https://img.shields.io/github/issues/MacroMag-os/MacroMag-32)](https://github.com/MacroMag-os/MacroMag-32/issues)
[![Last Commit](https://img.shields.io/github/last-commit/MacroMag-os/MacroMag-32)](https://github.com/MacroMag-os/MacroMag-32/commits/main)
[![Open Collective](https://img.shields.io/opencollective/all/macromag?label=Open%20Collective)](https://opencollective.com/macromag)

**MUR (MacroMag User Repository)** is the official, community-driven package ecosystem for **MacroMag OS**. Inspired by the Arch User Repository (AUR), MUR replaces fragile Bash build scripts with clean, declarative package manifests (`mur.pkg`) designed for deterministic, zero-telemetry execution on `x86_64` and `RISC-V` architectures.

---
## How to Add New Tools to MUR

Because MacroMag OS relies on self-contained, statically linked binaries (compiled with `musl`, Go, or Rust) instead of a legacy GNU userland, packages are structured as simple manifest files pointing directly to raw executables.

### Step 1: Create a Package Directory

Create a directory under `packages/` named after your tool, containing a `mur.pkg` manifest file:

```text
packages/
└── <package-name>/
    └── mur.pkg
```

### Step 2: Write the `mur.pkg` Manifest

The `url` field must point directly to a raw, executable binary rather than an archive format like `.tar.gz` or `.zip`.

```ini
name=jq
version=1.7.1
arch=x86_64
license=MIT
description=Lightweight and flexible command-line JSON processor
url=https://github.com/Macromag-os/mur
bin=jq
sha256=5942c9b0934f2a0ee22b87722805b359e6003c3db7f536ae6f5cd175e8cbd348
```

#### Manifest Reference

* **`name`** / **`version`** / **`arch`**: Package identifier, upstream version, and target architecture (`x86_64` or `riscv64`).
* **`license`** / **`description`**: SPDX identifier and a short summary.
* **`url`** / **`bin`**: Direct HTTPS link to the static binary and its installed filename in `/usr/bin/`.
* **`sha256`**: Optional checksum verified automatically during installation.

### Step 3: Sync and Install

After committing your package or opening a PR, the repository index updates automatically. On your MacroMag OS machine, run:

```bash
mur sync
mur install <package-name>
```

### Where to Find Compatible Static Binaries (`x86_64`)

Look for `static`, `musl`, or standalone Go/Rust releases from official project repositories (such as `jq`, `ripgrep`, `fzf`, and `age`) or curated static binary collections like `moparisthebest/static-curl` and `ryanwoodsmall/static-binaries`.


## Usage on MacroMag OS

From the VOS terminal (`root@macromag:~#`), you can manage packages directly using the native `mur` client:

```bash
mur sync              # Synchronize the local package database with GitHub
mur list              # List all available and installed packages
mur install <package> # Download and install a tool directly into /usr/bin
mur remove <package>  # Uninstall a package from the system
```

*(You can also invoke MUR inside VOS object pipelines: `mur.sync()`, `mur.list()`, `mur.install("curl")`)*

---

## How to Add New Tools to MUR

Because MacroMag OS eliminates legacy GNU userland bloat and does not ship heavy compilers inside the base live ISO, packages in MUR are distributed as **self-contained, statically linked binaries**.

### Step 1: Create a Package Directory
Inside `MacroMag-os/mur`, create a new folder under `packages/` matching the exact command name of the tool:

```text
packages/
└── <package-name>/
    └── mur.pkg
```

### Step 2: Write the `mur.pkg` Manifest
Create a file named `mur.pkg` inside your package directory:

```ini
name=curl
version=8.7.1
arch=x86_64
license=MIT
description=Command-line tool for transferring data with URLs
url=https://github.com/moparisthebest/static-curl/releases/latest/download/curl-amd64
bin=curl
```

### Step 3: Update the Repository Index & Submit
1. Run `python3 collect.py` (or let the GitHub Actions workflow run automatically on push) to regenerate `index.json`.
2. Open a Pull Request to `MacroMag-os/mur`.
3. Once merged, any MacroMag OS user can run `mur sync` followed by `mur install <package-name>`.
