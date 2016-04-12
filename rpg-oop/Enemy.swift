//
//  Enemy.swift
//  rpg-oop
//
//  Created by Amadeu Andrade on 12/04/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import Foundation

class Enemy: Character {
    
    private var _loot: [String] = ["Rusty Dagger", "Cracked Buckler"]
    private var _type: String = "Grunt"
    
    var loot: [String] {
        get {
            return _loot
        }
    }
    
    var type: String {
        get {
            return _type
        }
    }
    
    func dropLoot() -> String? {
        if !isAlive {
            let rand = Int(arc4random_uniform(UInt32(2)))
            return _loot[rand]
        }
        return nil
    }
    

}