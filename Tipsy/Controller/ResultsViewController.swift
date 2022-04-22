//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Maxim Mitin on 23.04.22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalText: Double?
    var settingsText: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(format: "%.2f", totalText ?? 0.0)
        settingsLabel.text = settingsText

    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
