//
//  MainViewController.swift
//  UIAlertAdditionGuessNumber
//
//  Created by Andrei Shpartou on 12/03/2024.
//

import UIKit

class MainViewController: UIViewController {
    var delegate: MainViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        let mainView = MainView()
        view = mainView
        delegate = mainView
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        askForFullName()
    }

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
            var fullName: String = ""
            if let name = alert.textFields?.first?.text {
                fullName += "\(name)"
            }
            if let surName = alert.textFields?.last?.text {
                fullName += " \(surName)"
            }
            fullName = fullName.trimmingCharacters(in: .whitespaces)
            self.delegate?.updateFullName(with: fullName)
        }

        alert.addAction(defaultAction)
        present(alert, animated: true)
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
