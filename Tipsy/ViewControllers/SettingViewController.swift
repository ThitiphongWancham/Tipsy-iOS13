//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var billTextView: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        calculatorBrain.setTipPct(sender.titleLabel?.text)
        billTextView.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let num = sender.value
        splitNumberLabel.text = "\(Int(num))"
        calculatorBrain.numPeople = num
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        guard let bill = billTextView.text, bill != "" else { return }
        calculatorBrain.bill = Double(bill)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goToResult" else { return }
        let resultVC = segue.destination as! ResultViewController
        resultVC.numPeople = calculatorBrain.numPeople
        resultVC.totalPerPerson = calculatorBrain.amountPerPerson()
        resultVC.tipLabel = calculatorBrain.tipLabel
    }
}

