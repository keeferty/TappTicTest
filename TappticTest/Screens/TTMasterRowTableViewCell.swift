//
//  TTMasterRowTableViewCell.swift
//  TappticTest
//
//  Created by Pawel Weglewski on 01/06/16.
//  Copyright © 2016 Pawel Weglewski. All rights reserved.
//

import UIKit
import SDWebImage

class TTMasterRowTableViewCell: UITableViewCell, TTConfigurableCellProtocol {

    @IBOutlet private weak var photoView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    func config(withModel model: Any) {
        guard let model = model as? TTRowModel
            else {
                return
        }
        if let name = model.name {
            nameLabel.text = name
        }
        if let image = model.imageURL {
            photoView.sd_setImageWithURL(NSURL(string: image))
        }
    }
    
    override func prepareForReuse() {
        photoView.sd_cancelCurrentImageLoad()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.backgroundColor = selected ? UIColor.redColor() : UIColor.clearColor()
        self.nameLabel.textColor = selected ? UIColor.whiteColor() : UIColor.blackColor()
    }
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        self.backgroundColor = highlighted ? UIColor.blueColor() : UIColor.clearColor()
        self.nameLabel.textColor = highlighted ? UIColor.whiteColor() : UIColor.blackColor()
    }
}
