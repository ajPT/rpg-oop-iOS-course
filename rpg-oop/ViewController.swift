//
//  ViewController.swift
//  rpg-oop
//
//  Created by Amadeu Andrade on 10/04/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var player: Player!
    var enemy: Enemy!
    var lootReceived: String?

    @IBOutlet weak var printLbl: UILabel!
    
    @IBOutlet weak var enemyImg: UIImageView!
    
    @IBOutlet weak var enemyHpLbl: UILabel!

    @IBOutlet weak var playerHpLbl: UILabel!
    
    @IBOutlet weak var chestImg: UIButton!
    
    @IBOutlet weak var attackBtnImg: UIButton!
    
    @IBAction func onChestPressed(sender: AnyObject) {
        printLbl.text = "\(player.name) found \(lootReceived!)!"
        chestImg.hidden = true
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.restartGame), userInfo: nil, repeats: false)
    }
    
    func restartGame() {
        generateEnemy()
        printLbl.text = "A new \(enemy.type) appeared!"
        attackBtnImg.hidden = false
    }
    
    @IBAction func onAttackPressed(sender: AnyObject) {
        if enemy.attemptAttack(player.attackPwr) {
            printLbl.text = "You attacked \(enemy.type) for \(player.attackPwr) HP!"
            enemyHpLbl.text = "\(enemy.hp) HP"
        } else {
            printLbl.text = "The attack was unsuccessful"
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            enemyImg.hidden = true
            enemyHpLbl.hidden = true
            printLbl.text = "You defeated \(enemy.type)"
            lootReceived = loot
            chestImg.hidden = false
            attackBtnImg.hidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chestImg.hidden = true
        player = Player(name: "soldier123", hp: 150, attackPwr: 17)
        playerHpLbl.text = "\(player.hp) HP"
        generateEnemy()
        enemyHpLbl.text = "\(enemy.hp) HP"
        printLbl.text = "The game will begin!"
    }
    
    func generateEnemy() {
        let rand = Int(arc4random_uniform(UInt32(2)))
        
        if rand == 0 {
            enemy = Kimara(startingHp: 120, attackPwr: 12)
        } else {
            enemy = DevilWizard(startingHp: 75, attackPwr: 10)
        }
        
        enemyImg.hidden = false
        enemyHpLbl.hidden = false
        enemyHpLbl.text = "\(enemy.hp) HP"
    }

}

