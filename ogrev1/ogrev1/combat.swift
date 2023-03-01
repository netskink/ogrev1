//
//  unit.swift
//  ogrev1
//
//  Created by John F. Davis on 2/23/23.
//

import Foundation

enum AttackAction {
    case block // uses less stamina. Bonus to defense.
    case normal
    case heavy  // uses more stamina. Bonus to offense
}

enum AttackType {
    case ranged
    case melee
}

enum Terrain {
    case high_ground // Bonus to offense and morale
    case wooded // Bonus to defense.
    case entrenched // Bonus to defense and morale
    case normal
    case low_ground  // Negative to offense and morale
    case sand  // Negative to movement and morale
}

class Combat {

    var unit1: Unit
    var unit2: Unit

    init(unit1: Unit, unit2: Unit) {
        self.unit1 = unit1
        self.unit2 = unit2
    }

    //
    // This coujld have a parameter for the type of attack
    func resolveRound(unit1: Unit, unit2: Unit) {

        var toHit: Double

        print("\(unit1.name) swings and ", terminator: "")
        // Ratio of offense:defense determines probability of hit
        // Ratio of morale gives slight adjustment

        // calculate toHit based upon ratio of offense to defense
        toHit = Double.random(in: 1.0 ... 100.0) * unit1.offense/unit2.defense 
        //print("toHit = \(toHit)")
        // adjust based upon morale
        toHit +=  (unit1.morale/unit2.morale)*0.1
        //print("toHit adj = \(toHit)")
        // Chose that attack has a 50% baseline
        if toHit > 50.0 {
            // On hit, unit1 increases morale, unit2 loses morale and hp
            print("hits")
            unit1.morale *= 1.1
            unit2.morale *= 0.9
            // Damage is random between 1.0 and max of unit1.damage
            // adjusted by stamina
            unit2.hp -= Double.random(in: 1.0 ... unit1.damage)*(1 + myNormalize(a_numnber: unit1.stamina))
        } else {
            // On miss, unit 1 loses morale and unit2 gains morale
            print("misses")
            unit2.morale *= 1.1
            unit1.morale *= 0.9
        }
    }

    //
    //
    func performRound(unit1: Unit, unit2: Unit) {

        // Determine who swings first
        // offense and morale
        var initative1: Double
        var initative2: Double


        initative1 = Double.random(in: 1.0 ... 100.0) + unit1.offense/unit2.defense  + unit1.morale
        initative2 = Double.random(in: 1.0 ... 100.0) + unit2.offense/unit1.defense  + unit2.morale
        
        // Determine who attacks first. Perform attack
        // and adjust stamina, morale and hp.  Repeat 
        // for second attacker.
        if initative1 > initative2 {
            resolveRound(unit1: unit1, unit2: unit2)
            resolveRound(unit1: unit2, unit2: unit1)
        } else {
            resolveRound(unit1: unit2, unit2: unit1)
            resolveRound(unit1: unit1, unit2: unit2)
        }

        // all units adjust stamina
        unit1.stamina *= 0.9
        unit2.stamina *= 0.9
    }
}


