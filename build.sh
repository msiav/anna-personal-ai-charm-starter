#!/bin/bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ARCHIVE="$ROOT/anna-personal-ai-charm-source.zip"

if ! command -v xcodebuild >/dev/null 2>&1; then
    echo "Xcode command line tools were not found. Install Xcode, open it once, and try again." >&2
    exit 1
fi

if /usr/bin/pgrep -x Xcode >/dev/null 2>&1; then
    echo "Please quit Xcode before running this build script." >&2
    exit 2
fi

if [[ ! -f "$ARCHIVE" ]]; then
    echo "Could not find anna-personal-ai-charm-source.zip beside this script." >&2
    exit 1
fi

BUILD_ROOT="$(mktemp -d "${TMPDIR:-/tmp}/anna-starter-build.XXXXXX")"
PROJECT="$BUILD_ROOT/AnnaCharmWatch.xcodeproj"
DERIVED_DATA="$BUILD_ROOT/.build/DerivedData"

unzip -q "$ARCHIVE" -d "$BUILD_ROOT"

XCODE_VERSION="$(xcodebuild -version | awk '/^Xcode / {print $2; exit}')"
XCODE_MAJOR="${XCODE_VERSION%%.*}"
if [[ "$XCODE_MAJOR" =~ ^[0-9]+$ ]] && (( XCODE_MAJOR >= 26 )); then
    current_prebuilt_setting="$(defaults read com.apple.dt.Xcode IDEPackageEnablePrebuilts 2>/dev/null || true)"
    if [[ "$current_prebuilt_setting" != "0" && "$current_prebuilt_setting" != "false" ]]; then
        defaults write com.apple.dt.Xcode IDEPackageEnablePrebuilts -bool NO
        echo "Disabled Xcode's SwiftSyntax macro prebuilts for this Mac, following Apple's Xcode 26 workaround."
    fi
fi

echo "Running the shared-core tests..."
(cd "$BUILD_ROOT" && swift test)

echo "Resolving Swift packages..."
xcodebuild     -resolvePackageDependencies     -project "$PROJECT"     -scheme AnnaWatchContainer     -derivedDataPath "$DERIVED_DATA"

echo "Building Anna for the iOS Simulator..."
xcodebuild     -project "$PROJECT"     -scheme AnnaWatchContainer     -destination "generic/platform=iOS Simulator"     -derivedDataPath "$DERIVED_DATA"     -skipMacroValidation     CODE_SIGNING_ALLOWED=NO     build

echo "Build succeeded. The extracted project is at: $PROJECT"
echo "Open it in Xcode, choose the AnnaWatchContainer scheme, select an iPhone simulator, and press Run."
