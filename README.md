# flutter_receive_shared_data_tutorial

Flutter demo for receiving shared data on both Android and iOS. Finished product for my "Receiving shared data in Flutter using Android Send Intents and iOS Share Extensions" tutorial on Medium.

This project has all the basics you need to to receive shared data (in the form of text) in your Flutter application. 

# Import Steps for iOS
If cloning this repo on iOS make sure to open up the project in XCode and configure the following:
1. Set your development team
2. Create a bundle identifier for both `Runner` and `ShareExtension`
3. Create an app group, making sure both `Runner` and `ShareExtension` are a part of that group

Afterwards, make the following changes:
1. Set the value of `sharedSuiteName` in both `AppDelegate.swift` and `ShareViewController.swift` to the group identifier for the group made in step #2
2. In `AppDelegate.swift` set the name for the method channel (replace the text that says "PUT BUNDLE ID HERE") as the bundle ID you chose in step #1
3. In `share_service.dart` change the argument passed to `MethodChannel` to that of the bundle ID from step #1. (This is inside of the `getSharedData()` method. 
