//
//  ShippingInfo.swift
//  FinalProject
//
//  Created by MacStudent on 2018-02-06.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import Foundation

public class ShippingInfo : IDisplay
{
    private var shippingId:Int;
    private var shippingType:String;
    private var shippingCost:Double;
    private var shippingRegionalId:Int;
    
    init(shippingId:Int, shippingType:String, shippingCost:Double, shippingRegionalId:Int)
    {
        self.shippingId = shippingId;
        self.shippingType = shippingType;
        self.shippingCost = shippingCost;
        self.shippingRegionalId = shippingRegionalId;
    }
    
    public func displayData() -> String
    {
        return "Shipping ID: \(shippingId), Shipping Type: \(shippingType), Shipping Cost: \(shippingCost), Shipping Regional ID: \(shippingRegionalId)";
    }
}
