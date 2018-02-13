//
//  User.swift
//  FinalProject
//
//  Created by MacStudent on 2018-02-01.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import Foundation

public class User : IDisplay
{
    private var userName:String;
    private var password:String;
    private var loginStatus:String;
    
    init(_ userName:String, _ password:String)
    {
        self.userName = userName;
        self.password = password;
        self.loginStatus = "off";
    }
    
    public func verifyLogin() -> Bool {
        return loginStatus == "on";
    }
    
    public func login(_ userName:String, _ password:String) 
	{
		if loginStatus == "on" 
		{
			print("User already logged in");
			return;
		}
			
		if userName == self.userName && password == self.password 
		{
			loginStatus = "on";
			print("User \(userName) logged in");
		}
		else {
			print("Incorrect username or password");
		}
    }
    
    public func logout() 
	{
        loginStatus = "off";
		print("The user has been logged out");
    }
    
    public func displayData() -> String {
        return "User Name: \(userName), password: <protected> Login Status: \(loginStatus)";
    }
}
