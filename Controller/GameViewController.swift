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
    
    let checkFirstHorizontalRow = [0, 1, 2]
    let checkSecondHorizontalRow = [3, 4, 5]
    let checkThirdHorizontalRow = [6, 7, 8]
    
    let checkFirstVerticalRow = [0, 3, 6]
    let checkSecondVerticalRow = [1, 4, 7]
    let checkThirdVerticalRow = [2, 5, 8]
    
    let checkleftDiagonal = [0, 4, 8]
    let checkRightDiagonal = [2, 4, 6]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblPlayerOne.text = myGame.getPlayerName(id: 1)
        lblPlayerTwo.text = myGame.getPlayerName(id: 2)
        
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
        
        if checkFirstHorizontalRow.allSatisfy({ playingBoard[$0] == 1}) || checkFirstHorizontalRow.allSatisfy({ playingBoard[$0] == 2}){
                        getWinner(checkIndex: 0)
        }
        else if checkSecondHorizontalRow.allSatisfy({ playingBoard[$0] == 1}) || checkSecondHorizontalRow.allSatisfy({ playingBoard[$0] == 2}){
            getWinner(checkIndex: 3)
        }
        else if checkThirdHorizontalRow.allSatisfy({ playingBoard[$0] == 1}) || checkThirdHorizontalRow.allSatisfy({ playingBoard[$0] == 2}){
            getWinner(checkIndex: 6)
        }
        else if checkleftDiagonal.allSatisfy({ playingBoard[$0] == 1}) || checkleftDiagonal.allSatisfy({ playingBoard[$0] == 2}){
            getWinner(checkIndex: 0)
        }
        else if checkRightDiagonal.allSatisfy({ playingBoard[$0] == 1}) || checkRightDiagonal.allSatisfy({ playingBoard[$0] == 2}){
            getWinner(checkIndex: 2)
        }
        else if checkFirstVerticalRow.allSatisfy({playingBoard[$0] == 1}) || checkFirstVerticalRow.allSatisfy({playingBoard[$0] == 2}){
            getWinner(checkIndex: 0)
        }
        else if checkSecondVerticalRow.allSatisfy({playingBoard[$0] == 1}) || checkSecondVerticalRow.allSatisfy({playingBoard[$0] == 2}){
            getWinner(checkIndex: 1)
        }
        else if checkThirdVerticalRow.allSatisfy({playingBoard[$0] == 1}) || checkThirdVerticalRow.allSatisfy({playingBoard[$0] == 1}){
            getWinner(checkIndex: 2)
        }
//        else if playingBoard.allSatisfy({playingBoard[$0] == 1 || playingBoard[$0] == 2}){
//            print("All boxes are checked, TIE!")
//        }
    }
    
    func getWinner(checkIndex: Int){
        if playingBoard[checkIndex] == 1 {
            print("\(myGame.getPlayerName(id: 1)) WON!")
            showAlert(id: 1)
        } else if playingBoard[checkIndex] == 2{
            print("\(myGame.getPlayerName(id: 2)) WON!")
            showAlert(id: 2)
        }
    }
    
    
    func showAlert(id: Int){
        let alert = UIAlertController(title: "\(myGame.getPlayerName(id: id)) WON!",
                                      message: "Current score:",
                                      preferredStyle: .alert)
        
        // Add a button
        let okAction = UIAlertAction(title: "Play Again",
                                     style: .default, handler: (nil))
        alert.addAction(okAction)
        // present the alert on screen
        self.present(alert, animated: true, completion: nil)
    }
    
}
