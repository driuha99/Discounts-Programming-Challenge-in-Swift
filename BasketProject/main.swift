//
//  main.swift
//  BasketProject
//
//  Created by Rotari Andrei on 29/09/2022.
//

import Foundation


var example = UnidaysDiscountChallenge()

let itemA = Item(id: 0, type: .A, price: 8.00, discount: .noDiscount)
let itemB = Item(id: 1, type: .B, price: 12.00, discount: .xForY(discountPrice: 20, itemsToDiscount: 2))
let itemC = Item(id: 2, type: .C, price: 4.00, discount: .xForY(discountPrice: 10, itemsToDiscount: 3))
let itemD = Item(id: 3, type: .D, price: 7.00, discount: .oneExtra(itemsToDiscount: 2))
let itemE = Item(id: 4, type: .E, price: 5.00, discount: .xForY(discountPrice: 10, itemsToDiscount: 3))




example.addToBasket(item: itemD, ocurence: 3)


print("Total price: £\(example.getTotalPrice().totalPrice)")
print("Delivery cost: £\(example.getTotalPrice().deliveryCharge)")




