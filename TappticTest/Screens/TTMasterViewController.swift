//
//  TTMasterViewController.swift
//  TappticTest
//
//  Created by Pawel Weglewski on 01/06/16.
//  Copyright © 2016 Pawel Weglewski. All rights reserved.
//

import UIKit

class TTMasterViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    private let tableAdapter = TTTableViewAdapter<TTRowModel, TTMasterRowTableViewCell>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = tableAdapter
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        TTDataCenter.instance.getList({ (message) in
            
            }) { [unowned self](modelList) in
                self.tableAdapter.updateDatasource(modelList)
                dispatch_async(dispatch_get_main_queue(), { 
                    self.tableView.reloadData()                    
                })
        }
    }

}
