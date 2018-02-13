//
//  Catalog.swift
//  FinalProject
//
//  Created by MacStudent on 2018-02-09.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import Foundation

public class Catalog
{
	private static var instant = Catalog();
	
	private var products:[Int:Product];
	
    private init() {
		products = [Int:Product]();
	}
	
	public static func getInstant() -> Catalog {
		return instant;
	}	
	
	public func addProduct(_ product:Product...) 
	{
		for p in product
        {
			products[p.id] = p;
            print(" * Adding product \(p.name) to Catalog");
		}
	}
	
	public func getProduct(productId:Int) -> Product {
        return products[productId]!;
	}
}
