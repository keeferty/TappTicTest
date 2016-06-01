//
//  UIViewController+Alert.swift
//  TappticTest
//
//  Created by Pawel Weglewski on 01/06/16.
//  Copyright © 2016 Pawel Weglewski. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showConnectionErrorAlert(title: String, message : String , retry: () -> Void, completion: () -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: NSLocalizedString("OK", comment:""), style: .Cancel){ (action) in
            completion()
        }
        let retryAction = UIAlertAction(title: NSLocalizedString("Retry", comment:""), style: .Default){ (action) in
            retry()
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(retryAction)
        self.presentViewController(alertController, animated: true){}
    }
}
