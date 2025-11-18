#!/bin/bash
set -e

# Directory to store artifacts
ARTIFACT_DIR="../artifacts"

# rm "$ARTIFACT_DIR/test-summary.md"
rm -r "$ARTIFACT_DIR/target"

echo "📥 Fetching latest test-reports artifact from GitHub Actions..."

# Download the latest artifact named "test-reports"
gh run download --name "test-reports" --dir "$ARTIFACT_DIR"

# Verify the file exists
if [[ -f "$ARTIFACT_DIR/test-summary.md" ]]; then
    echo "✅ Test results downloaded to $ARTIFACT_DIR/test-summary.md"
    echo
    echo "📄 Test summary preview:"
    echo "--------------------------------"
    tail -n 20 "$ARTIFACT_DIR/test-summary.md"
    echo "--------------------------------"
else
    echo "❌ Could not find test-summary.md in artifact."
    exit 1
fi
