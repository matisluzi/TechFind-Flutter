# TechFind

TechFind, rewritten in Flutter, with a new material design, and compatibility for iOS and Android!

## How to install to device
NOTE: This documentation requires a MacOS device.
### Run on Android device:
1. Install flutter, Android Studio with homebrew & cask:
brew cask install flutter android-studio
2. Clone this repository:
git clone https://github.com/matisluzi/TechFind-Flutter.git
3. cd into the repo folder:
cd TechFind-Flutter/
4. Enable Developer Options and USB Debugging on your Android device:
Settings -> About Phone -> Press 'Build Number' 7 times.
Settings -> System -> Advanced -> Developer Options -> USB Debugging
5. Connect Android device to computer.
6. Run app with flutter:
flutter run --release
The app should now install onto your Android device.

### Run on iOS device
1. Install XCode from App Store, and flutter with the following command:
brew cask install flutter
2. Clone this repository:
git clone https://github.com/matisluzi/TechFind-Flutter.git
3. cd into the repo folder:
cd TechFind-Flutter/
4. Open ios/Runner.xcworkspace file with XCode
5. Add a development team to sign the app (look for instructions online)
6. Run app with flutter:
flutter run --release
The app should now install onto your iOS device.
