//
//  Game.swift
//  TicTacToeApp
//
//  Created by Nicholas Nieminen Jönsson on 2024-09-05.
//

import Foundation

class Game {
    
    private var currentPlayers: [Player] = []
    
    func addPlayer(userName: String){
        
        //Ifall det redan är två spelare går det ej att lägga till en tredje,
        if currentPlayers.count < 2 {
            
            if currentPlayers.count == 0 {
                let newPlayer = Player(name: userName, symbol: "X",score: 0, id: 1 )
                currentPlayers.append(newPlayer)
            } else if currentPlayers.count == 1 {
                let newPlayer = Player(name: userName, symbol: "O", score: 0, id: 2 )
                currentPlayers.append(newPlayer)
            }
            
        }else {
            print("No more player slots avalible")
            }
        }
    
    
    // Hämta alla spelare
    func getCurrentPlayers() -> [Player]{
            return currentPlayers
    }
    
    // Hämta spelare baserat på ID
    func findPlayerById(id: Int) -> Player? {
        let maybeFoundPlayer = currentPlayers.first { $0.id == id}
        return maybeFoundPlayer
        
    }
    
    // uppdatera användar poängen
    func updatePlayerScore(id: Int) {
    
        // skapa en kopia av den användaren vars poäng ska gå upp och uppdatera poängen.
        var currentPlayerWithIndex = currentPlayers[id]
        currentPlayerWithIndex.score += 1
        // gör sedan så att kopians data blir den rätta användarens data i arrayen.

        currentPlayers[id] = currentPlayerWithIndex
    }
    
    // Radera en currentPlayers
    func deleteAllCurrentPlayers() {
        currentPlayers.removeAll()
    }
    
    func getPlayerScore(id: Int) -> Int{
        return currentPlayers[id].score
    }
    
    
        
    
    
    
        
    }
    

