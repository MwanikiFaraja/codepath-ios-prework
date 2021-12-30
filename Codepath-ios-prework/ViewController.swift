//
//  ViewController.swift
//  Codepath-ios-prework
//
//  Created by Walter Mwaniki on 12/27/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitStepper: UIStepper!
    @IBOutlet weak var splittingStatement: UILabel!
    @IBOutlet weak var valueEachStatement: UILabel!
    
    var total: Double = 0
    var bill: Double = 0
    var tip: Double = 0
    var numOfPeople: Int = 1
    var valueEach: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tipSlider.value = 0.15
        updateTipNSplit()
    }

    func updateTipNSplit() {
        
        // Update tip amount and total amount
        tipPercentLabel.text = String(format: "$%.2f", tipSlider.value * 100) + "%"
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        // Update the number-of-people splitting text and amount each
        if (numOfPeople == 1) {
            splittingStatement.text = "Not splitting it today."
            valueEachStatement.text = "That'll be all. Thanks!"
        } else {
            splittingStatement.text = "Splitting among \(Int(numOfPeople)) people."
            valueEachStatement.text = "That'll be " + String(format: "$%.2f", valueEach) + " each."
        }
    }
    
    func calculateTipAndSplit () {
        //Tipping
        
        //Get bill amount from text field input. zero if absent
        bill = Double(billAmountTextField.text!) ?? 0
        tip = bill * Double(tipSlider.value)
        total = bill + tip
        
        // Splitting
        numOfPeople = Int(splitStepper.value)
        valueEach = total / Double(numOfPeople)
    }
    
    
    // When tip slidder is moved or split stepper is changed
    @IBAction func updateValues(_ sender: Any) {
        calculateTipAndSplit ()
        updateTipNSplit()
    }
    
}
