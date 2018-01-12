//
//  Datasource.swift
//  Rick And Morty
//
//  Created by Giuseppe Basile on 12/01/2018.
//  Copyright © 2018 Novoda. All rights reserved.
//

import Foundation

protocol CellPresentable {
    var name: String {get}
    var description: String {get}
    var imageName: String {get}
}

struct CellViewModel: CellPresentable {
    let name: String
    let description: String
    let imageName: String
}

protocol CellPresentableConvertible {
    func toCellPresentable() -> CellPresentable
}

class Datasource {
    let items: [Rick]
    let itemCount: Int

    init(items: [Rick]) {
        self.items = items
        self.itemCount = items.count
    }

    func presentable(at indexPath: IndexPath) -> CellPresentable {
        return items[indexPath.row].toCellPresentable()
    }
}

extension Rick: CellPresentableConvertible {
    func toCellPresentable() -> CellPresentable {
        return CellViewModel(name: name, description: description, imageName: image)
    }
}
