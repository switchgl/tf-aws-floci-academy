# Terraform AWS Academy (Floci)

Hands-on Terraform training against a **local AWS account**.

You clone this repository while online. After `scripts/bootstrap-online.sh`
finishes you can disconnect. Every apply talks to [Floci](https://floci.io) on
`http://localhost:4566`, not to Amazon.

The academy is a small web portal plus a WSL / bash workflow. You write real
`.tf` files in a terminal. The portal only navigates labs and checks whether
the emulated account contains what the exercise asked for.

## What you get

| Layer | What it is |
|---|---|
| Floci | MIT-licensed AWS emulator. Drop-in on port 4566. No account, no token. |
| Portal | `http://localhost:8080` — beginner / intermediate / expert catalog |
| Labs | 17 exercises, each with scenario, starter, reference solution, live checks |
| `labtf` | Terraform wrapper that uses the vendored binary + offline provider mirror |

Designed for **WSL2 or any bash + Docker** host.

## Online once, offline forever after

```bash
git clone https://github.com/switchgl/tf-aws-floci-academy.git
cd tf-aws-floci-academy
chmod +x scripts/*.sh scripts/labtf
./scripts/bootstrap-online.sh
```

Bootstrap pulls Floci, vendors Terraform + the AWS/archive providers, and writes
`vendor/terraform.rc` so later `terraform init` is offline.

Air-gap extra:

```bash
SAVE_IMAGES=1 ./scripts/bootstrap-online.sh
```

## Daily loop (works offline)

```bash
./scripts/start.sh
source scripts/env.sh
./scripts/new-lab.sh 01-hello-s3
cd workspaces/01-hello-s3
labtf init && labtf plan && labtf apply
./scripts/check-lab.sh 01-hello-s3
```

Portal: http://localhost:8080 — Floci: http://localhost:4566

Reset the emulated account: `./scripts/reset-floci.sh`

## Curriculum

Beginner: 01 Hello S3 · 02 variables/tags · 03 IAM+SSM · 04 DynamoDB/SQS/SNS · 05 remote state · 06 first module

Intermediate: 07 Lambda · 08 HTTP API · 09 Secrets/KMS · 10 S3-SQS-Lambda · 11 serverless 3-tier · 12 for_each/workspaces

Expert: 13 custom VPC · 14 RDS · 15 classic 3-tier modules · 16 production habits · 17 capstone

Solutions live in `labs/<id>/solution/`.

See `docs/OFFLINE.md` and `docs/FLOCI.md`.

MIT licensed.
