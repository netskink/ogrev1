//
//  main.swift
//  ogrev1
//
//  Created by John F. Davis on 2/23/23.
//

import Foundation





func stage_fight(id1:Int, id2:Int) throws -> (Int, Int) {
    print("-----")

    // Read units from json file
    var unitsData: UnitsData
    do {
        unitsData = try  my_simple_file_read(path: "~/progs/myxcode/ogrev1/ogrev1/ogrev1/units.json")
    } catch {
        throw JFDFileError.UnknownError
    }
    
    
    let unit1 = Unit(name: unitsData.units[id1].name,
                     offense: unitsData.units[id1].offense,
                     defense: unitsData.units[id1].defense,
                     damage: unitsData.units[id1].damage,
                     stamina: unitsData.units[id1].stamina,
                     morale: unitsData.units[id1].morale,
                     hp: unitsData.units[id2].hp)
    let unit2 = Unit(name: unitsData.units[id2].name,
                     offense: unitsData.units[id2].offense,
                     defense: unitsData.units[id2].defense,
                     damage: unitsData.units[id2].damage,
                     stamina: unitsData.units[id2].stamina,
                     morale: unitsData.units[id2].morale,
                     hp: unitsData.units[id2].hp)

    
 
    let combat = Combat(unit1: unit1, unit2: unit2)
    
    var rounds = 1
    var winner = 0
    
    while unit1.hp > 1 && unit2.hp > 1 {
        combat.round(unit1: unit1, unit2: unit2)
        unit1.dump()
        unit2.dump()
        rounds += 1
    }
    
    print("After \(rounds) of combat, ", terminator: "")
    
    if (unit1.hp < 1 ) {
        print("\(unit1.name) dies!")
        winner = 2
    }

    if (unit2.hp < 1 ) {
        print("\(unit2.name) dies!")
        winner = 1
    }
    
    return (rounds, winner)
}


// ///////////////////
//  main
// ///////////////////


var rounds = 0
var winner = 0
let NUM_TRIALS = 100
var trials = NUM_TRIALS

var avg_num_rounds = 0
var num_times_dwarf_wins = 0
var num_times_orc_wins = 0

while trials > 0 {

    do {
        (rounds, winner) = try stage_fight(id1:0, id2:1)
    } catch {
        throw JFDFileError.JSONDecodeFailed

    }

    avg_num_rounds += rounds
    
    if winner == 1 {
        num_times_dwarf_wins += 1
    }
    if winner == 2 {
        num_times_orc_wins += 1
    }
    
    trials -= 1

}

print("----------------")
print("average number of rounds is \(avg_num_rounds/NUM_TRIALS)")
print("unit1 won \(num_times_dwarf_wins)")
print("unit2 won \(num_times_orc_wins)")




