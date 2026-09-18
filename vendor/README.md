# Offline vendor cache

This directory is populated by `scripts/bootstrap-online.sh` while you still have internet.

After bootstrap it contains:

- `bin/terraform` — pinned Terraform CLI
- `providers/` — filesystem mirror of the HashiCorp AWS provider
- optionally saved Docker images under `images/` if you used `--save-images`

Do not commit the binaries. The academy portal and `labtf` wrapper read this cache so `terraform init` works with no network.
