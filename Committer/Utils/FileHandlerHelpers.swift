//
//  FileHandlerHelpers.swift
//  Committer
//
//  Created by Jacob Conner on 7/7/23.
//

import Foundation

func writeFile(fileName: String, directory: URL, contents: String) -> Void{
    let file = directory.appendingPathComponent(fileName)
        
    do{
        try contents.write(to: file, atomically: true, encoding: .utf8)
                   let input = try String(contentsOf: file)
                   print(input)
    }catch{
        print(error.localizedDescription)
    }
}

func generateFileContents(commitType: String, feat: String, us: String, message: String)->String{
    let today = Date.now
    let formatter1 = DateFormatter()
    formatter1.dateFormat = "YYYY-MM-d HH:mm"
    let dateString = formatter1.string(from: today)
    
    return "{\n\t\"FEAT\": \"\(feat)\",\n\t\"US\": \"\(us)\"\n\t\"LAST_UPDATE\": \"\(dateString)\"\n}"
}

func readFile(directory: URL)->CommitFileData?{
    let file = directory.appendingPathComponent("commit.txt")
    do{
        let contents = try String(contentsOf: file, encoding: .utf8)
        print(contents);
        return CommitFileParser(content: contents)

    }catch{
        print(error.localizedDescription)
    }
    
    return nil
}
