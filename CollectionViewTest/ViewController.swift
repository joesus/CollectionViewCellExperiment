//
//  ViewController.swift
//  CollectionViewTest
//
//  Created by Joe Susnick on 10/23/17.
//  Copyright © 2017 Joe Susnick. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UINib(nibName: "CustomCellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")

            if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
            }
        }
    }

    let cellTitles = [
        "1Ipsum ipsum",
        "2Ipsum ipsum",
        "3Ipsum ipsumIpsum ipsumIpsum ipsumIpsum ipsumIpsum ipsumIpsum ipsumIpsum ipsumIpsum ipsumIpsum ipsumIpsum ipsumIpsum ipsumIpsum ipsum",
        "4Ipsum ipsumIpsum ipsum",
        "2Ipsum ipsum",
        "4Ipsum ipsumIpsum ipsum",
        "4Ipsum ipsumIpsum ipsum",
        "psum ipsumIpsum ipsumIpsum ipsumIpsum ipsumIpsum ipsumIpsum ipsumIpsum ipsumIpsum ipsumIpsum ipsumIpsum ipsum",
        "4Ipsum ipsumIpsum ipsum"

    ]

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        collectionView.collectionViewLayout.invalidateLayout()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellTitles.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        guard let customCell = cell as? CustomCellCollectionViewCell,
            let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return cell
        }
        customCell.textLabel.text = cellTitles[indexPath.row]

        let availableWidth = collectionView.frame.width - (flowLayout.sectionInset.left + flowLayout.sectionInset.right)

        customCell.constrain(to: availableWidth)
        return customCell
    }
}
