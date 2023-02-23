//
//  unit.swift
//  ogrev1
//
//  Created by John F. Davis on 2/23/23.
//

import Foundation

enum AttackAction {
    block, // uses less stamina. Bonus to defense. 
    normal,
    heavy  // uses more stamina. Bonus to offense
}

enum AttackType {
    ranged,
    melee
}

enum Terrain {
    high_ground, // Bonus to offense and morale 
    wooded, // Bonus to defense. 
    entrenched, // Bonus to defense and morale
    normal,
    low_ground,  // Negative to offense and morale
    sand  // Negative to movement and morale
}

class Combat {

    var unit1: Unit
    var unit2: Unit

    init(unit1: Unit, unit2: Unit) {
        self.unit1 = unit1
        self.unit2 = unit2
    }

    // This coujld have a parameter for the type of attack
    func peform(unit1: Unit, unit2: Unit) {

        print("\(unit1.name) swings")
        // Ratio of offense:defense determines probability of hit
        // Ratio of morale gives slight adjustment

        // calculate toHit based upon ratio of offense to defense
        toHit = Double.random(in: 1.0 ... 100.0) * unit1.offense/unit2.defense 
        print("toHit = \(toHit)")
        // adjust based upon morale
        toHit +=  (unit1.morale/unit2.morale)*0.1
        print("toHit adj = \(toHit)")
        // Chose that attack has a 50% baseline
        if toHit > 50.0 {
            // On hit, unit1 increases morale, unit2 loses morale and hp
            print("\(unit1.name) hits")
            unit1.morale *= 1.1
            unit2.morale *= 0.9
            unit2.hp *= 0.9
        } else {
            // On miss, unit 1 loses morale and unit2 gains morale
            print("\(unit1.name) misses")
            unit2.morale *= 1.1
            unit1.morale *= 0.9
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
        
        // Determine who attacks first. Perform attack
        // and adjust stamina, morale and hp.  Repeat 
        // for second attacker.
        if initative1 > initative2 {
            perform(unit1: unit1, unit2: unit2)
            perform(unit1: unit2, unit2: unit1)
        } else {
            perform(unit1: unit2, unit2: unit1)
            perform(unit1: unit1, unit2: unit2)
        }

        // all units adjust stamina
        unit1.stamina *= 0.9
        unit2.stamina *= 0.9
    }
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


