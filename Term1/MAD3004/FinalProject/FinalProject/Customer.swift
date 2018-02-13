//
//  Customer.swift
//  FinalProject
//
//  Created by MacStudent on 2018-02-02.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import Foundation

public class Customer : User
{
    private var customerName:String;
    private var address:String;
    private var email:String;
    private var creditCardInfo:String;
    private var shippingInfo:ShippingInfo;
    private var shoppingCart:ShoppingCart;
    private var orders:[Orders];
    
    public var cart:ShoppingCart
    {
        get {
            return shoppingCart;
        }
    }
    
    public var shipInfo:ShippingInfo
    {
        get {
            return shippingInfo;
        }
    }
    
    init(userName:String, password:String, customerName:String, address:String, email:String, creditCardInfo:String, shippingInfo: ShippingInfo)
    {
        self.customerName = customerName;
        self.address = address;
        self.email = email;
        self.creditCardInfo = creditCardInfo;
        self.shippingInfo = shippingInfo;
        self.shoppingCart =  ShoppingCart();
        self.orders = [Orders]();
        
        super.init(userName, password);
    }
    
    public override func displayData() -> String
    {
        var data = super.displayData();
        data.append("\n");
        data.append("Customer Name: \(customerName), Address: \(address), Email: \(email), Credit Card Info: \(creditCardInfo)");
        data.append("\n");
        data.append(shippingInfo.displayData());
        data.append("\n");
        data.append(shoppingCart.displayData());
        
        return data;
    }
    
    public func displayOrders() -> String
    {
        var desc = " ------------------ Orders ---------------------";
        
        for order in orders {
            desc.append(order.description());
        }
        
        return desc;
    }
    
    public func getOrderById(orderId:Int) -> Orders {
        return orders[orderId];
    }
    
    public func register()
    {
        if email.isValidEmail() {
            print("User \(customerName) successfuly registered.");
        }
        else {
            print("Email \(email) is not valid!");
        }
    }    
    
    public func updateProfile(customerName:String, address:String, email:String, creditCardInfo:String, shippingInfo: ShippingInfo)
    {
        self.customerName = customerName;
        self.address = address;
        self.email = email;
        self.creditCardInfo = creditCardInfo;
        self.shippingInfo = shippingInfo;
        
        print("Customer profile successfuly updated!");
    }    
    
    public func placeOrder(orderDetails:[OrderDetails])
    {
        let order = Orders(orderId: orders.count);
        orders.append(order);
        
        for detail in orderDetails {
            order.addProduct(detail);
        }
        
        print("New order placed for: \(customerName)");
    }    
}
