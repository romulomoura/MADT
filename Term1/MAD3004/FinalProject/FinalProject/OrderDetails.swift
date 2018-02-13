//
//  OrderDetails.swift
//  FinalProject
//
//  Created by MacStudent on 2018-02-06.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import Foundation

public class OrderDetails : IDisplay
{
    private var product:Product;    
    private var quantity:Int;  
	
	public var item:Product
	{
		get {
			return product;
		}
	}
       
    public var numberOfItems:Int
    {
        get {
            return quantity;
        }
        
        set(newValue)
        {
            if newValue >= 0 {
                quantity = newValue;
            }
        }
    }
    
    public var subtotal:Double
    {
        get {            
            return Double(quantity) * product.price;
        }
    }
	   
    init(_ product:Product, quantity:Int = 1)
    {
        self.product = product;
        self.quantity = quantity;        
    }
        
    public func displayData() -> String {
        return "\(product.displayData()), Quantity: \(quantity), Subtotal: \(subtotal)";
    }
}
