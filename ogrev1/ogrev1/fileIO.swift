//
//  fileIO.swift
//  ogrev1
//
//  Created by John F. Davis on 2/23/23.
//

import Foundation

struct UnitData: Decodable {
    var name: String
}

/*
 
 https://stackoverflow.com/a/36827996/1008596
 
 
func my_read_file(file_name: String) -> [UnitData]? {
    
    print("file_name is \(file_name)")

    if let url = Bundle.main.url(forResource: file_name, withExtension: "json") {
        
        do {
            let data = try Data(contentsOf: url)
            let decoder  = JSONDecoder()
            let jsonData = try decoder.decode(UnitData.self, from: data)
            print(jsonData.name)
            return jsonData
        } catch {
            print("error: \(error)")
        }
    }
    return nil
}
*/
