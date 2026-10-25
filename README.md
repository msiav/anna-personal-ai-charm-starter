# Personal AI Charm

**Make your own AI companion for iPhone and Apple Watch.**

Personal AI Charm is an open Swift starter, not another account-based chat service. Anna is the sample character. Fork the project, change her personality and artwork, and use the starter to explore a characterful local-model companion across iPhone and Apple Watch.

[![Build and core tests](https://github.com/msiav/anna-personal-ai-charm-starter/actions/workflows/build.yml/badge.svg)](https://github.com/msiav/anna-personal-ai-charm-starter/actions/workflows/build.yml) [![MIT License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

[Get started](#build-and-run) · [Make it yours](#make-it-yours) · [Contribute](CONTRIBUTING.md) · [Report a bug](https://github.com/msiav/anna-personal-ai-charm-starter/issues/new/choose)

## What is included

- An iPhone app that downloads a supported language model and runs chat locally through the NobodyWho Swift package.
- A companion Apple Watch app. It relays full AI turns through the iPhone, which runs the model. The Watch does not run the language model itself.
- Anna as a working example character, including a pixel orb, speech input, spoken replies, and user-controlled saved notes.
- Optional Health summaries and private iCloud sync when you configure the required Apple capabilities.
- A simulator build helper and GitHub Actions workflow for the shared-core tests and app build.

This is an early, customizable starter project. It is not a finished consumer service or a guarantee of production readiness. The green CI check shows that the project builds and its shared-core tests pass in the configured simulator environment. It does not prove every feature on a physical iPhone and Watch.

## Build and run

### Requirements

- An Apple Silicon Mac.
- Xcode 16.4 or newer. The current CI run uses Xcode 26.3.
- Internet access to resolve Swift Package Manager dependencies and download a model in the app.
- An iPhone simulator for the first run. A physical iPhone and paired Watch are needed to test device-only behavior.

The pinned NobodyWho native framework does not include an Intel simulator slice, so the helper builds the arm64 iOS Simulator app. The sample targets iOS 18.5 and watchOS 10 or newer. Model weights are downloaded separately and are not included in this repository.

### First simulator build

1. Download this repository with **Code > Download ZIP**, or clone it:

   ```sh
   git clone https://github.com/msiav/anna-personal-ai-charm-starter.git
   cd anna-personal-ai-charm-starter
   ```

2. Quit Xcode, then run the helper from the repository root:

   ```sh
   bash build.sh
   ```

3. The helper runs the shared-core tests and builds the arm64 iPhone Simulator app with its embedded Watch app, without signing. It prints the extracted project folder. Open `AnnaCharmWatch.xcodeproj` from that folder, choose the `AnnaWatchContainer` scheme, select an iPhone simulator, and press Run.

The first run can take several minutes while Xcode resolves NobodyWho and its native framework. The helper passes `-skipMacroValidation` for the pinned macro dependency. On Xcode 26, it also applies Apple's [documented SwiftSyntax workaround](https://developer.apple.com/documentation/xcode-release-notes/xcode-26-release-notes) by disabling SwiftSyntax macro prebuilts for the current Mac user. It leaves that preference disabled. To restore the default later, run:

```sh
defaults delete com.apple.dt.Xcode IDEPackageEnablePrebuilts
```

Only build dependencies you trust. The helper does not configure device signing, provisioning, CloudKit, or App Groups, and a simulator build does not verify physical-device behavior.

### Run on your own devices

For iPhone or Watch hardware, configure your own signing team and unique bundle identifiers for the app, Watch app, widgets, and share extension. Optional iCloud sync and shared app-group storage also need your own CloudKit container, App Group, entitlements, and matching identifiers. See [CONTRIBUTING.md](CONTRIBUTING.md) for setup and testing notes.

## Make it yours

1. Edit `AnnaPhone/AnnaPersonalityPack.json` to change the sample character's prompt, response style, and voice settings.
2. Replace the orb artwork in the iPhone and Watch asset catalogs with art you own or have permission to use.
3. Run the core tests and simulator build after your changes.
4. Before sharing a fork, review its permissions, network behavior, privacy text, model card, and all third-party licenses.

The example uses Wikipedia excerpts for reference search. Broader or current searches open DuckDuckGo, but Anna does not automatically read or summarize those result pages. Replace the sample Wikipedia User-Agent contact in `AnnaPhone/AnnaPhoneViewModel.swift` with a contact address you control before making requests from your fork.

## Data and privacy notes

Local model inference runs on the iPhone after a model has been downloaded. Model downloads contact the model host. Search phrases are sent to Wikipedia or DuckDuckGo when those features are used. The Watch sends full AI requests to its paired iPhone. If configured, CloudKit sync stores synced conversations and attachments in the user's private iCloud database. Read the code and update your privacy disclosures before shipping a fork. Do not describe the sample as fully offline or as sending no data off-device.

## License and models

The original project code is offered under the [MIT License](LICENSE). Third-party packages, model weights, and artwork retain their own licenses and terms. NobodyWho is fetched through Swift Package Manager. Model weights are not bundled here. Check the model card and license before downloading or redistributing a model.

## Get involved

Questions, bug reports, and small tested improvements are welcome. Start with [Contributing](CONTRIBUTING.md), browse [open issues](https://github.com/msiav/anna-personal-ai-charm-starter/issues), or [start a discussion](https://github.com/msiav/anna-personal-ai-charm-starter/discussions).

Please do not submit API keys, signing certificates, provisioning profiles, personal conversation data, or downloaded model weights.
