# hng_task_one_personal_app

# My Personal App

This is a Flutter mobile application that prominently features your Slack identity, incorporates your Slack profile picture, and includes an "Open GitHub" button. When pressed, this button redirects users to your GitHub profile within the application itself.

## Table of Contents

- [Setup](#setup)
- [Usage](#usage)
- [Assumptions](#assumptions)
- [Responsiveness](#responsiveness)
- [Demo](#demo)

## Setup

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/JediChi/Personal_app.git

2. Ensure you have Flutter and Dart installed. If not, follow the Flutter installation guide here.

3. Navigate to the project directory:

    ```bash
    cd my-personal-app

4. Install the required dependencies:
    ```bash
    flutter pub get

5. Connect your Android or iOS device, or start an emulator.

6. Run the application:
    ```bash
    flutter run

## Usage

1. Launch the app on your device/emulator.

2. The main screen prominently displays your Slack name and profile picture.

3. Click the "Open GitHub" button to view your GitHub profile within the app's WebView.

## Assumptions

1. This app assumes you have a valid Slack account with a profile picture.

2. It assumes you have a valid GitHub profile.

3. Minimal third-party dependencies are used to adhere to the requirements.

4. Internet permissions are set correctly in the AndroidManifest.xml and Info.plist files for WebView functionality.

## Responsiveness

The app is designed to be responsive across various device sizes. It adapts the UI elements and font sizes based on the detected screen type (desktop, tablet, handset, or watch) using Flutter's MediaQuery.

## Demo

1. You can see a live demo of the app on Appetize.io.

2. Set the android version to androiid 12 and above on Appetize.io









