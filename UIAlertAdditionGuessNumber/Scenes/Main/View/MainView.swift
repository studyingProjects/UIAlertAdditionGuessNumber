//
//  MainView.swift
//  UIAlertAdditionGuessNumber
//
//  Created by Andrei Shpartou on 12/03/2024.
//

import UIKit

protocol MainViewControllerDelegate: AnyObject {
    func updateFullName(with fullNameGreeting: String)
}

class MainView: UIView {
    private lazy var fullNameLabel: UILabel = getfullNameLabel()
    private lazy var additionButton: UIButton = getAdditionButton()
    private lazy var guessButton: UIButton = getGuessButton()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - SetupView
    private func setupView() {
        self.backgroundColor = .systemCyan
        addSubview(fullNameLabel)
        addSubview(additionButton)
        addSubview(guessButton)
    }

    private func getfullNameLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: LabelSize.Medium.fontSize, weight: LabelSize.Medium.fontWeight)
        label.text = "Hey,"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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

    private func getGuessButton() -> UIButton {
        let button = UIButton(type: .custom)
        button.setTitle("Guess the number", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = CommonSize.cornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }
}
// MARK: - Constraints
private extension MainView {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor,
                constant: CommonSize.Padding.large
            ),
            fullNameLabel.leadingAnchor.constraint(
                equalTo: self.leadingAnchor,
                constant: CommonSize.Padding.large
            ),
            fullNameLabel.trailingAnchor.constraint(
                equalTo: self.trailingAnchor,
                constant: CommonSize.Padding.large
            ),

            additionButton.topAnchor.constraint(
                equalTo: fullNameLabel.bottomAnchor,
                constant: CommonSize.Padding.large
            ),
            additionButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            additionButton.widthAnchor.constraint(equalToConstant: ButtonSize.Large.width),
            additionButton.heightAnchor.constraint(equalToConstant: ButtonSize.Large.height),

            guessButton.topAnchor.constraint(
                equalTo: additionButton.bottomAnchor,
                constant: CommonSize.Padding.medium
            ),
            guessButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            guessButton.widthAnchor.constraint(equalToConstant: ButtonSize.Large.width),
            guessButton.heightAnchor.constraint(equalToConstant: ButtonSize.Large.height)
        ])
    }
}
// MARK: - Delegation
extension MainView: MainViewControllerDelegate {
    func updateFullName(with fullNameGreeting: String) {
        fullNameLabel.text = fullNameGreeting
    }
}
