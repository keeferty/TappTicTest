//
//  TTDataCenter.swift
//  TappticTest
//
//  Created by Pawel Weglewski on 01/06/16.
//  Copyright © 2016 Pawel Weglewski. All rights reserved.
//

import UIKit

public class TTDataCenter: NSObject {
    static let instance = TTDataCenter()
    private override init() {
        requestQueue = NSOperationQueue()
        requestQueue.maxConcurrentOperationCount = 2
        requestQueue.qualityOfService = .UserInteractive
    }
    
    private let requestQueue : NSOperationQueue!
    private let BaseURL = "http://dev.tapptic.com/test/json.php"
    
    public func getList(completion : () -> Void) {
        if let url = NSURL(string: BaseURL) {
            let request = NSURLRequest(URL: url)
            NSURLConnection.sendAsynchronousRequest(request, queue: requestQueue, completionHandler: { (response, data, error) in
                print(response)
            })

        }
    }
}
