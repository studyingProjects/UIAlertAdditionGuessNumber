//
//  MainView.swift
//  UIAlertAdditionGuessNumber
//
//  Created by Andrei Shpartou on 12/03/2024.
//

import UIKit

class MainView: UIView {
    private lazy var additionButton: UIButton = getAdditionButton()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func getAdditionButton() -> UIButton {
        let button = UIButton(type: .custom)
        button.setTitle("Addition", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = CommonSize.cornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }

    private func setupView() {
        self.backgroundColor = .systemCyan
        addSubview(additionButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            additionButton.topAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor,
                constant: CommonSize.Padding.medium
            ),
            additionButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            additionButton.widthAnchor.constraint(equalToConstant: ButtonSize.Large.width),
            additionButton.heightAnchor.constraint(equalToConstant: ButtonSize.Large.height)
        ])
    }
}
