//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Thitiphong Wancham on 21/2/2566 BE.
//  Copyright © 2566 BE The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    private(set) var tipPct: Double?
    var numPeople: Double?
    var bill: Double?
    var tipLabel: String?
    
    mutating func setTipPct(_ pct: String?) {
        tipLabel = pct
        switch pct {
        case "0%":
            tipPct = 0.0
        case "10%":
            tipPct = 0.1
        case "20%":
            tipPct = 0.2
        default:
            break
        }
    }
    
    func totalAmount() -> Double? {
        if let tipPct = tipPct,
            let bill = bill {
            return (1.0 + tipPct) * bill
        }
        return nil
    }
    
    func amountPerPerson() -> Double? {
        if let total = totalAmount(),
           let numPeople = numPeople {
            return round(total / numPeople * 100) / 100
        }
        return nil
    }
}
