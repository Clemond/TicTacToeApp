//
//  ViewController.swift
//  TicTacToeApp
//
//  Created by Nicholas Nieminen Jönsson on 2024-09-05.
//

import UIKit

class ViewController: UIViewController {
    
    let myGame = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myGame.addPlayer(userName: "Nicholas")
        myGame.addPlayer(userName: "Simone")
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttonAddPlayer(_ sender: UIButton) {
        
        print(myGame.getPlayerScore(id: 1))
        
    }
    
    
    @IBAction func onTapGesture(_ sender: UITapGestureRecognizer) {
        
        if let view = sender.view {
            print("You pressed square:\(view.tag)")
            print(myGame.getCurrentPlayers())
        }
        
    }
    
}

