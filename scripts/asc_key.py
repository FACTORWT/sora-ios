import json, os, pathlib
kid = os.environ["ASC_KEY_ID"]
iss = os.environ["ASC_ISSUER_ID"]
p = pathlib.Path.home() / "private_keys" / f"AuthKey_{kid}.p8"
out = {"key_id": kid, "issuer_id": iss, "key": p.read_text(), "in_house": False}
(pathlib.Path.home() / "asc_key.json").write_text(json.dumps(out))
print("asc_key.json listo con key_id", kid)
