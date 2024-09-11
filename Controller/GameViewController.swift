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
    
    var playersTurn: Bool = true
    let myGame = Game()
    
    var playingBoard = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let checkFirstRow = [0, 1, 2]
    let checkSecondRow = [3, 4, 5]
    let checkThirdRow = [6, 7, 8]
    let checkleftDiagonal = [0, 4, 8]
    let checkRightDiagonal = [2, 4, 6]
    
        
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
                    if let currentPlayerName = myGame.findPlayerById(id: 1)?.name, 
                       let currentPlayerSymbol = myGame.findPlayerById(id: 1)?.symbol  {
                        
                        addLabelOnView(on: view, withText: currentPlayerSymbol)
                        
                        updatePlayingBoard(boxIndex: view.tag)
                        print("Updated board: \(playingBoard)")
                        
                        view.isUserInteractionEnabled = false
                        
                    }
                }else  {
                    if let currentPlayerName = myGame.findPlayerById(id: 2)?.name, 
                       let currentPlayerSymbol = myGame.findPlayerById(id: 2)?.symbol  {
                        
                        addLabelOnView(on: view, withText: currentPlayerSymbol)
                        
                        updatePlayingBoard(boxIndex: view.tag)
                        print("Updated board: \(playingBoard)")
                        
                        view.isUserInteractionEnabled = false
                        
                    }
                }
                playersTurn.toggle()
                checkPlayerTurn()
                checkWinner()
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
    
    
    func updatePlayingBoard(boxIndex: Int){
     
        if playersTurn == true {
            playingBoard[boxIndex - 1] = 1
        } else {
            playingBoard[boxIndex - 1] = 2
        }
    }
    
    func checkWinner(){
        
        if checkFirstRow.allSatisfy({ playingBoard[$0] == 1 || playingBoard[$0] == 2}){
           getWinner(checkIndex: 0)
        }
        else if checkSecondRow.allSatisfy({ playingBoard[$0] == 1 || playingBoard[$0] == 2}){
            getWinner(checkIndex: 3)
        }
        else if checkThirdRow.allSatisfy({ playingBoard[$0] == 1 || playingBoard[$0] == 2}){
            getWinner(checkIndex: 6)
        }
        else if checkleftDiagonal.allSatisfy({ playingBoard[$0] == 1 || playingBoard[$0] == 2}){
            getWinner(checkIndex: 0)
        }
        else if checkRightDiagonal.allSatisfy({ playingBoard[$0] == 1 || playingBoard[$0] == 2}){
            getWinner(checkIndex: 2)
        }
    }
    
    func getWinner(checkIndex: Int){
        if playingBoard[checkIndex] == 1 {
            print("\(myGame.findPlayerById(id: 1)!.name) WON!")
            showAlert(id: 1)
        }
        if playingBoard[checkIndex] == 2{
            print("\(myGame.findPlayerById(id: 2)!.name) WON!")
            showAlert(id: 2)
        }
    }
    
    
    func showAlert(id: Int){
        let alert = UIAlertController(title: "\(myGame.findPlayerById(id: id)!.name) WON!",
                                      message: "Current score:",
                                      preferredStyle: .alert)
        
        // Add a button
        let okAction = UIAlertAction(title: "Play Again", 
                                     style: .default, handler: nil)
        alert.addAction(okAction)
        // present the alert on screen
        self.present(alert, animated: true, completion: nil)
    }
    
    
    }
