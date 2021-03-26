//
//  ViewController4.swift
//  SnowBall
//
//  Created by 神山駿 on 2021/03/26.
//

import UIKit

class ViewController4: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var finalAmount: UITextField!
    @IBOutlet weak var monthAmount: UITextField!
    @IBOutlet weak var year: UITextField!
    @IBOutlet weak var month: UITextField!
    
    @IBOutlet weak var requireYeild: UILabel!
    
    var amount = Int()
    var monthlyAmount = Int()
    var year2 = Int()
    var month2 = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finalAmount.delegate = self
        monthAmount.delegate = self
        year.delegate = self
        month.delegate = self
        
    }
    
    @IBAction func calc(_ sender: Any) {
        amount = Int(finalAmount.text!)!
        monthlyAmount = Int(monthAmount.text!)!
        year2 = Int(year.text!)!
        month2 = Int(month.text!)!
        
        let totalMonth = year2 * 12 + month2
        let denominator = log(Double(totalMonth) - 1.0)
        let numerator = log(Double(amount) / Double(monthlyAmount) - 2.0 * Double(totalMonth))
        let total = numerator / denominator
        
        print(totalMonth)
        print(denominator)
        print(numerator)
        print(total)
    }
    
    @IBAction func reset(_ sender: Any) {
        finalAmount.text = ""
        monthAmount.text = ""
        year.text = ""
        month.text = ""
        
        requireYeild.text = "0%"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }


}
