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

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func constrain(to width: CGFloat) {
        let halfWidth = width/2
        var cellContentWidth: CGFloat
        if textLabel.sizeThatFits(contentView.frame.size).width > halfWidth {
            cellContentWidth = width
        } else {
            cellContentWidth = halfWidth - 10 // whatever the space between them is supposed to be
        }

        widthConstraint.constant = cellContentWidth
    }

}
