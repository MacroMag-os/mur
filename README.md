# MUR — MacroMag User Repository

**MUR (MacroMag User Repository)** is the official, community-driven package ecosystem for **MacroMag OS**. Inspired by the Arch User Repository (AUR), MUR replaces fragile Bash build scripts with clean, declarative package manifests (`mur.pkg`) designed for deterministic, zero-telemetry execution on `x86_64` and `RISC-V` architectures.

---

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
