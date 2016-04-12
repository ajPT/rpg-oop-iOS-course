//
//  Player.swift
//  rpg-oop
//
//  Created by Amadeu Andrade on 12/04/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import Foundation

class Player: Character {

    private var _name: String = "Player"
    private var _lootInventory: [String] = [String]()
    
    var name: String {
        get {
            return _name
        }
    }
    
    var lootInventory: [String] {
        get {
            return _lootInventory
        }
    }
    
    func addItemToInventory(lootReceived: String) {
        _lootInventory.append(lootReceived)
    }
    
    convenience init(name: String, hp: Int, attackPwr: Int) {
        self.init(startingHp: hp, attackPwr: attackPwr)
        self._name = name
    }

}