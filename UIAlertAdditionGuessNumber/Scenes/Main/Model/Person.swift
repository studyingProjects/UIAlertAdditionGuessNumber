//
//  Person.swift
//  UIAlertAdditionGuessNumber
//
//  Created by Andrei Shpartou on 13/03/2024.
//

import Foundation

struct Person {
    var name: String
    var surname: String

    func getFullNameGreeting() -> String {
        return "Hey, \(name) \(surname)".trimmingCharacters(in: .whitespaces)
    }
}
