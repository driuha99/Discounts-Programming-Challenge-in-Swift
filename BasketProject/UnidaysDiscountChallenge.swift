//
//  UnidaysDiscountChallenge.swift
//  BasketProject
//
//  Created by Rotari Andrei on 29/09/2022.
//

import Foundation


class UnidaysDiscountChallenge {
    
    private var basket: [Item : Int] = [:]
    
    // TODO: - Remove print function after testing
    private var toatlPrice: Float = 0.0 {
        didSet {
            print(toatlPrice)
        }
    }
    
    // Check if delivery charge is applicable
    private var deliveryCharge: Float {
        return toatlPrice >= 50 ? 0.0 : 7.0
    }
    
    
    // Returns items into the basket -> ItemA, ItemB...
    private var totalItemsIntoBasket: Int {
        return basket.values.reduce(0) { $0 + $1 }
    }
    
    
    // Method that adds items to the basket
    public func addToBasket(item: Item, ocurence: Int = 1) {
        
        if let newItem = basket[item] {
            basket.updateValue(ocurence + newItem , forKey: item)
        } else {
            basket.updateValue(ocurence, forKey: item)
        }
        
        calculatePriceForAdded(item: item)
        
    }
    
    
    private func calculatePriceForAdded(item: Item) {
        
        if let numberOfItems = basket[item] {
            // Check for item discount
            switch item.discount {
            case .noDiscount:
                let newPrice = Float(numberOfItems) * item.price
                updateTotalPrice(with: newPrice)
                
            case .xForY(let discountPrice, let itemsToDiscount):
                let newPrice = (numberOfItems / itemsToDiscount) * discountPrice + (numberOfItems % itemsToDiscount) * Int(item.price)
                
                updateTotalPrice(with: Float(newPrice))
                
            case .oneExtra(let itemsToDiscount):
                let newPrice = round(Float(numberOfItems) / Float(itemsToDiscount)) * item.price
                updateTotalPrice(with: newPrice)
                
            default:
                print("Ups! It seems there is no discount formula for this product yet.")
            }
        
        }
        
        
    }
    
    // Retrun total price and delivery charge price
    public func getTotalPrice() -> (totalPrice: Float, deliveryCharge: Float) {
        return (toatlPrice,deliveryCharge)
    }
    
    
    
    private func updateTotalPrice(with value: Float) {
        toatlPrice += value
    }
}

