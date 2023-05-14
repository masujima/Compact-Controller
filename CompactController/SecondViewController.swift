//
//  SecondViewController.swift
//  CompactController
//
//  Created by Yernar Masujima on 13.05.2023.
//

import UIKit

final class SecondViewController: UIViewController {
	
	private lazy var segmentedControl: UISegmentedControl = {
		let control = UISegmentedControl(items: ["280pt", "150pt"])
		control.addTarget(self, action: #selector(segmentedControlDidChange), for: .valueChanged)
		control.selectedSegmentIndex = 0
		control.translatesAutoresizingMaskIntoConstraints = false
		
		return control
	}()
	
	private lazy var closeButton: UIButton = {
		let button = UIButton()
		button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
		button.backgroundColor = .systemGray5
		button.layer.cornerRadius = 28 / 2
		button.setImage(UIImage(systemName: "xmark"), for: .normal)
		button.tintColor = .systemGray3
		button.translatesAutoresizingMaskIntoConstraints = false
		
		return button
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .white

		configureSegmentedControl()
		configureCloseButton()
	}
	
	private func configureSegmentedControl() {
		view.addSubview(segmentedControl)
		NSLayoutConstraint.activate([
			segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
		])
	}
	
	private func configureCloseButton() {
		view.addSubview(closeButton)
		NSLayoutConstraint.activate([
			closeButton.centerYAnchor.constraint(equalTo: segmentedControl.centerYAnchor),
			closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
			closeButton.widthAnchor.constraint(equalToConstant: 28),
			closeButton.heightAnchor.constraint(equalToConstant: 28)
		])
	}
	
	@objc
	private func segmentedControlDidChange() {
		switch segmentedControl.selectedSegmentIndex {
		case 0:
			preferredContentSize = CGSize(width: 300, height: 280)
		case 1:
			preferredContentSize = CGSize(width: 300, height: 150)
		default:
			break
		}
	}
	
	@objc
	private func closeButtonTapped() {
		dismiss(animated: true)
	}
}
