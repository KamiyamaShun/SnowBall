//
//  ViewController.swift
//  SnowBall
//
//  Created by 神山駿 on 2021/02/26.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var reserveAmount: UITextField!
    @IBOutlet weak var reserveYear: UITextField!
    @IBOutlet weak var reserveMonth: UITextField!
    @IBOutlet weak var yeild: UITextField!
    
    var amount = Int()
    var year = Int()
    var month = Int()
    var investmentYeild = Double()
    
    @IBOutlet weak var totalSum: UILabel!
    @IBOutlet weak var principal: UILabel!
    @IBOutlet weak var profit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reserveAmount.delegate = self
        reserveYear.delegate = self
        reserveMonth.delegate = self
        yeild.delegate = self
        
        reserveAmount.keyboardType = .decimalPad
        reserveYear.keyboardType = .decimalPad
        reserveMonth.keyboardType = .decimalPad
        yeild.keyboardType = .decimalPad
        
    }

    @IBAction func calc(_ sender: Any) {
        amount = Int(reserveAmount.text!)!
        year = Int(reserveYear.text!)!
        month = Int(reserveMonth.text!)!
        investmentYeild = Double(yeild.text!)!
        
        let totalMonth = year * 12 + month
        let monthlyInterest = investmentYeild / 12 / 100
        let exponentiation = pow(1 + monthlyInterest, Double(totalMonth))
        let total = Int(ceil((exponentiation - 1) / monthlyInterest * Double(amount)))
        let principalTotal = amount * totalMonth
        let profitTotal = total - principalTotal
       
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3
        
        totalSum.text = formatter.string(from: NSNumber(value: total))
        principal.text = formatter.string(from: NSNumber(value: principalTotal))
        profit.text = formatter.string(from: NSNumber(value: profitTotal))
        
        view.endEditing(true)
        
    }
    
    @IBAction func reset(_ sender: Any) {
        reserveAmount.text = ""
        reserveYear.text = ""
        reserveMonth.text = ""
        yeild.text = ""
        
        totalSum.text = "0"
        principal.text = "0"
        profit.text = "0"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
}

