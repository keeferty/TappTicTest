//
//  TTDetailViewModel.swift
//  TappticTest
//
//  Created by Pawel Weglewski on 01/06/16.
//  Copyright © 2016 Pawel Weglewski. All rights reserved.
//

import UIKit

class TTDetailViewModel: NSObject {
    private let item : TTRowModel?
    var  detail : TTRowDetails?
    
    init(withRow row: TTRowModel?) {
        item = row
        super.init()
    }
    
    func activate(completion : () -> Void) {
        guard let item = item
            else {
                return
        }
            TTDataCenter.instance.getRowDetail(Int(item.name!)!, failure: { (message) in
                
            }) { (row) in
                self.detail = row
                dispatch_async(dispatch_get_main_queue(), { 
                    completion()
                })
            }

    }
}
