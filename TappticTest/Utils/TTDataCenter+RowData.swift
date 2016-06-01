//
//  TTDataCenter+RowData.swift
//  TappticTest
//
//  Created by Pawel Weglewski on 01/06/16.
//  Copyright © 2016 Pawel Weglewski. All rights reserved.
//

import Foundation

extension TTDataCenter {
    
    func getList(failure : (message: String) -> Void, completion : (modelList : [TTRowModel]) -> Void) {
        if let url = NSURL(string: TTDataCenter.BaseURL) {
            let request = NSMutableURLRequest(URL: url)
            request.timeoutInterval = 10
            NSURLConnection.sendAsynchronousRequest(request, queue: requestQueue, completionHandler: { [unowned self](response, data, error) in
                guard self.verifyResponse(response, data: data, error: error, failure: failure)
                    else {
                        return
                }
                
                let list : Array<Dictionary<String,AnyObject>>?
                do {
                    list = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? Array
                } catch {
                    list = nil
                    failure(message: NSLocalizedString("Response parsing error", comment: ""))
                }
                if let list = list {
                    let modelList = list.map{TTRowModel(withRow: $0)}
                    completion(modelList: modelList)
                }
            })
        }
    }
    
    func getRowDetail(number: Int, failure : (message: String) -> Void, completion : (row : TTRowDetails) -> Void) {
        if let url = NSURL(string: "\(TTDataCenter.BaseURL)?name=\(String(number))") {
            let request = NSMutableURLRequest(URL: url)
            request.timeoutInterval = 10
            request.cachePolicy = .ReloadRevalidatingCacheData
            NSURLConnection.sendAsynchronousRequest(request, queue: requestQueue, completionHandler: { [unowned self](response, data, error) in
                guard self.verifyResponse(response, data: data, error: error, failure: failure)
                    else {
                        return
                }
                
                let details : Dictionary<String,AnyObject>?
                do {
                    details = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? Dictionary
                } catch {
                    details = nil
                    failure(message: NSLocalizedString("Response parsing error", comment: ""))
                }
                if let details = details {
                    let rowDetails = TTRowDetails(withDetail: details)
                    completion(row: rowDetails)
                }
            })
        }
    }
}