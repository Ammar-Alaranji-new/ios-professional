//
//  OnboardingViewController.swift
//  Bankey
//
//  Created by Ammar Al Aranji on 12/14/22.
//

import UIKit

class OnboardingViewController: UIViewController {

    // MARK: - Views
    let stackView = UIStackView()
    let imageView = UIImageView()
    let label = UILabel()

    // MARK: Properties
    let viewModel: OnboardingViewModel

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }

    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OnboardingViewController {

    private func style() {
        view.backgroundColor = .systemBackground

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = viewModel.image

        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.text = viewModel.title
    }

    private func layout() {
        view.addSubview(stackView)

        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
    }
}
