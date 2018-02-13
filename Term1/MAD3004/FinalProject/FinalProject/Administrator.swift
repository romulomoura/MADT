//
//  Administrator.swift
//  FinalProject
//
//  Created by MacStudent on 2018-02-01.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import Foundation

public class Administrator : User
{
    private var email:String;
    private var adminName:String;
    
    init(userName:String, password:String, email:String, adminName:String)
    {
        self.adminName = adminName;
        self.email = email;
        
        super.init(userName, password);
    }    
    
    public func updateCatalog()
    {
        Catalog.getInstant().addProduct(
			Product(productId:1,productName:"Hard drive",unitCost:240.50),
			Product(productId:2,productName:"Memory",unitCost:120.60),
			Product(productId:3,productName:"ZIP drive",unitCost:150.40),
			Product(productId:4,productName:"Floppy disk",unitCost:5.60),
			Product(productId:5,productName:"Monitor",unitCost:240.10),
			Product(productId:6,productName:"DVD drive",unitCost:180.20),
			Product(productId:7,productName:"CD drive",unitCost:90.20),
			Product(productId:8,productName:"Printer",unitCost:270.30),
            Product(productId:9,productName:"Toner cartridge",unitCost:66.30),
            Product(productId:10,productName:"DVD burner",unitCost:180.20)
		);
	}
	
    public override func displayData() -> String
    {
		return
        """
        \(super.displayData())
        Admin Name: \(adminName), Email: \(email)
        """;
    }
}
