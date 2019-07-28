//
//  MainCoordinator.swift
//  CoordinatorLearning
//
//  Created by Michael Redig on 7/27/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import UIKit

class MainCoordinator: NSObject, Coordinator {
	var childCoordinators = [Coordinator]()
	var navigationController: UINavigationController

	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}

	func start() {
		let vc = ViewController.instantiate()
		vc.coordinator = self
		navigationController.delegate = self
		navigationController.pushViewController(vc, animated: false)
	}

	func buySubscription() {
		let child = BuyCoordinator(navigationController: navigationController)
		childCoordinators.append(child)
		child.parentCoordinator = self
		child.start()
	}

	func createAccount() {
		let vc = CreateAccountViewController.instantiate()
		vc.coordinator = self
		navigationController.pushViewController(vc, animated: true)
	}

	func childDidFinish(_ child: Coordinator?) {
		for (index, coordinator) in childCoordinators.enumerated() {
			if coordinator === child {
				childCoordinators.remove(at: index)
				break
			}
		}
	}
}

extension MainCoordinator: UINavigationControllerDelegate {
	func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
		// read vc we're moving from
		guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }

		// check if our vc array already contains the fromViewController
		if navigationController.viewControllers.contains(fromViewController) {
			return
		}

		// we're still here - it means we're popping the view controller. check if it's a buyVC
		if let buyViewController = fromViewController as? BuyViewController {
			// we're popping a buy vc, end its coordinator
			childDidFinish(buyViewController.coordinator)
		}
	}
}
