//
//  TTDataCenter.swift
//  TappticTest
//
//  Created by Pawel Weglewski on 01/06/16.
//  Copyright © 2016 Pawel Weglewski. All rights reserved.
//

import UIKit

class TTDataCenter: NSObject {
    static let instance = TTDataCenter()
    private override init() {
        requestQueue = NSOperationQueue()
        requestQueue.maxConcurrentOperationCount = 2
        requestQueue.qualityOfService = .UserInteractive
    }
    
    let requestQueue : NSOperationQueue!
    static let BaseURL = "http://dev.tapptic.com/test/json.php"
    
    func verifyResponse(response: NSURLResponse?, data: NSData?, error: NSError?, failure:(message:String) -> Void) -> Bool {
        guard (error == nil) && (data != nil) && (response != nil)
            else {
                dispatch_async(dispatch_get_main_queue(), {
                    failure(message: (error?.localizedDescription)!)
                })
                return false
        }
        let statusCode = (response as! NSHTTPURLResponse).statusCode
        guard statusCode == 200
            else {
                let message = NSHTTPURLResponse.localizedStringForStatusCode(statusCode)
                dispatch_async(dispatch_get_main_queue(), { 
                    failure(message: "\(statusCode) \(message)")
                })
                return false
        }
        return true
    }    
}
