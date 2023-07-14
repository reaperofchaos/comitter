//
//  ParserHelpers.swift
//  Committer
//
//  Created by Jacob Conner on 7/8/23.
//

import Foundation

func removeQuotes(value: String)->String{
    let update = value.replacingOccurrences(of: "\"", with: "", options: NSString.CompareOptions.literal)
    let update2 = update.replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal)
    let trimmedString = update2.trimmingCharacters(in: .whitespaces)

    return trimmedString
}

func CommitFileParser(content: String)->CommitFileData?{
    var feat: String? = nil
    var us: String? = nil
    var lastUpdatedDate: String? = nil
    
    let lines = content.split(separator:"\n")
    for line in lines{
        if(line.contains(":")){
            let split = line.split(separator:":")
          
            if(split[0].contains("FEAT")){
                feat = removeQuotes(value: String(split[1]))
            }
            if(split[0].contains("US")){
                us = removeQuotes(value: String(split[1]))
            }
            if(split[0].contains("LAST_UPDATE")){
                lastUpdatedDate = removeQuotes(value: String(split[1]))
            }
        }
    }
    
    if(feat != nil && us != nil && lastUpdatedDate != nil){
        return CommitFileData(feat: feat ?? "", us: us ?? "", lastUpdate: lastUpdatedDate ?? "")
    }
    
    return nil;
}
