# SimpleReno

SimpleReno is a demonstration iOS application built during a hackathon. It allows homeowners to post renovation jobs and contractors to browse open jobs.

## Features

- **Job Listings** – displays jobs stored on Parse using `PFQueryTableViewController`.
- **Add Job** – users can create a job with category, photo, description, and expiry date.
- **Job Detail** – shows a job's full description and image with dynamic cell sizing.
- **Authentication** – placeholder login and signup views (Parse backend not fully implemented).
- **Parse Cloud Code** – simple cloud functions live under `cloud/main.js`.

## Project Structure

```
SimpleReno/               # iOS Xcode project
  SimpleReno/             # Swift source files
  cloud/                  # Parse Cloud Code
  public/                 # Static hosting content
  Podfile                 # CocoaPods dependencies
```

The app targets iOS 8 and depends on Parse and ParseUI. The repository already contains `Pods/` checked in so you can build immediately.

## Getting Started

1. Install CocoaPods if needed: `sudo gem install cocoapods`.
2. Run `pod install` inside the `SimpleReno` directory to ensure dependencies are installed.
3. Open `SimpleReno.xcworkspace` with Xcode.
4. Build and run on the simulator or a device running iOS 8 or later.

## Notes

This code was written for a time‑boxed hackathon and is not production ready. Several features, including user account management and backend validations, are incomplete or only stubbed out.
