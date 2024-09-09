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
    
    var isBoxTicked: Bool = false
    var playersTurn: Bool = true
    let myGame = Game()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            lblPlayerOne.text = myGame.findPlayerById(id: 1)?.name
            lblPlayerTwo.text = myGame.findPlayerById(id: 2)?.name
            
            checkPlayerTurn()
            // Do any additional setup after loading the view.
        }

        
    @IBAction func onTapGesture(_ sender: UITapGestureRecognizer) {
        
        // Check that there is a view
        if let view = sender.view {
            //Check if the current box is already used
            if view.isUserInteractionEnabled == true {
                
                if playersTurn  == true {
                    if let currentPlayerName = myGame.findPlayerById(id: 1)?.name, let currentPlayerSymbol = myGame.findPlayerById(id: 1)?.symbol  {
                        print("\(currentPlayerName) places a \(currentPlayerSymbol) in box \(view.tag)")
                        addLabelOnView(on: view, withText: currentPlayerSymbol)
                        view.isUserInteractionEnabled = false
                        
                    }
                }else  {
                    if let currentPlayerName = myGame.findPlayerById(id: 2)?.name, let currentPlayerSymbol = myGame.findPlayerById(id: 2)?.symbol  {
                        print("\(currentPlayerName) places a \(currentPlayerSymbol) in box \(view.tag)")
                        addLabelOnView(on: view, withText: currentPlayerSymbol)
                        view.isUserInteractionEnabled = false
                        
                                  
                    }
                }
                playersTurn.toggle()
                checkPlayerTurn()
            }
        }
        
    }
        
        func checkPlayerTurn() {
            if playersTurn {
                lblPlayerOne.textColor = UIColor.blue
                lblPlayerTwo.textColor = UIColor.black
            }
            else {
                lblPlayerOne.textColor = UIColor.black
                lblPlayerTwo.textColor = UIColor.blue
            }
            
        }
    
    func addLabelOnView(on imageView: UIView, withText text: String) {
               let label = UILabel()
               
               label.text = text
               label.textAlignment = .center
               label.font = UIFont.systemFont(ofSize: 60)
               
               // Set label to match imageView bounds
               label.frame = imageView.bounds
               
               // Add label to imageView
               imageView.addSubview(label)
               
               // Update the layout after adding the label
               imageView.layoutIfNeeded()
           }
    
    
    
    
    
    
    
    
    }

