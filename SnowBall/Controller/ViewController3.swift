//
//  ViewController3.swift
//  SnowBall
//
//  Created by 神山駿 on 2021/03/26.
//

import UIKit

class ViewController3: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var finalAmount: UITextField!
    @IBOutlet weak var reserveAmount: UITextField!
    @IBOutlet weak var yeild: UITextField!
    
    @IBOutlet weak var requireTerm: UILabel!
    
    var Amount = Int()
    var reserveAmountMonth = Int()
    var yeild2 = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finalAmount.delegate = self
        reserveAmount.delegate = self
        yeild.delegate = self

    }
    
    @IBAction func calc(_ sender: Any) {
        Amount = Int(finalAmount.text!)!
        reserveAmountMonth = Int(reserveAmount.text!)!
        yeild2 = Int(yeild.text!)!
        
        let monthYeild = Double(yeild2) / 100.0 / 12.0
        let denominator = log(1.0 + monthYeild)
        let numerator = log(Double(monthYeild) * Double(Amount) / Double(reserveAmountMonth) + 1.0)
        let total = Int(ceil( numerator / denominator))
        
        let year = total / 12
        let month = total % 12
        
        requireTerm.text = "\(year)年\(month)ヶ月"
        view.endEditing(true)
        
    }
    
    @IBAction func reset(_ sender: Any) {
        finalAmount.text = ""
        reserveAmount.text = ""
        yeild.text = ""
        
        requireTerm.text = "0年0ヶ月"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }




}
