# giphy_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


### Installing Flutter Env

1. To Run Flutter, Firstly We need Git which can be downloaded from:
    https://git-scm.com/downloads
    -then install it as the steps provided on website
2. Similarly install Flutter from:
    https://docs.flutter.dev/get-started/install
    -install it as the steps provided on website
3. We need Android Studio for Android SDK tools as well which can be downloaded from:
    https://developer.android.com/studio
    -install it as the steps provided on website
4. We also need Xcode if we are working on Mac which can be downloaded from app store.
5. We need VS code which can be downloaded from:
    https://code.visualstudio.com/Download
    - after installing and setting up VS code, we need to add two extensions namely Flutter and dart so that we can access flutter commands from VS code.
6. Once the setup is done, We need to go to open terminal from view option in VS code.
    - run flutter doctor -v and check if any is found and correct them.


### Running the App

7. Open the simulator and check whether it is shown in bottom right of VS code.
8. Once it is done, pull the project and run following command in terminal:
    flutter clean
9. After cleaning the project, run the following Command:
    flutter run
    - above command will automattically force the flutter pub get command and check for all requested packages and will run the app on simulator.


### Firebase Setup and Authentication
  Refer to [this](https://firebase.google.com/docs/flutter/setup?platform=android) document for setting up Firebase.

### Giphy API Key
  Refer to [this](https://developers.giphy.com/dashboard/) link for creating Giphy API Key.

### Login and Signup
  Implemented Login Signup pages using GetX state management.

### Local Storage
  Used sharedpreferences for Local storage of data.

### More Sections
  Added Giphy Trending List, searchbar, and favourite Sections

# Build Android Apk

This guide provides a step-by-step walkthrough of build android apk file.

## Setup for Android APK
 
   1. Run the following command in the terminal to get the android apk file.
   >  `flutter build apk`
 
   2. After `Done` of build apk open the folder (locally not in vs code) of path `[project]/build/app/outputs/apk/release/app-release.apk`.

   3. Now You can use the `app-release.apk` file.