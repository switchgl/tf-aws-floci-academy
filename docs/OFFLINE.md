# Offline operations

Before unplugging: vendor/bin/terraform, vendor/providers, vendor/terraform.rc,
Docker image floci/floci:latest (or vendor/images/floci.tar), and optionally
AWS CLI plus postgres:16-alpine and the Lambda Python base image.

SAVE_IMAGES=1 ./scripts/bootstrap-online.sh writes vendor/images/floci.tar.
start.sh loads it if the image is missing.

Portal without Docker:

```bash
source scripts/env.sh
pip install -r portal/requirements.txt
cd portal && ACADEMY_ROOT=.. FLOCI_ENDPOINT=http://localhost:4566 python app.py
```
