//
//  ViewController.swift
//  Financial Checkup
//
//  Created by Yohan Wongso on 03/03/20.
//  Copyright © 2020 Yohan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var calculatorView: UIView!
    
    @IBOutlet weak var activeIncomeTextField: UITextField!
    @IBOutlet weak var passiveIncomeTextField: UITextField!
    @IBOutlet weak var debtPaymentTextField: UITextField!
    @IBOutlet weak var savingTextField: UITextField!
    
    @IBOutlet weak var spendingResult: UILabel!
    @IBOutlet weak var debtPaymentResult: UILabel!
    @IBOutlet weak var savingResult: UILabel!
    @IBOutlet weak var financialFreedomResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeSegmentedControlDidTab(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
//            print("Calculator")
            calculatorView.isHidden = false
            break
        case 1:
//            print("Result")
            calculatorView.isHidden = true
            break
        default:
            break
        }
    }
    
    @IBAction func clearButtonDidTab(_ sender: Any) {
        activeIncomeTextField.text = ""
        passiveIncomeTextField.text = ""
        debtPaymentTextField.text = ""
        savingTextField.text = ""
    }
    
    @IBAction func calculateButtonDidTab(_ sender: UIButton) {
//        Get value
        let activeIncome = unwrapStrToInt(activeIncomeTextField.text)
        let passiveIncome = unwrapStrToInt(passiveIncomeTextField.text)
        let debtPayment = unwrapStrToInt(debtPaymentTextField.text)
        let saving = unwrapStrToInt(savingTextField.text)
        let spending = (activeIncome + passiveIncome) - (debtPayment + saving)
        
//        Calculate percentage
        let spendingPercentage = 100 * spending / (activeIncome + passiveIncome)
        let debtPaymentPercentage = 100 * debtPayment / (activeIncome + passiveIncome)
        let savingPercentage = 100 * saving / (activeIncome + passiveIncome)
        let passiveIncomePercentage = 100 * passiveIncome / (spending + debtPayment)
        
//        Generate report
        var report = "Your monthly spending is \(spendingPercentage)% of your monthly active & passive income."
        spendingResult.text = report

        report = "Your monthly debt payment is \(debtPaymentPercentage)% of your monthly active & passive income.\n"
        if(debtPaymentPercentage > 30){
            report += "IT'S NOT GOOD! Your monthly debt payment ratio is too huge so you need to keep it at 30% or less."
        }
        else{
            report += "NICE! Your debt ratio is in the safe zone."
        }
        debtPaymentResult.text = report

        report = "Your monthly saving is \(savingPercentage)% of your monthly active & passive income.\n"
        if(savingPercentage < 20){
            report += "IT'S NOT GOOD! Your monthly saving ratio is too small so you need to keep it at 20% or more."
        }
        else{
            report += "GOOD JOB! You have a good saving ratio."
        }
        savingResult.text = report
        
        report = "Your monthly passive income is \(passiveIncomePercentage)% of your monthly spending & debt payment.\n"
        if(passiveIncomePercentage >= 100){
            report += "CONGRATULATIONS! You achieved your financial freedom! Don't get bored to grow it more!"
        }
        else if(passiveIncomePercentage >= 20){
            report += "GOOD JOB! You have a pasive income. Keep growing until you get your financial freedom!"
        }
        else{
            report += "IT'S NOT GOOD! You need to grow your passive income to achieve your financial freedom."
        }
        financialFreedomResult.text = report
        
//        Change to result page
        segmentedControl.selectedSegmentIndex = 1
        calculatorView.isHidden = true
    }
    
    func unwrapStrToInt(_ arg : String?) -> Int{
        guard let temp1 = arg else {
            return 0
        }
        guard let temp2 = Int(temp1) else{
            return 0
        }
        return temp2
    }
    
}

