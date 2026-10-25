# Contributing

Thanks for helping make this starter easier to build on. Small, focused improvements are especially welcome.

## Before you start

- Read the project overview and limitations in [README.md](README.md).
- For a substantial change, open an issue or Discussion first so we can agree on the direction.
- Keep pull requests focused and explain what changed, how you tested it, and anything that still needs device verification.

## Build and test

Use an Apple Silicon Mac with Xcode 16.4 or newer. From the repository root, run:

```sh
bash build.sh
```

The helper runs the shared-core tests and builds the iPhone and embedded Watch simulator app. It does not sign or verify a physical device build. The Xcode 26 SwiftSyntax workaround changes a user-level Xcode preference. See the README before running the helper and restore the default if needed.

For changes to app behavior, test the affected flow in the simulator. If a feature requires HealthKit, iCloud, speech, notifications, or Watch hardware, say clearly what you could and could not verify.

## Good first contributions

- Improve setup instructions after trying them on a clean Mac.
- Add or improve tests for the shared request router and companion behavior.
- Make an accessibility improvement to a phone or Watch screen.
- Document how to replace the example character artwork or personality pack.
- Report a compatibility issue with the exact Xcode version and build log excerpt.

## Pull request checklist

- [ ] The change is scoped and explained.
- [ ] Shared-core tests pass, or the reason they could not be run is stated.
- [ ] No secrets, signing files, model weights, or personal data are included.
- [ ] Third-party code, models, and assets have compatible licenses and attribution.
- [ ] Device-only testing is described honestly.

Please do not open pull requests containing API keys, certificates, provisioning profiles, downloaded model weights, personal conversation data, or other private user content.
