//
//  Storyboarded.swift
//  CoordinatorLearning
//
//  Created by Michael Redig on 7/27/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import UIKit

protocol Storyboarded {
	static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
	static func instantiate() -> Self {
		// this pulls out "MyApp.MyViewController"
		let fullName = NSStringFromClass(self)

		// separate to "MyViewController"
		let className = fullName.components(separatedBy: ".")[1]

		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)

		// Force cast. If this doesn't work, something bad has happened and we WANT to crash.
		return storyboard.instantiateViewController(withIdentifier: className) as! Self
	}
}
