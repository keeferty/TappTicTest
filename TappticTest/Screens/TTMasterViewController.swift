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
    var preselected: Bool = false
    
    private let viewmodel = TTMasterViewModel()
    private var selectedIndex : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = viewmodel.tableAdapter
        viewmodel.activate { 
            self.tableView.reloadData()
            self.modifyBehaviourForSplitView()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        modifyBehaviourForSplitView()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let dstCtrl = segue.destinationViewController as? TTDetailViewController {
                dstCtrl.viewModel = TTDetailViewModel(withRow: viewmodel.itemForIndex(selectedIndex))
            }
        }
    }
    
    func modifyBehaviourForSplitView() {
        if let splitCtrl = self.navigationController?.parentViewController as? UISplitViewController {
            if splitCtrl.collapsed {
                if let indexPath = tableView.indexPathForSelectedRow {
                    tableView.deselectRowAtIndexPath(indexPath, animated: true)
                    preselected = false
                }
            }else {
                if tableView.indexPathForSelectedRow == nil {
                    let indexPath = NSIndexPath(forRow: 0, inSection: 0)
                    tableView.selectRowAtIndexPath(indexPath, animated: true, scrollPosition: .None)
                    tableView(tableView, didSelectRowAtIndexPath: indexPath)
                }
            }
        }
    }
}

extension TTMasterViewController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        preselected = true
        selectedIndex = indexPath.row
        performSegueWithIdentifier("showDetail", sender: self)
    }
}