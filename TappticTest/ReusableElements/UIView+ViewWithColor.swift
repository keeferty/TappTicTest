//
//  UIView+ViewWithColor.swift
//  TappticTest
//
//  Created by Pawel Weglewski on 01/06/16.
//  Copyright © 2016 Pawel Weglewski. All rights reserved.
//

import UIKit

extension UIView {
    class func viewWithColor(color : UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        return view
    }
}
