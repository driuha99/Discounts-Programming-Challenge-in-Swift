//
//  Item.swift
//  BasketProject
//
//  Created by Rotari Andrei on 29/09/2022.
//

import Foundation

enum ItemType  {
    case A
    case B
    case C
    case D
    case E
}

enum DiscountType: Hashable {
    case noDiscount // When we have no discount on item
    case xForY(discountPrice: Int, itemsToDiscount: Int) // 2 for £20 and so on
    case oneExtra(itemsToDiscount: Int) // By one and get one extra for free
}


struct Item: Hashable  {
    let id: Int
    let type: ItemType
    let price: Float
    let discount: DiscountType
}



