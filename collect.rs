use std::fs;
fn main() {
    let mut items = Vec::new();
    if let Ok(entries) = fs::read_dir("packages") {
        for e in entries.flatten() {
            let p = e.path().join("mur.pkg");
            if let Ok(txt) = fs::read_to_string(p) {
                let mut fields = Vec::new();
                for l in txt.lines() {
                    if let Some((k, v)) = l.split_once("=") {
                        fields.push(format!("\"{}\":\"{}\"", k.trim(), v.trim().replace("\"", "\\\"")));
                    }
                }
                items.push(format!("{{{}}}", fields.join(",")));
            }
        }
    }
    let json = format!("[\n  {}\n]\n", items.join(",\n  "));
    fs::write("index.json", json).expect("Write failed");
    println!("Generated index.json with {} packages (Pure Rust)", items.len());
}
