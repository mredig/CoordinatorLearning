//
//  BuyCoordinator.swift
//  CoordinatorLearning
//
//  Created by Michael Redig on 7/28/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import UIKit

class BuyCoordinator: Coordinator {
	var childCoordinators: [Coordinator] = [Coordinator]()
	var navigationController: UINavigationController
	weak var parentCoordinator: MainCoordinator?

	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}

	func start() {
		let vc = BuyViewController.instantiate()
		vc.coordinator = self
		navigationController.pushViewController(vc, animated: true)
	}
}
