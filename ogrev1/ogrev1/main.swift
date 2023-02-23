//
//  main.swift
//  ogrev1
//
//  Created by John F. Davis on 2/23/23.
//

import Foundation





func stage_fight() -> (Int, Int) {
    print("-----")

    let unit1 = Unit(name: "Cartman",
                     offense: 50,
                     defense: 50,
                     damage: 10,
                     stamina: 50,
                     morale: 50,
                     hp: 50)
    let unit2 = Unit(name: "Kyle",
                     offense: 50,
                     defense: 50,
                     damage: 10,
                     stamina: 50,
                     morale: 50,
                     hp: 50)

    
/*
    let unit1 = Unit(name: "dwarf",
                     offense: 50,
                     defense: 80,
                     damage: 10,
                     stamina: 90,
                     morale: 80,
                     hp: 40)
    let unit2 = Unit(name: "orc",
                     offense: 70,
                     defense: 50,
                     damage: 15,
                     stamina:70,
                     morale: 60,
                     hp: 50)
*/
 
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

var rounds = 0
var winner = 0
let NUM_TRIALS = 100
var trials = NUM_TRIALS

var avg_num_rounds = 0
var num_times_dwarf_wins = 0
var num_times_orc_wins = 0

while trials > 0 {

    (rounds, winner) = stage_fight()

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



//my_read_file(file_name: "unit")
