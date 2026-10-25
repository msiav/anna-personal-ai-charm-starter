# Personal AI Charm

An open starter project for building a small, characterful AI companion for iPhone and Apple Watch. Anna is the example character. Fork the project, change the character, and make it yours.

The complete project folder is in [`anna-personal-ai-charm-source.zip`](anna-personal-ai-charm-source.zip). Download and extract it, then follow the build steps below from the extracted folder. The archive preserves the Xcode project’s directory structure.

## What this project currently does

- The iPhone downloads a supported language model and runs chat locally through the NobodyWho Swift package.
- The Apple Watch provides a glanceable companion interface and relays full AI turns through the iPhone. The Watch does not run the language model itself.
- The example includes a pixel-orb character, speech input and spoken replies, user-controlled saved notes, optional Health summaries, and private iCloud sync when configured.
- Reference search uses Wikipedia excerpts. Broader or current searches open DuckDuckGo in the app, but Anna does not automatically read those result pages.

This is a source-code starter, not a finished service or a promise of production readiness. Model speed, memory use, supported devices, and permissions vary. Test on the devices you plan to support.

## Build and run

Requirements: a Mac with Xcode 16.4 or newer and internet access for Swift Package Manager and the first model download. The sample targets iOS 18.5 and watchOS 10 or newer. Model weights are downloaded separately by the app.

1. Download and extract the source archive.
2. Quit Xcode, open Terminal in the extracted folder, and run `bash scripts/build-simulator.sh`. The first build resolves the NobodyWho package and its native framework, so it may take several minutes.
3. After the script succeeds, open `AnnaCharmWatch.xcodeproj`, choose the `AnnaWatchContainer` scheme, select an iPhone simulator, and press Run.
4. For a physical device, configure your own signing team and bundle identifiers. Optional iCloud sync and shared app-group storage require your own containers, capabilities, and matching identifiers.

The script uses a project-local DerivedData folder and applies Apple's [documented Xcode 26 workaround](https://developer.apple.com/documentation/xcode-release-notes/xcode-26-release-notes): disabling SwiftSyntax macro prebuilts. It changes the current Mac user's Xcode preference and leaves it disabled. Restore Xcode's default with `defaults delete com.apple.dt.Xcode IDEPackageEnablePrebuilts`. The script builds the iPhone app and its embedded Watch app for the simulator without signing. It does not configure device provisioning or prove real-device behavior.

Run `swift test` from the extracted folder to test the shared core without Xcode.

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
