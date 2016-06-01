//
//  TTRowDetails.swift
//  TappticTest
//
//  Created by Pawel Weglewski on 01/06/16.
//  Copyright © 2016 Pawel Weglewski. All rights reserved.
//

import UIKit

class TTRowDetails: TTRowModel {

    let text : String!
    
    init(withDetail detail : Dictionary<String, AnyObject>) {
        guard (detail["text"] as? String != nil)
            else {
                self.text = nil
                super.init(withRow: detail)
                return
        }
        self.text = detail["text"] as! String
        super.init(withRow: detail)
    }
}
