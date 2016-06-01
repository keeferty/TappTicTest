//
//  TTRowModel.swift
//  TappticTest
//
//  Created by Pawel Weglewski on 01/06/16.
//  Copyright © 2016 Pawel Weglewski. All rights reserved.
//

import UIKit

class TTRowModel: NSObject {
    
    let name : String!
    let imageURL : String!
    
    init(withRow row : Dictionary<String, AnyObject>) {
        guard (row["name"] as? String != nil) && (row["image"] as? String != nil)
        else {
            self.name = nil
            self.imageURL = nil
            return
        }
        
        self.name = row["name"] as! String
        self.imageURL = row["image"] as! String
    }
}
