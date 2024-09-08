//
//  GameViewController.swift
//  TicTacToeApp
//
//  Created by Nicholas Nieminen Jönsson on 2024-09-08.
//

import UIKit

class GameViewController: UIViewController {
    
    
    @IBOutlet weak var lblPlayerOne: UILabel!
    @IBOutlet weak var lblPlayerTwo: UILabel!
    
    let myGame = Game()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            lblPlayerOne.text = myGame.findPlayerById(id: 1)?.name
            lblPlayerTwo.text = myGame.findPlayerById(id: 2)?.name
            
            
            // Do any additional setup after loading the view.
        }

        
        
        @IBAction func onTapGesture(_ sender: UITapGestureRecognizer) {
            
            if let view = sender.view {
                print("You pressed square:\(view.tag)")
                print(myGame.getCurrentPlayers())
            }
            
        }
        
    }
