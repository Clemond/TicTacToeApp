//
//  ViewController.swift
//  TicTacToeApp
//
//  Created by Nicholas Nieminen Jönsson on 2024-09-05.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func onTapGesture(_ sender: UITapGestureRecognizer) {
        
        if let view = sender.view {
            print("You pressed square:\(view.tag)")
        }
        
        
        
    }
    
}

