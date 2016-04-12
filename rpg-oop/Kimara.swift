//
//  Kimara.swift
//  rpg-oop
//
//  Created by Amadeu Andrade on 12/04/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import Foundation

class Kimara: Enemy {

    private var _immune: Int = 15
    
    override var loot: [String] {
        return ["Tough Hide", "Kimara Venom", "Rare Trident"]
    }
    
    override var type: String {
        return "Kimara"
    }
    
    var immune: Int {
        get {
            return _immune
        }
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if immune > attackPwr {
            return false
        } else {
            return super.attemptAttack(attackPwr)
        }
    }
    
}