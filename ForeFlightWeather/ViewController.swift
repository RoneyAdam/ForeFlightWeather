//
//  ViewController.swift
//  ForeFlightWeather
//
//  Created by Adam Roney on 12/3/21.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		DataFetcher().fetchData()
	}


}

