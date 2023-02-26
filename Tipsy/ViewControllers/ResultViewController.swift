//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Thitiphong Wancham on 21/2/2566 BE.
//  Copyright © 2566 BE The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var totalPerPerson: Double?
    var numPeople: Double?
    var tipLabel: String?

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let totalPerPerson = totalPerPerson,
           let numPeople = numPeople,
           let tipLabel = tipLabel {
            totalLabel.text = "\(totalPerPerson)"
            settingsLabel.text = "Split between \(Int(numPeople)) people, with \(tipLabel) tip."
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
