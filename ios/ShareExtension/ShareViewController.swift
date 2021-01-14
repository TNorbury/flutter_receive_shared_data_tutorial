//
//  ShareViewController.swift
//  ShareExtension
//
//  Created by Tyler Norbury on 1/12/21.
//

import UIKit
import Social
import MobileCoreServices

class ShareViewController: SLComposeServiceViewController {
    
    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }
    
    override func didSelectPost() {
        let sharedSuiteName: String = "group.com.tnorbury.flutterSharingTutorial"
        let sharedDataKey: String = "SharedData"
        
        let extensionItem = extensionContext?.inputItems[0] as! NSExtensionItem
        let contentTypeText = kUTTypeText as String
        
        for attachment in extensionItem.attachments! {
            if attachment.hasItemConformingToTypeIdentifier(contentTypeText) {
                attachment.loadItem(forTypeIdentifier: contentTypeText, options: nil, completionHandler: {(results, error) in
                    if let sharedText = results as! String? {
                        if let userDefaults = UserDefaults(suiteName: sharedSuiteName) {
                            userDefaults.set(sharedText, forKey: sharedDataKey)
                        }
                    }
                })
            }
        }
        
        self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
    }
    
    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }
    
}
