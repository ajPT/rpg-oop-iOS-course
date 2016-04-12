//
//  DevilWizard.swift
//  rpg-oop
//
//  Created by Amadeu Andrade on 12/04/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {

    override var type: String {
        return "Devil Wizard"
    }
    
    override var loot: [String] {
        return ["Magic Wand", "Dark Amulet", "Salted Pork"]
    }
    
}