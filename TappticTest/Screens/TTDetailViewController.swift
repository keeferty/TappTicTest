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
        if viewModel != nil {
            getData()
        }
    }
    
    private func getData() {
        viewModel!.activate({ [unowned self](message) in
            self.showConnectionErrorAlert(NSLocalizedString("An Error occured", comment: ""), message: message, retry: {
                self.getData()
                }, completion: {
            })
            }) {
                if let detail = self.viewModel!.detail {
                    if let image = detail.imageURL {
                        self.imageView.sd_setImageWithURL(NSURL(string: image))
                    }
                    self.textLabel.text = detail.text
                }
        }
    }
}
