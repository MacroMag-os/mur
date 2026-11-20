import os, json, urllib.request, zipfile, shutil, subprocess

OUT_DIR = "mur_tools_out"
os.makedirs(OUT_DIR, exist_ok=True)
manifest_list = []

GH = "https://github.com"
API = "https://github.com"

# 1. Statyczny fastfetch z logo MacroMag OS (musl-gcc)
subprocess.run(["git", "clone", "--depth=1", f"{GH}/maldyrek/fastfetch.git", "src_ff"], check=True)
env = os.environ.copy()
env["CC"] = "musl-gcc"
subprocess.run(["cmake", "-B", "src_ff/build", "-S", "src_ff", "-G", "Ninja", "-DCMAKE_BUILD_TYPE=Release", "-DCMAKE_EXE_LINKER_FLAGS=-static"], env=env, check=True)
subprocess.run(["cmake", "--build", "src_ff/build", "--target", "fastfetch"], check=True)
shutil.copy2("src_ff/build/fastfetch", os.path.join(OUT_DIR, "fastfetch"))
os.chmod(os.path.join(OUT_DIR, "fastfetch"), 0o755)
shutil.copy2("src_ff/LICENSE", os.path.join(OUT_DIR, "fastfetch.LICENSE"))
manifest_list.append({"name": "fastfetch", "version": "custom-macromag", "license": "MIT", "file": "fastfetch"})

# 2. Lista 49 statycznych narzedzi CLI
TOOLS = [
    ("rg", "BurntSushi/ripgrep", "x86_64-unknown-linux-musl.tar.gz", "MIT"),
    ("fd", "sharkdp/fd", "x86_64-unknown-linux-musl.tar.gz", "MIT"),
    ("bat", "sharkdp/bat", "x86_64-unknown-linux-musl.tar.gz", "MIT"),
    ("eza", "eza-community/eza", "eza_x86_64-unknown-linux-musl.tar.gz", "MIT"),
    ("fzf", "junegunn/fzf", "linux_amd64.tar.gz", "MIT"),
    ("jq", "jqlang/jq", "jq-linux-amd64", "MIT"),
    ("yq", "mikefarah/yq", "yq_linux_amd64", "MIT"),
    ("micro", "zyedidia/micro", "linux64-static.tar.gz", "MIT"),
    ("btop", "aristocratos/btop", "btop-x86_64-linux-musl.tbz", "Apache-2.0"),
    ("zoxide", "ajeetdsouza/zoxide", "x86_64-unknown-linux-musl.tar.gz", "MIT"),
    ("dust", "bootandy/dust", "x86_64-unknown-linux-musl.tar.gz", "Apache-2.0"),
    ("duf", "muesli/duf", "linux_x86_64.tar.gz", "MIT"),
    ("gping", "orf/gping", "x86_64-unknown-linux-musl.tar.gz", "MIT"),
    ("procs", "dalance/procs", "x86_64-linux.zip", "MIT"),
    ("hyperfine", "sharkdp/hyperfine", "x86_64-unknown-linux-musl.tar.gz", "MIT"),
    ("sd", "chmln/sd", "x86_64-unknown-linux-musl.tar.gz", "MIT"),
    ("choose", "theryangeary/choose", "x86_64-unknown-linux-musl", "GPL-3.0"),
    ("hexyl", "sharkdp/hexyl", "x86_64-unknown-linux-musl.tar.gz", "MIT"),
    ("delta", "dandavison/delta", "x86_64-unknown-linux-musl.tar.gz", "MIT"),
    ("tokei", "XAMPPRocky/tokei", "x86_64-unknown-linux-musl.tar.gz", "MIT"),
    ("just", "casey/just", "x86_64-unknown-linux-musl.tar.gz", "CC0-1.0"),
    ("starship", "starship/starship", "x86_64-unknown-linux-musl.tar.gz", "ISC"),
    ("zellij", "zellij-org/zellij", "x86_64-unknown-linux-musl.tar.gz", "MIT"),
    ("lazygit", "jesseduffield/lazygit", "Linux_x86_64.tar.gz", "MIT"),
    ("gh", "cli/cli", "linux_amd64.tar.gz", "MIT"),
    ("xh", "ducaale/xh", "x86_64-unknown-linux-musl.tar.gz", "MIT"),
    ("doggo", "mr-karan/doggo", "linux_amd64.tar.gz", "GPL-3.0"),
    ("trip", "fujiapple852/trippy", "x86_64-unknown-linux-musl.tar.gz", "Apache-2.0"),
    ("bottom", "ClementTsang/bottom", "bottom_x86_64-unknown-linux-musl.tar.gz", "MIT"),
    ("lsd", "lsd-rs/lsd", "x86_64-unknown-linux-musl.tar.gz", "Apache-2.0"),
    ("broot", "Canop/broot", "x86_64-unknown-linux-musl.zip", "MIT"),
    ("yazi", "sxyazi/yazi", "yazi-x86_64-unknown-linux-musl.zip", "MIT"),
    ("hx", "helix-editor/helix", "x86_64-linux.tar.xz", "MPL-2.0"),
    ("nvim", "neovim/neovim", "nvim-linux-x86_64.tar.gz", "Apache-2.0"),
    ("age", "FiloSottile/age", "linux-amd64.tar.gz", "BSD-3-Clause"),
    ("minisign", "jedisct1/minisign", "linux.tar.gz", "ISC"),
    ("croc", "schollz/croc", "Linux-64bit.tar.gz", "MIT"),
    ("rclone", "rclone/rclone", "linux-amd64.zip", "MIT"),
    ("restic", "restic/restic", "linux_amd64.bz2", "BSD-2-Clause"),
    ("watchexec", "watchexec/watchexec", "x86_64-unknown-linux-musl.tar.xz", "Apache-2.0"),
    ("grex", "pemistahl/grex", "x86_64-unknown-linux-musl.tar.gz", "Apache-2.0"),
    ("pastel", "sharkdp/pastel", "x86_64-unknown-linux-musl.tar.gz", "MIT"),
    ("vivid", "sharkdp/vivid", "x86_64-unknown-linux-musl.tar.gz", "MIT"),
    ("bandwhich", "imsnif/bandwhich", "x86_64-unknown-linux-musl.tar.gz", "MIT"),
    ("ouch", "ouch-org/ouch", "x86_64-unknown-linux-musl.tar.gz", "MIT"),
    ("tldr", "dbrgn/tealdeer", "linux-x86_64-musl", "MIT"),
    ("navi", "denisidoro/navi", "x86_64-unknown-linux-musl.tar.gz", "Apache-2.0"),
    ("atuin", "atuinsh/atuin", "x86_64-unknown-linux-musl.tar.gz", "MIT"),
    ("nu", "nushell/nushell", "x86_64-unknown-linux-musl.tar.gz", "MIT")
]

