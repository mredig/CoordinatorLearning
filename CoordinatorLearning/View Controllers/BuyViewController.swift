//
//  BuyViewController.swift
//  CoordinatorLearning
//
//  Created by Michael Redig on 7/27/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import UIKit

class BuyViewController: UIViewController, Storyboarded {
	weak var coordinator: MainCoordinator?
	var selectedProduct = 0
	@IBOutlet var buyLabel: UILabel!

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		buyLabel.text = "Buy item \(selectedProduct + 1)"
	}
}
