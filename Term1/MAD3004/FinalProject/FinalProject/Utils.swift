//
//  Utils.swift
//  FinalProject
//
//  Created by MacStudent on 2018-02-08.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import Foundation

public class Utils
{
    static func formatDate(date: Date) -> String
    {
        let formatter = DateFormatter();
        formatter.dateFormat = "EEEE, dd MMMM, yyyy";
        return formatter.string(from: date);
    }
    
    static func formatColumn(_ str:String, _ length:Int) -> String
    {
        var data = str;
        
        for _ in stride(from: str.count, to: length, by: 1) {
            data.append(" ");
        }
        
        return data;
    }
}

extension Double
{
    func currency() -> String {
        return "$ \(self)"
    }    
}

extension String
{
    func isValidEmail() -> Bool
    {
        let regex = try! NSRegularExpression(pattern: ".+[@].+[.].+");
        return (regex.firstMatch(in: self, range: NSRange(location: 0, length: self.count)) != nil);
    }
}
