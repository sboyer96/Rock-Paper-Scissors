//
//  RPSLogic.swift
//  Rock, Paper, Scissors
//
//  Created by Savannah on 2/13/25.
//

var player1 = Int.random(in: 1...3)
var player2 = Int.random(in: 1...3)

while guess != magicNum {
  player1 = Int.random(in: 1...3)
  player2 = Int.random(in: 1...3)
  print("You played \(player1), and they played \(player2).")
}

print("It's a tie!")
