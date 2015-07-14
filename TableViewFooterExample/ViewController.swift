//
//  ViewController.swift
//  TableViewFooterExample
//
//  Created by Montemayor Elosua, Juan Carlos on 7/14/15.
//  Copyright (c) 2015 jmont. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    let items = ["1", "2", "3"]
    let cellReuseIdentifier = "com.jmont.table-view-footer-example.cell"
    let tableViewFooter : TableViewFooter

    required init!(coder aDecoder: NSCoder!) {
        self.tableViewFooter = TableViewFooter()

        super.init(coder: aDecoder)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        self.tableView.layoutFooterView(self.tableViewFooter)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // This prevents the TableView from showing infinite cell separators before it displays content.
        self.tableViewFooter.titleLabel.attributedText = NSAttributedString(string: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.")
        self.tableViewFooter.backgroundColor = UIColor.lightGrayColor()
        self.tableView.tableFooterView = self.tableViewFooter

        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier) as! UITableViewCell
        cell.textLabel?.text = self.items[indexPath.row]
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
}

