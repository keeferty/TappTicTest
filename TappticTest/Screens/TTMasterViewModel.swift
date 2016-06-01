//
//  TTMasterViewModel.swift
//  TappticTest
//
//  Created by Pawel Weglewski on 01/06/16.
//  Copyright © 2016 Pawel Weglewski. All rights reserved.
//

import UIKit

class TTMasterViewModel: NSObject {
    
    let tableAdapter = TTTableViewAdapter<TTRowModel, TTMasterRowTableViewCell>()
    private var list = [TTRowModel]()
    func activate(failure : (message: String) -> Void, completion : () -> Void) {
        TTDataCenter.instance.getList({ (message) in
            failure(message: message)
        }) { [unowned self](modelList) in
            self.list = modelList
            self.tableAdapter.updateDatasource(modelList)
            completion()
        }
    }
    
    func itemForIndex(index: Int) -> TTRowModel? {
        guard list.count > 0
            else {
                return nil
        }
        return list[index]
    }
}
