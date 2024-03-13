//
//  MainViewController.swift
//  UIAlertAdditionGuessNumber
//
//  Created by Andrei Shpartou on 12/03/2024.
//

import UIKit

protocol MainViewDelegate: AnyObject {
    func additionPressed()
    func guessPressed()
}

class MainViewController: UIViewController {
    private var person: Person?
    private var addition: Addition?
    private var guess: Guess?

    var delegate: MainViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        let mainView = MainView()
        mainView.delegate = self
        view = mainView
        delegate = mainView
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        askForFullName()
    }
}
// MARK: - Alerts
extension MainViewController {
    private func askForFullName() {
        let alert = UIAlertController(
            title: "What is your name?",
            message: "Fill in your name please",
            preferredStyle: .alert
        )

        alert.addTextField { textField in
            textField.placeholder = "Name"
        }
        alert.addTextField { textField in
            textField.placeholder = "Surname"
        }

        let defaultAction = UIAlertAction(title: "OK", style: .default) { _ in
            var name: String = ""
            var surname: String = ""
            if let unwrappedName = alert.textFields?.first?.text {
                name = unwrappedName.trimmingCharacters(in: .whitespaces)
            }
            if let unwrappedSurname = alert.textFields?.last?.text {
                surname = unwrappedSurname.trimmingCharacters(in: .whitespaces)
            }
            self.person = Person(name: name, surname: surname)
            let fullNameGreeting: String = self.person?.getFullNameGreeting() ?? ""
            self.delegate?.updateFullName(with: fullNameGreeting)
        }

        alert.addAction(defaultAction)
        present(alert, animated: true)
    }
}
// MARK: - Delegation
extension MainViewController: MainViewDelegate {
    func additionPressed() {
        let alert = UIAlertController(
            title: "Addition of two numbers",
            message: "Fill in two number an tap OK to compute",
            preferredStyle: .alert
        )
        alert.addTextField {
            $0.placeholder = "Type the first number"
        }
        alert.addTextField {
            $0.placeholder = "Type the second number"
        }
        let action = UIAlertAction(title: "Calculate", style: .default) { _ in
            var firstNumber: Float = 0
            var secondNumber: Float = 0
            if let unwrappedText = alert.textFields?.first?.text,
               let unwrappedfirstNumber = Float(unwrappedText) {
                firstNumber = unwrappedfirstNumber
            }
            if let unwrappedText = alert.textFields?.last?.text,
                let unwrappedSecondNumber = Float(unwrappedText) {
                secondNumber = unwrappedSecondNumber
            }

            self.addition = Addition(firstNumber: firstNumber, secondNumber: secondNumber)
            let result = self.addition?.calculate() ?? 0
            self.delegate?.showTheResultOfAddition(result: result)
        }

        alert.addAction(action)
        present(alert, animated: true)
    }

    func guessPressed() {
        let alert = UIAlertController(title: "Guess number", message: "Type your number and check the result", preferredStyle: .alert)
        alert.addTextField {
            $0.placeholder = "Type the number"
        }
        let action = UIAlertAction(title: "Check", style: .default) { _ in
            var numberString: String = ""
            if let unwrappedNumber = alert.textFields?.first?.text {
                numberString = unwrappedNumber
            }
            self.guess = Guess()
            let result = self.guess?.checkNumber(numberString) ?? ""
            self.delegate?.showTheGuessResult(result)
        }
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}
import SwiftUI
struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        Group {
            // change to your vc
            MainViewController().preview()
        }
    }
}
