# Personal AI Charm

An open starter project for building a small, characterful AI companion for iPhone and Apple Watch. Anna is the example character. Fork the project, change the character, and make it yours.

The complete Xcode project is in [anna-personal-ai-charm-source.zip](anna-personal-ai-charm-source.zip). For a reliable first build, download this repository so you also have its build helper.

## What this project does

- The iPhone downloads a supported language model and runs chat locally through the NobodyWho Swift package.
- The Apple Watch provides a glanceable companion interface and relays full AI turns through the iPhone. The Watch does not run the language model itself.
- The example includes a pixel-orb character, speech input and spoken replies, user-controlled saved notes, optional Health summaries, and private iCloud sync when configured.
- Reference search uses Wikipedia excerpts. Broader or current searches open DuckDuckGo in the app, but Anna does not automatically read those result pages.

This is an early source starter, not a finished service or a promise of production readiness. Model speed, memory use, supported devices, and permissions vary. Test on the devices you plan to support.

## Build and run

Requirements: a Mac with Xcode 16.4 or newer and internet access for Swift Package Manager and the first model download. The sample targets iOS 18.5 and watchOS 10 or newer. Model weights download separately when the app requests one.

1. Download this repository using Code, then Download ZIP, and extract it. Keep `build.sh` and `anna-personal-ai-charm-source.zip` together.
2. Quit Xcode, open Terminal in the extracted repository folder, and run `bash build.sh`. The first run resolves NobodyWho and its native framework, so it can take several minutes.
3. When the build succeeds, open the extracted `AnnaCharmWatch.xcodeproj` path printed by the script, choose the `AnnaWatchContainer` scheme, select an iPhone simulator, and press Run.
4. For a physical device, configure your own signing team and bundle identifiers. Optional iCloud sync and shared app-group storage need your own containers, capabilities, and matching identifiers.

The helper extracts into a unique temporary folder, runs shared-core tests, and builds the iPhone app with its embedded Watch app for the simulator without signing. It passes `-skipMacroValidation` for the pinned NobodyWho Swift macro, so Xcode does not pause for an interactive trust prompt. This skips Xcode's macro trust validation. Only build dependencies you trust. For Xcode 26, the helper also applies Apple's [documented workaround](https://developer.apple.com/documentation/xcode-release-notes/xcode-26-release-notes) by disabling SwiftSyntax macro prebuilts. This changes the current Mac user's Xcode preference and leaves it disabled. Restore the default with `defaults delete com.apple.dt.Xcode IDEPackageEnablePrebuilts`.

The helper does not configure device provisioning or prove runtime behavior on physical hardware. The source archive also contains `scripts/build-simulator.sh` for developers who only want the Xcode project. For the most reliable first build, use the repository's `build.sh` helper.

## Make the character yours

- Edit `AnnaPhone/AnnaPersonalityPack.json` to change the example persona, response style, and voice settings.
- Replace the orb images in the iPhone and Watch asset catalogs with artwork you have permission to use.
- Review the app's visible copy, permissions, privacy disclosures, and supported actions before sharing or publishing your fork.
- Replace the example Wikipedia User-Agent contact in `AnnaPhone/AnnaPhoneViewModel.swift` with a contact address you control before making search requests from your own app.

## Privacy and network behavior

Local model inference runs on the iPhone after the model has been downloaded. The Watch sends full AI requests to the paired iPhone. Optional CloudKit sync stores synced conversations and attachments in the user's private iCloud database. Wikipedia and DuckDuckGo searches send the search phrase to those services. Model downloads contact the model host. Read the code and update your privacy disclosures before shipping a fork. Do not describe the app as entirely offline or as sending no data off-device when these network features are enabled.

## License and third-party components

The license for this project's original code is in [LICENSE](LICENSE). Third-party packages and models keep their own licenses and terms. The NobodyWho inference package is fetched by Swift Package Manager. Model weights are not included in this repository. Check each model's card and license before use or redistribution.

## Contributing

Small, tested improvements are welcome. Please do not submit API keys, signing certificates, provisioning profiles, personal conversation data, or downloaded model weights.
