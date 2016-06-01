//
//  TTTableViewAdapter.swift
//  TappticTest
//
//  Created by Pawel Weglewski on 01/06/16.
//  Copyright © 2016 Pawel Weglewski. All rights reserved.
//

import UIKit

class TTTableViewAdapter<T, Cell: UITableViewCell where Cell: TTConfigurableCellProtocol> : NSObject, UITableViewDataSource {
    
    typealias SectionTuple = (name: String, items:[T])
    private let cellIdentifier = String(Cell)
    private var items : [T]? = nil
    
    override init() {
        super.init()
    }
    
    func updateDatasource(items : [T]) {
        self.items = items
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! Cell
        if let items = self.items {
            cell.config(withModel: items[indexPath.row] )
        }
        
        return cell
    }
}

