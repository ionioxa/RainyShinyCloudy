//
//  WeatherVC.swift
//  RainyShinyCloudy
//
//  Created by Ion on 2017-07-24.
//  Copyright © 2017 Ion. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var currentTempLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var currentWeatherImage: UIImageView!
    
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

