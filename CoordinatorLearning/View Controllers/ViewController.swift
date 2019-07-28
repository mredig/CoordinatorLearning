//
//  ViewController.swift
//  CoordinatorLearning
//
//  Created by Michael Redig on 7/27/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {
	weak var coordinator: MainCoordinator?

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}

	@IBAction func buyButtonPressed(_ sender: Any) {
		coordinator?.buySubscription()
	}
	
	@IBAction func createAccountButtonPressed(_ sender: Any) {
		coordinator?.createAccount()
	}
}

