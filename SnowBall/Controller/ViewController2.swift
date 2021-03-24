//
//  ViewController2.swift
//  SnowBall
//
//  Created by 神山駿 on 2021/03/23.
//

import UIKit

class ViewController2: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var finalAmount: UITextField!
    @IBOutlet weak var reserveYear2: UITextField!
    @IBOutlet weak var reserveMonth2: UITextField!
    @IBOutlet weak var yeild2: UITextField!
    
    var Amount2 = Int()
    var year2 = Int()
    var month2 = Int()
    var investmentYeilds2 = Double()
    
    @IBOutlet weak var reserveEveryMonth: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finalAmount.delegate = self
        reserveYear2.delegate = self
        reserveMonth2.delegate = self
        yeild2.delegate = self
        
    }
    
    @IBAction func calc(_ sender: Any) {
        Amount2 = Int(finalAmount.text!)!
        year2 = Int(reserveYear2.text!)!
        month2 = Int(reserveMonth2.text!)!
        investmentYeilds2 = Double(yeild2.text!)!
        
        let totalMonth = year2 * 12 + month2
        let yeildMonth = pow((investmentYeilds2 / 12 / 100) + 1 , Double(totalMonth))
        let denominator = yeildMonth - 1.0
        let numerator = (investmentYeilds2 / 12 / 100) * Double(Amount2)
        let total = Int(ceil( numerator / denominator))
        
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3
        
        reserveEveryMonth.text = formatter.string(from: NSNumber(value: total))
        
        view.endEditing(true)
        
    }
    
    @IBAction func reset(_ sender: Any) {
        finalAmount.text = ""
        reserveYear2.text = ""
        reserveMonth2.text = ""
        yeild2.text = ""
        
        reserveEveryMonth.text = "0"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }


}
