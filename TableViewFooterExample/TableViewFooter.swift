//
//  TableViewFooter.swift
//  TableViewFooterExample
//
//  Created by Montemayor Elosua, Juan Carlos on 7/14/15.
//  Copyright (c) 2015 jmont. All rights reserved.
//

import UIKit

class TableViewFooter: UIView {
    let titleLabel : UILabel

    override init(frame: CGRect) {
        self.titleLabel = UILabel()

        super.init(frame: frame)

        self.setupTitleLabel(self.titleLabel)
    }

    required init(coder aDecoder: NSCoder) {
        self.titleLabel = UILabel()

        super.init(coder: aDecoder)

        self.setupTitleLabel(self.titleLabel)
    }

    func setupTitleLabel(label: UILabel) {
        label.numberOfLines = 0
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.addSubview(label)

        self.addConstraint(NSLayoutConstraint(item: label, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1.0, constant: 20.0))
        self.addConstraint(NSLayoutConstraint(item: label, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1.0, constant: -20.0))
        self.addConstraint(NSLayoutConstraint(item: label, attribute: .Right, relatedBy: .Equal, toItem: self, attribute: .Right, multiplier: 1.0, constant: -20.0))
        self.addConstraint(NSLayoutConstraint(item: label, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Left, multiplier: 1.0, constant: 20.0))
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        // Don't forget to set `preferredMaxLayoutWidth` so that multiline labels work
        self.titleLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.titleLabel.frame)

        super.layoutSubviews()
    }
}

extension UITableView {

    /// @note MUST be called in UITableViewController's `-viewDidLayoutSubviews`
    func layoutFooterView(footerView: TableViewFooter) {
        // Since AutoLayout doesn't play well with UITableView.tableFooterView, we have to calculate the size, and then set the frame of the tableFooterView.
        let calculatedHeight = footerView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height
        let tableViewFooterFrame = CGRectMake(0, 0, CGRectGetWidth(self.frame), calculatedHeight)

        if self.tableFooterView != footerView || !CGSizeEqualToSize(tableViewFooterFrame.size, footerView.frame.size) {
            footerView.frame = tableViewFooterFrame
            footerView.setNeedsLayout()
            footerView.layoutIfNeeded()
            self.tableFooterView = footerView
        }
    }
    
}
