//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billTxtField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var bill: Double?
    var percent = 0.0
    var result = 0.0
    var persons = 2.0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        if sender.currentTitle == "10%" {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            percent = 0.10
        } else if sender.currentTitle == "20%" {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            percent = 0.20
        } else {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            percent = 0.0
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.f", sender.value)
        persons = sender.value
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        guard let bill = Double(billTxtField.text ?? "0.0") else { return }
        let total = bill + (bill * percent)
        result = total / persons
        print("bill = \(bill) , persons = \(persons), percent = \(percent)")
        print(result)
        
        self.performSegue(withIdentifier: "toResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult" {
            let resultVC = segue.destination as! ResultsViewController
            resultVC.totalText = result
            resultVC.settingsText = "Split between \(String(format: "%.f", persons)) people, with \(percent)% tips."
        }
    }
}
