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
//        guard let activeIncomeTmp = activeIncomeTextField.text else{
//            return
//        }
//        guard let activeIncome = Int(activeIncomeTmp) else{
//            return
//        }
        
//        guard let passiveIncomeTmp = passiveIncomeTextField.text else{
//            return
//        }
//        guard let passiveIncome = Int(passiveIncomeTmp) else{
//            return
//        }
        
//        guard let debtPaymentTmp = debtPaymentTextField.text else{
//            return
//        }
//        guard let debtPayment = Int(debtPaymentTmp) else{
//            return
//        }
        
//        guard let savingTmp = savingTextField.text else{
//            return
//        }
//        guard let saving = Int(savingTmp) else{
//            return
//        }
                
        let activeIncome = unwrapStrToInt(activeIncomeTextField.text)
        let passiveIncome = unwrapStrToInt(passiveIncomeTextField.text)
        let debtPayment = unwrapStrToInt(debtPaymentTextField.text)
        let saving = unwrapStrToInt(savingTextField.text)
        let spending = (activeIncome + passiveIncome) - (debtPayment + saving)
        
//        print(spending)
//        print(activeIncome)
//        print(passiveIncome)
//        print(debtPayment)
//        print(saving)
//        print("\n")
        
        let spendingPercentage = 100 * spending / (activeIncome + passiveIncome)
        let debtPaymentPercentage = 100 * debtPayment / (activeIncome + passiveIncome)
        let savingPercentage = 100 * saving / (activeIncome + passiveIncome)
        let passiveIncomePercentage = 100 * passiveIncome / (spending + debtPayment)
        
//        print(spendingPercentage)
//        print(debtPaymentPercentage)
//        print(savingPercentage)
//        print(passiveIncomePercentage)
//        print(spendingPercentage + debtPaymentPercentage + savingPercentage)
        
        
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

