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
    private let index: Int?
    var  detail : TTRowDetails?
    
    init(withRow row: TTRowModel?) {
        item = row
        index = nil
        super.init()
    }
    
    init(withIndex ind: Int!) {
        index = ind
        item = nil
        super.init()
    }
    
    func activate(failure: (message: String) -> Void, completion : () -> Void) {
        guard item != nil || index != nil
            else {
                return
        }
            TTDataCenter.instance.getRowDetail(index ?? Int(item!.name!)!, failure: { (message) in
                failure(message: message)
            }) { (row) in
                self.detail = row
                completion()
            }

    }
}
