//
//  ArrayDataSource.swift
//  Rick And Morty
//
//  Created by Giuseppe Basile on 04/07/2016.
//  Copyright © 2016 Novoda. All rights reserved.
//

import Foundation
import UIKit

protocol ReusableCell {
    associatedtype ItemType

    static var reuseIdentifier: String { get }
    func configure(item: ItemType) -> ()
}

extension ReusableCell {
    static var reuseIdentifier: String { return String(Self) }
}

class ArrayDataSource<ItemType, CellType where CellType: ReusableCell>: NSObject, UICollectionViewDataSource {

    var items: [ItemType]
    let cellType: CellType.Type


    init(items: [ItemType], cellType cell: CellType.Type) {
        self.items = items
        cellType = cell
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellType.reuseIdentifier, forIndexPath:indexPath)
        return cell
    }
}
