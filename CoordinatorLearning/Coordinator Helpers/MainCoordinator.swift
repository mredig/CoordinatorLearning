//
//  MainCoordinator.swift
//  CoordinatorLearning
//
//  Created by Michael Redig on 7/27/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
	var childCoordinators = [Coordinator]()
	var navigationController: UINavigationController

	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}

	func start() {
		let vc = ViewController.instantiate()
		vc.coordinator = self
		navigationController.pushViewController(vc, animated: false)
	}

	func buySubscription() {
		let vc = BuyViewController.instantiate()
		vc.coordinator = self
		navigationController.pushViewController(vc, animated: true)
	}

	func createAccount() {
		let vc = CreateAccountViewController.instantiate()
		vc.coordinator = self
		navigationController.pushViewController(vc, animated: true)
	}
}
