//
//  CustomCellCollectionViewCell.swift
//  CollectionViewTest
//
//  Created by Joe Susnick on 10/23/17.
//  Copyright © 2017 Joe Susnick. All rights reserved.
//

import UIKit

class CustomCellCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var textLabel: UILabel!

    func constrain(to width: CGFloat) {
        // Needs to know what size the textLabel wants to be
        setNeedsLayout()
        layoutIfNeeded()

        contentView.translatesAutoresizingMaskIntoConstraints = false

        var cellContentWidth: CGFloat

        let halfWidth = width/2
        let spaceBetweenItems: CGFloat = 5

        let textLabelWidth = textLabel.systemLayoutSizeFitting(UILayoutFittingCompressedSize).width
        let contentViewInsets = contentView.layoutMargins.left - contentView.layoutMargins.right

        if textLabelWidth > halfWidth - contentViewInsets {
            cellContentWidth = width
        } else {
            cellContentWidth = halfWidth - spaceBetweenItems
        }

        widthConstraint.constant = cellContentWidth
    }

}
