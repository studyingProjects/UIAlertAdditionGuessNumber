//
//  MainViewController.swift
//  UIAlertAdditionGuessNumber
//
//  Created by Andrei Shpartou on 12/03/2024.
//

import UIKit

protocol MainViewDelegate: AnyObject {
    func additionPressed()
}

class MainViewController: UIViewController {
    private var person: Person?

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
