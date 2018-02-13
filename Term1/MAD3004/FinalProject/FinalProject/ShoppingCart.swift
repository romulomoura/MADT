//
//  ShoppingCart.swift
//  FinalProject
//
//  Created by MacStudent on 2018-02-06.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import Foundation

public class ShoppingCart : IDisplay
{    
    private var orderDetails:[OrderDetails];
    
    init() {
        self.orderDetails = [OrderDetails]();
    }
   
    public func displayData() -> String
    {
        if orderDetails.isEmpty {
            return "Shopping Cart Empty";
        }
        
        let columnSize = 15;
		var data = "\(Utils.formatColumn("Product ID", columnSize)) \(Utils.formatColumn("Product Name", columnSize)) \(Utils.formatColumn("Unit Cost", columnSize)) \(Utils.formatColumn("Quantity", columnSize)) \(Utils.formatColumn("Subtotal", columnSize))\n";
		
		for detail in orderDetails {
			data.append("\(Utils.formatColumn(String(detail.item.id), columnSize)) \(Utils.formatColumn(String(detail.item.name), columnSize)) \(Utils.formatColumn(String(detail.item.price.currency()), columnSize)) \(Utils.formatColumn(String(detail.numberOfItems), columnSize)) \(Utils.formatColumn(String(detail.subtotal.currency()), columnSize)) \n");
		}
		
        return data;
    }
    
    public func addCartItem(product:Product)
    {        
        for detail in orderDetails
        {
            if detail.item.id == product.id
            {
                detail.numberOfItems += 1;
                print("Incrementing quantity of existing item: \(product.name)");
                return;
            }
        }
        
        print("Adding a new product to cart: \(product.name)")
        orderDetails.append(OrderDetails(product));        
    }
    
    public func updateQuantity(productId:Int, quantity:Int)
    {
        for detail in orderDetails
        {
            if detail.item.id == productId
            {
                detail.numberOfItems = quantity;
                return;
            }
        }
    }
    
    public func viewCartDetails() {
        print(displayData());
    }
    
    public func checkOut(costumer:Customer) {
        costumer.placeOrder(orderDetails: orderDetails);
    }
}
