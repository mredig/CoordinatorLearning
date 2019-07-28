//
//  BuyViewController.swift
//  CoordinatorLearning
//
//  Created by Michael Redig on 7/27/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import UIKit

class BuyViewController: UIViewController, Storyboarded {
	weak var coordinator: BuyCoordinator?

	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		coordinator?.didFinishBuying()
	}
}
