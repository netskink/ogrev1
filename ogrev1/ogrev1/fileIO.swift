//
//  fileIO.swift
//  ogrev1
//
//  Created by John F. Davis on 2/23/23.
//

import Foundation



struct UnitData: Decodable {
    var name: String = "none"
    var race: String = "none"
    // values are 1-100. Initially.  Can scale during combat to be greater than 100
    var offense: Double = 0.0
    var defense: Double = 0.0
    var damage: Double = 0.0
    var stamina: Double = 0.0
    var morale: Double = 0.0
    // values are 0-50
    var hp: Double = 0.0
}

struct UnitsData: Decodable {
    var units: [UnitData]
}




// my first attemp
//
// https://stackoverflow.com/a/36827996/1008596


enum JFDFileError: Error {
    case FileNotFound
    case JSONDecodeFailed
    case UnknownError
}


// https://www.swiftbysundell.com/articles/working-with-files-and-folders-in-swift/
// https://github.com/JohnSundell/Files/blob/master/Sources/Files.swift
//func my_simple_file_read(path: String) throws -> UnitsData {
func my_simple_file_read(path: String) throws -> UnitsData {

    print("path is \(path)")
    
    let file_name = (path as NSString).expandingTildeInPath
    print("file_name is \(file_name)")

    
    let url = URL(fileURLWithPath: file_name)
    print("url is \(url)")
    
    // Read the file
    var data: Data
    do {
        data = try Data(contentsOf: url)
        print("data is \(data)")
    } catch {
        throw JFDFileError.FileNotFound
    }

    var unitsData: UnitsData
    do {
        let decoder = JSONDecoder()
        unitsData = try decoder.decode(UnitsData.self, from: data)
        print("json data is \(unitsData)")
        print("json data.name is \(unitsData.units[1].name)")
    } catch {
        throw JFDFileError.JSONDecodeFailed
    }




    print("===.name is \(unitsData.units[1].name)")
    return unitsData
    
}


func mySimpleFileRead(path: String) throws -> UnitsData {
        
    let fileName = (path as NSString).expandingTildeInPath
    let url = URL(fileURLWithPath: fileName)
   
    let data = try Data(contentsOf: url)
    return try JSONDecoder().decode(UnitsData.self, from: data)
}
