# Floci notes for this academy

Upstream: https://floci.io and https://github.com/floci-io/floci

Floci is a local AWS emulator on port 4566. Point the official AWS provider at
it with an endpoints block. Credentials can be any non-empty pair (test/test).

Compose mounts the Docker socket so Lambda and RDS can start real engine
containers, and publishes RDS proxy ports 7001-7010.

Terraform does not honour AWS_ENDPOINT_URL the way the AWS CLI does. Every
service used must appear in shared/floci.tf endpoints.
