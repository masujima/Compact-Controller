//
//  ViewController.swift
//  CompactController
//
//  Created by Yernar Masujima on 13.05.2023.
//

import UIKit

class ViewController: UIViewController {
	
	private lazy var actionButton: UIButton = {
		let button = UIButton()
		button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
		button.setTitle("Present", for: .normal)
		button.setTitleColor(.systemBlue, for: .normal)
		button.translatesAutoresizingMaskIntoConstraints = false
		
		return button
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .white
		
		setupActionButton()
	}
	
	private func setupActionButton() {
		view.addSubview(actionButton)
		NSLayoutConstraint.activate([
			actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			actionButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
			actionButton.heightAnchor.constraint(equalToConstant: 50),
			actionButton.widthAnchor.constraint(equalToConstant: 150)
		])
	}
	
	@objc
	private func actionButtonTapped() {
		let vc = SecondViewController()
		vc.modalPresentationStyle = .popover
		vc.preferredContentSize = CGSize(width: 300, height: 280)
		
		guard let popover = vc.popoverPresentationController else { return }
		popover.delegate = self
		popover.permittedArrowDirections = .up
		popover.sourceView = actionButton
		popover.sourceRect = actionButton.bounds
		
		present(vc, animated: true)
	}
}

extension ViewController: UIPopoverPresentationControllerDelegate {
	
	func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
		return .none
	}
}
