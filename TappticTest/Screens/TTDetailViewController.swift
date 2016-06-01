//
//  TTDetailViewController.swift
//  TappticTest
//
//  Created by Pawel Weglewski on 01/06/16.
//  Copyright © 2016 Pawel Weglewski. All rights reserved.
//

import UIKit

class TTDetailViewController: UIViewController {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var textLabel: UILabel!
    
    var viewModel : TTDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let viewModel = viewModel {
            viewModel.activate {
                if let detail = viewModel.detail {
                    self.imageView.sd_setImageWithURL(NSURL(string: detail.imageURL!))
                    self.textLabel.text = detail.text
                }
            }
        }
    }
}
