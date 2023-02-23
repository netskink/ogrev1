//
//  unit.swift
//  ogrev1
//
//  Created by John F. Davis on 2/23/23.
//

import Foundation


class Unit {
    var name: String
    // values are 1-100
    var offense: Double
    var defense: Double
    var stamina: Double
    var morale: Double
    // values are 0-50
    var hp: Double

    init(name: String, offense: Double, defense: Double, stamina: Double, morale: Double, hp: Double) {
        self.name = name
        self.offense = offense
        self.defense = defense
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

func round(unit1: Unit, unit2: Unit) {
    // Determine who swings first
    // offense and morale
    var initative1: Double
    var initative2: Double
    var toHit: Double


    initative1 = Double.random(in: 1.0 ... 100.0) + unit1.offense  + unit1.morale
    initative2 = Double.random(in: 1.0 ... 100.0) + unit2.offense  + unit2.morale
    
    if initative1 > initative2 {
        print("\(unit1.name) swings first")
        // Ratio of offense:defense determines probability of hit
        // Ratio of morale gives slight adjustment
        toHit = Double.random(in: 1.0 ... 100.0) * unit1.offense/unit2.defense //+ (unit1.morale/unit2.morale)*0.1
        print("toHit = \(toHit)")
        toHit +=  (unit1.morale/unit2.morale)*0.1
        print("toHit adj = \(toHit)")
        if toHit > 50.0 {
            print("\(unit1.name) hits")
            unit1.morale *= 1.1
            unit2.morale *= 0.9
            unit2.hp *= 0.9
        } else {
            print("\(unit1.name) misses")
            unit2.morale *= 1.1
            unit1.morale *= 0.9
        }
    } else {
        print("\(unit2.name) swings first")
        toHit = Double.random(in: 1.0 ... 100.0) * unit2.offense/unit1.defense //+ (unit1.morale/unit2.morale)*0.1
        print("toHit = \(toHit)")
        toHit +=  (unit1.morale/unit2.morale)*0.1
        print("toHit adj = \(toHit)")
        if toHit > 50.0 {
            print("\(unit2.name) hits")
            unit2.morale *= 1.1
            unit1.morale *= 0.9
            unit1.hp *= 0.9
        } else {
            print("\(unit2.name) misses")
            unit1.morale *= 1.1
            unit2.morale *= 0.9
        }
    }

    unit1.stamina *= 0.9
    unit2.stamina *= 0.9

    
    
    // unit 1 attacks/flees, update stamina, morale and hp
    
    
    
    // unit 2 attacks/flees, update stamina, morale and hp
    
    
}

func test_one() {
    print("-----")
    
    let unit1 = Unit(name: "dwarf", offense: 5, defense: 8, stamina: 9, morale: 8, hp: 10)
    
    unit1.dump()
}


func test_two() {
    print("-----")
    
    let unit1 = Unit(name: "dwarf", offense: 50, defense: 80, stamina: 90, morale: 80, hp: 10)
    let unit2 = Unit(name: "orc", offense: 70, defense: 50, stamina:70, morale: 60, hp: 15)
        
    round(unit1: unit1, unit2: unit2)
    unit1.dump()
    unit2.dump()

    
}

func test_three() {
    print("-----")
    
    let unit1 = Unit(name: "dwarf", offense: 50, defense: 80, stamina: 90, morale: 80, hp: 10)
    let unit2 = Unit(name: "orc", offense: 70, defense: 50, stamina:70, morale: 60, hp: 15)
        
    
    while unit1.hp > 1 && unit2.hp > 1 {
        round(unit1: unit1, unit2: unit2)
        unit1.dump()
        unit2.dump()
    }
    
    if (unit1.hp < 1 ) {
        print("\(unit1.name) dies!")
    }

    if (unit2.hp < 1 ) {
        print("\(unit2.name) dies!")
    }

    
}


