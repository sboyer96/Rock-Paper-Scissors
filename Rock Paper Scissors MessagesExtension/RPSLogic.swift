//
//  RPSLogic.swift
//  Rock Paper Scissors game logic
//
//  Created by Savannah on 2/13/25.
//

let options = ["Rock", "Paper", "Scissors"]
var gameOver: Bool = false
// Update bestOf to a higher odd number for games with more rounds
var bestOf: Int = 3
let winningScore = bestOf/2 + 1

struct Player {
    var score: Int = 0
    var hand: String = ""
    
    mutating func playHand(_ hand: String? = options[Int.random(in: 0...2)]) {
        self.hand = hand!
    }
    
    mutating func addPoint() {
        self.score += 1
    }
    
    init(score: Int, hand: String) {
        self.score = score
        self.hand = hand
    }
}

var player1 = Player(score: 0, hand: "")
var player2 = Player(score: 0, hand: "")

@MainActor func duel(p1Hand: String, p2Hand: String) -> String {
    let playerChoices = (p1Hand, p2Hand)
    
    if p1Hand == p2Hand {
        return("Tie!")
    } else {
        switch playerChoices {
        // Winning cases
        case ("Rock", "Scissors"), ("Paper", "Rock"), ("Scissors", "Paper"):
            player1.addPoint()
            return "Player 1 wins this round!"
        // Losing cases
        case ("Rock", "Paper"), ("Paper", "Scissors"), ("Scissors", "Rock"):
            player2.addPoint()
            return "Player 2 wins this round!"
        default:
            return "Something went wrong."
        }
    }
}

// ---- Returns statement with both scores ----
//while gameOver == false {
//    if player1.score < winningScore && player2.score < winningScore {
//        player1.playHand()
//        player2.playHand()
//        print(duel(p1Hand: player1.hand, p2Hand: player2.hand))
//    } else {
//        print("Game over! Best of \(bestOf): \() with \(player1.score) points.")
//        gameOver = true
//
//    }
//}

// ---- Returns with the winner and win criteria ----
while gameOver == false {
    if player1.score < winningScore && player2.score < winningScore {
        player1.playHand()
        player2.playHand()
        print(duel(p1Hand: player1.hand, p2Hand: player2.hand))
    } else {
        if let winner = player1.score > player2.score ? "Player 1" : player1.score < player2.score ? "Player 2" : nil {
            print("Game over! \(winner) wins the best of \(bestOf).")
        }
        gameOver = true
    }
}
