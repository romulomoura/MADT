//
//  main.swift
//  FinalProject
//
//  Created by MacStudent on 2018-02-01.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import Foundation

print("\n### Creating the Administrator and print details ####");
var admin = Administrator(userName: "admin", password: "12345", email: "admin@mail.com", adminName: "Mr. Admin");
print(admin.displayData());

print("\n-- Try to log in");
admin.login("admin", "1234");
admin.login("admin", "12345");

print("\n-- Updating system catalog and log out");
admin.updateCatalog();
admin.logout();

print("\n### Create a user and print details ###");
var shippingInfo = ShippingInfo(shippingId: 1, shippingType: "FastMail", shippingCost: 25.00, shippingRegionalId: 4);
var customer = Customer(userName: "customer", password: "54321", customerName: "Mr. User", address: "34 Street Road", email: "user.mail.com", creditCardInfo: "1254 8985 8532 0014", shippingInfo: shippingInfo);
customer.register();

print("\n### Wrong email, let's try again! ###");
customer.updateProfile(customerName: "Mr. User", address: "34 Street Road", email: "user@mail.com", creditCardInfo: "1254 8985 8532 0014", shippingInfo: shippingInfo);
customer.register();

print(customer.displayData());

print("\n-- Try to log in");
customer.login("customer", "54321");

print("\n-- Let's buy something");
var catalog = Catalog.getInstant();
customer.cart.addCartItem(product: catalog.getProduct(productId: 1));
customer.cart.addCartItem(product: catalog.getProduct(productId: 4));
customer.cart.addCartItem(product: catalog.getProduct(productId: 5));
customer.cart.addCartItem(product: catalog.getProduct(productId: 1));
customer.cart.addCartItem(product: catalog.getProduct(productId: 8));
customer.cart.addCartItem(product: catalog.getProduct(productId: 5));

print("\n-- Let's see the cart so far...");
print(customer.cart.displayData());

print("\n-- It's enough.. let's place the order");
customer.cart.checkOut(costumer: customer);

print("\n-- Let's see all orders for the customer\n");
print(customer.displayOrders());

print("\n-- Let's see the details of the last order\n");
print(customer.getOrderById(orderId: 0).displayData());

print("\n-- Let's try to ship the last order to the customer\n");

if customer.getOrderById(orderId: 0).ship(customer.shipInfo) {
    print("The Order has been shipped! 👏");
}

print("\n-- Let's try to ship the last order again\n");

if customer.getOrderById(orderId: 0).ship(customer.shipInfo) {
    print("The Order has been shipped! 👏");
}

print("\n-- Finally, logout the customer\n");
customer.logout();

print("\n\n############################\n\n");



