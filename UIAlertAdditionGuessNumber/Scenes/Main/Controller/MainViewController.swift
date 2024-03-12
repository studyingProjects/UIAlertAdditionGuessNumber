//
//  MainViewController.swift
//  UIAlertAdditionGuessNumber
//
//  Created by Andrei Shpartou on 12/03/2024.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view = MainView()
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
