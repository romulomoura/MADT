//
//  Orders.swift
//  FinalProject
//
//  Created by MacStudent on 2018-02-06.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import Foundation

public class Orders : IDisplay
{
    private var orderId:Int;
    private var dateCreated:String;
    private var status:String;
    private var orderDetails:[OrderDetails];
    
    private var dateShipped:String?;
    private var shippingInfo:ShippingInfo?;
    
    private var totalPrice:Double
    {
        get
        {
            var sum:Double = 0;
            
            for detail in orderDetails {
                sum += detail.subtotal;
            }
            
            return sum;
        }
    }
    
    init(orderId:Int)
    {
        self.orderId = orderId;
        self.dateCreated = Utils.formatDate(date: Date());
        self.status = "created";
        self.orderDetails = [OrderDetails]();
    }
    
    public func addProduct(_ details:OrderDetails) {
        orderDetails.append(details);
    }
    
    public func ship(_ shippingInfo:ShippingInfo) -> Bool
    {
        if self.shippingInfo != nil
        {
            print("Order Already Shipped!");
            return false;
        }
        
        if self.orderDetails.isEmpty
        {
            print("Cannot ship an empty order! Please buy something.");
            return false;
        }
        
        status = "shipped";
        dateShipped = Utils.formatDate(date: Date());
        self.shippingInfo = shippingInfo;
        
        print("Order shipped: " + shippingInfo.displayData());
        return true;
    }
    
    public func description() -> String
    {
        var desc = "\n# ORDER NUMBER \(orderId)\n";
        desc.append("# Date Created: \(dateCreated), Total Price: \(totalPrice), status: \(status)");
        
        if dateShipped != nil {
            desc.append(", Date Shipped: \(dateShipped!)");
        }
        else {
            desc.append(", NOT SHIPPED YET");
        }
        
        return desc;
    }
    
    public func displayData() -> String
    {
        var info = description();
        info.append("\n");
        
        let columnSize = 15;
        info.append("\(Utils.formatColumn("Product ID", columnSize)) \(Utils.formatColumn("Product Name", columnSize)) \(Utils.formatColumn("Unit Cost", columnSize)) \(Utils.formatColumn("Quantity", columnSize)) \(Utils.formatColumn("Subtotal", columnSize))\n");
        
        for detail in orderDetails
        {
            info.append("\(Utils.formatColumn(String(detail.item.id), columnSize)) \(Utils.formatColumn(String(detail.item.name), columnSize)) \(Utils.formatColumn(String(detail.item.price.currency()), columnSize)) \(Utils.formatColumn(String(detail.numberOfItems), columnSize)) \(Utils.formatColumn(String(detail.subtotal.currency()), columnSize)) \n");
        }
        
        return info;
    }
}
