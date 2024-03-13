//
//  Guess.swift
//  UIAlertAdditionGuessNumber
//
//  Created by Andrei Shpartou on 13/03/2024.
//

import Foundation

struct Guess {
    let rangeOfNumber = 1...3

    func checkNumber(_ number: String) -> String {
        guard let unwrappedNumber = Int(number) else {
            return "Game over! You typed incorrect number /n Type integer number to guess"
        }

        var resultString = ""
        let guessedNumber = rangeOfNumber.randomElement() ?? 0
        if guessedNumber == unwrappedNumber {
            resultString = "Congrats! You have guessed!"
        } else {
            resultString = "You have mistaken! The correct number is \(guessedNumber)"
        }
        return resultString
    }
}
