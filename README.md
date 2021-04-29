# flutter_receive_shared_data_tutorial

Flutter demo for receiving shared data on both Android and iOS. Finished product for my "Receiving shared data in Flutter using Android Send Intents and iOS Share Extensions" tutorial on Medium.

This project has all the basics you need to to receive shared data (in the form of text) in your Flutter application. 

# Import Step for iOS
If cloning this repo on iOS make sure to open up the project in XCode and create the following
1. A bundle identifier for both `Runner` and `ShareExtension`
2. An app group, making sure both `Runner` and `ShareExtension` are a part of that group