headers = {"User-Agent": "MacroMag-MUR"}
token = os.environ.get("GITHUB_TOKEN")
if token:
    headers["Authorization"] = f"Bearer {token}"

for bin_name, repo, pattern, lic in TOOLS:
    try:
        req = urllib.request.Request(f"{API}/repos/{repo}/releases/latest", headers=headers)
        data = json.loads(urllib.request.urlopen(req).read().decode())
        ver = data.get("tag_name", "latest")
        asset = next((a for a in data.get("assets", []) if pattern in a["name"] and not a["name"].endswith(".sha256")), None)
        if not asset:
            continue
        os.makedirs("tmp_dl", exist_ok=True)
        dl_path = os.path.join("tmp_dl", asset["name"])
        urllib.request.urlretrieve(asset["browser_download_url"], dl_path)
        if asset["name"].endswith((".tar.gz", ".tgz", ".tar.xz", ".tbz", ".tar.bz2")):
            subprocess.run(["tar", "-xf", dl_path, "-C", "tmp_dl"], check=True)
        elif asset["name"].endswith(".zip"):
            with zipfile.ZipFile(dl_path, "r") as zf:
                zf.extractall("tmp_dl")
        elif asset["name"].endswith(".bz2"):
            subprocess.run(["bunzip2", dl_path], check=True)
        found = None
        for root, _, files in os.walk("tmp_dl"):
            for f in files:
                if f == bin_name or f == asset["name"]:
                    cand = os.path.join(root, f)
                    if os.path.isfile(cand):
                        found = cand
                        break
            if found:
                break
        if found:
            dest = os.path.join(OUT_DIR, bin_name)
            shutil.copy2(found, dest)
            os.chmod(dest, 0o755)
            manifest_list.append({"name": bin_name, "version": ver, "license": lic, "source": f"{GH}/{repo}", "file": bin_name})
            print(f"[OK] {bin_name}")
    except Exception as e:
        print(f"[SKIP] {bin_name}: {e}")
    finally:
        shutil.rmtree("tmp_dl", ignore_errors=True)

with open(os.path.join(OUT_DIR, "index.json"), "w") as out:
    json.dump({"packages": manifest_list}, out, indent=2)
