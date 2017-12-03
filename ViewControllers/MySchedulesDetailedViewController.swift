//
//  MySchedulesDetailedViewController.swift
//  SSUSchedulePlanner
//
//  Created by student on 11/8/17.
//  Copyright © 2017 Ivan Lim. All rights reserved.
//

import UIKit
import CollapsibleTableSectionViewController

class MySchedulesDetailedViewController: UITableViewController {

    // var schedule = Schedule()

  //  var sections = Section(name: "", items: [Item])
    var sections = termData
    var terms = [Term]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         // Auto resizing the height of the cell
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
    
    }
    
}

//
// MARK: - View Controller DataSource and Delegate
//
extension MySchedulesDetailedViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return terms.count

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (terms[section].classes?.count)!
    }
    
    // Cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CollapsibleTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CollapsibleTableViewCell ??
            CollapsibleTableViewCell(style: .default, reuseIdentifier: "cell")
        
        // let term: Term = terms[indexPath.section]
        let classes = Array(self.terms[indexPath.section].classes!) as! [Class]
        
        cell.nameLabel.text = classes[indexPath.row].class_Name
        cell.detailLabel.text = "1 Unit"
       
        /*
        let item: Item = sections[indexPath.section].items[indexPath.row]
        
        cell.nameLabel.text = item.name
        cell.detailLabel.text = item.detail
         */
 
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    // Header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? CollapsibleTableViewHeader ?? CollapsibleTableViewHeader(reuseIdentifier: "header")
        
        header.titleLabel.text = terms[section].termName
       // header.arrowLabel.text = ">"
        header.setCollapsed(sections[section].collapsed)
        
        header.section = section
        header.delegate = self
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
}

//
// MARK: - Section Header Delegate
//
extension MySchedulesDetailedViewController: CollapsibleTableViewHeaderDelegate {
    
    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int) {
        let collapsed = !sections[section].collapsed
        
        // Toggle collapse
        sections[section].collapsed = collapsed
        header.setCollapsed(collapsed)
        
        tableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
    }
    
}

