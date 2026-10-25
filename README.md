# Personal AI Charm

An open starter project for building a small, characterful AI companion for iPhone and Apple Watch. Anna is the example character. Fork the project, change the character, and make it yours.

The complete project folder is in [`anna-personal-ai-charm-source.zip`](anna-personal-ai-charm-source.zip). Download and extract it, then follow the build steps below from the extracted folder. The archive preserves the Xcode project’s directory structure.

## What this project currently does

- The iPhone downloads a supported language model and runs chat locally through the NobodyWho Swift package.
- The Apple Watch provides a glanceable companion interface and relays full AI turns through the iPhone. The Watch does not run the language model itself.
- The example includes a pixel-orb character, speech input and spoken replies, user-controlled saved notes, optional Health summaries, and private iCloud sync when configured.
- Reference search uses Wikipedia excerpts. Broader or current searches open DuckDuckGo in the app, but Anna does not automatically read those result pages.

This is a source-code starter, not a finished service or a promise of production readiness. Model speed, memory use, supported devices, and permissions vary. Test on the devices you plan to support.

## Build the iPhone and Watch apps

1. Open `AnnaCharmWatch.xcodeproj` in Xcode.
2. Choose the `AnnaWatchContainer` scheme and sign in with your own Apple Developer team.
3. Set unique bundle identifiers for the iPhone app, Watch app, widgets, and share extension.
4. If you want iCloud sync or shared app-group storage, create your own CloudKit container and App Group, enable the matching capabilities for each target, and update the example identifiers in the project and entitlement files. Without your own setup, those integrations will not work.
5. Build and test on an iPhone paired with a Watch. The first model download requires internet access. Review the model card and its license before distributing a build.

The Xcode project uses a pinned Swift Package dependency. Xcode resolves it when the project is opened or built.

Build note: the standalone core test suite passes in this checkout. The full Xcode app build currently depends on NobodyWho 2.3.0 and its SwiftSyntax macro toolchain compatibility. Verify an iPhone and Watch build with your Xcode version before building on this starter.

## Make the character yours

- Edit `AnnaPhone/AnnaPersonalityPack.json` to change the example persona, response style, and voice settings.
- Replace the orb images in the iPhone and Watch asset catalogs with artwork you have permission to use.
- Review the app's visible copy, permissions, privacy disclosures, and supported actions before sharing or publishing your fork.
- Replace the example Wikipedia User-Agent contact in `AnnaPhone/AnnaPhoneViewModel.swift` with a contact address you control before making search requests from your own app.

## Privacy and network behavior

Local model inference runs on the iPhone after the model has been downloaded. The Watch sends full AI requests to the paired iPhone. Optional CloudKit sync stores synced conversations and attachments in the user's private iCloud database. Wikipedia and DuckDuckGo searches send the search phrase to those services. Model downloads contact the model host. Read the code and update your privacy disclosures before shipping a fork. Do not describe the app as entirely offline or as sending no data off-device when these network features are enabled.

## License and third-party components

The license for this project's original code is in `LICENSE`. Third-party packages and models keep their own licenses and terms. The NobodyWho inference package is fetched by Swift Package Manager. Model weights are not included in this repository; check each model's card and license before use or redistribution.

## Contributing

Small, tested improvements are welcome. Please do not submit API keys, signing certificates, provisioning profiles, personal conversation data, or downloaded model weights.
