export AWS_ENDPOINT_URL="${AWS_ENDPOINT_URL:-http://localhost:4566}"
export AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID:-test}"
export AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY:-test}"
export AWS_DEFAULT_REGION="${AWS_DEFAULT_REGION:-us-east-1}"
export AWS_REGION="${AWS_REGION:-us-east-1}"
export AWS_EC2_METADATA_DISABLED=true
export AWS_PAGER=""

ACADEMY_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export ACADEMY_ROOT
export TF_CLI_CONFIG_FILE="${TF_CLI_CONFIG_FILE:-$ACADEMY_ROOT/vendor/terraform.rc}"

if [[ -x "$ACADEMY_ROOT/vendor/bin/terraform" ]]; then
  export PATH="$ACADEMY_ROOT/vendor/bin:$PATH"
fi
if [[ -x "$ACADEMY_ROOT/scripts/labtf" ]]; then
  export PATH="$ACADEMY_ROOT/scripts:$PATH"
fi

echo "Floci AWS endpoint : $AWS_ENDPOINT_URL"
echo "Academy root       : $ACADEMY_ROOT"
