//
//  Product.swift
//  FinalProject
//
//  Created by MacStudent on 2018-02-09.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import Foundation

public class Product : IDisplay
{
    private var productId:Int;
    private var productName:String;
    private var unitCost:Double;
       
    public var id:Int
    {
        get {
            return productId;
        }
    }
    
    public var name:String
    {
        get {
            return productName;
        }
    }
	
	public var price:Double
    {
        get {
            return unitCost;
        }
        
        set(newValue)
        {
            if newValue >= 0 {
                unitCost = newValue;
            }
        }
    }
    
    init(productId:Int, productName:String, unitCost:Double)
    {
        self.productId = productId;
        self.productName = productName;
        self.unitCost = unitCost;        
    }
	
	public func displayData() -> String {
        return "ProductID: \(productId), Product Name: \(productName), Unit Cost: \(unitCost.currency())";
    }
}
