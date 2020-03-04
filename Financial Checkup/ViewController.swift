//
//  ViewController.swift
//  Financial Checkup
//
//  Created by Yohan Wongso on 03/03/20.
//  Copyright © 2020 Yohan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var activeIncomeTextField: UITextField!
    @IBOutlet weak var passiveIncomeTextField: UITextField!
    @IBOutlet weak var debtPaymentTextField: UITextField!
    @IBOutlet weak var savingTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func clearButtonDidTab(_ sender: Any) {
        activeIncomeTextField.text = ""
        passiveIncomeTextField.text = ""
        debtPaymentTextField.text = ""
        savingTextField.text = ""
    }
    
    @IBAction func calculateButtonDidTab(_ sender: UIButton) {
        guard let activeIncomeTmp = activeIncomeTextField.text else{
            return
        }
        let activeIncome = Int(activeIncomeTmp)
        
        guard let passiveIncomeTmp = passiveIncomeTextField.text else{
            return
        }
        let passiveIncome = Int(passiveIncomeTmp)
        
        guard let debtPaymentTmp = debtPaymentTextField.text else{
            return
        }
        let debtPayment = Int(debtPaymentTmp)
        
        guard let savingTmp = savingTextField.text else{
            return
        }
        let saving = Int(savingTmp)
        
        print(activeIncome)
        print(passiveIncome)
        print(debtPayment)
        print(saving)
        
        let a = Int(unwrap(activeIncomeTextField.text))
        let b = Int(unwrap(passiveIncomeTextField.text))
        let no = a + b
        print(no)
    }
    
    func unwrap(_ arg : String?) -> String{
        guard let temp = arg else {
            return ""
        }
        return temp
    }
    
}

