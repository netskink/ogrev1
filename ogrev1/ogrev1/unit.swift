//
//  unit.swift
//  ogrev1
//
//  Created by John F. Davis on 2/23/23.
//

import Foundation


class Unit {
    let name: String
    // values are 1-100. Initially.  Can scale during combat to be greater than 100
    let offense: Double
    let defense: Double
    let damage: Double
    var stamina: Double
    var morale: Double
    // values are 0-50
    var hp: Double

    init(name: String, offense: Double, defense: Double, damage: Double, stamina: Double, morale: Double, hp: Double) {
        self.name = name
        self.offense = offense
        self.defense = defense
        self.damage = damage
        self.stamina = stamina
        self.morale = morale
        self.hp = hp
    }
    
    func dump() {
        print("-----")
        print("name: \(name)")
        print("hp: \(hp)")
        print("stamina: \(stamina)")
        print("morale: \(morale)")
        print("offense: \(offense)")
        print("defense: \(defense)")
    }
}


func test_one() {
    print("-----")
    
    let unit1 = Unit(name: "dwarf", offense: 5, defense: 8, damage: 5, stamina: 9, morale: 8, hp: 10)
    
    unit1.dump()
}




