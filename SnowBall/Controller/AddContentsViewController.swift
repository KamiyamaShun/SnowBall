//
//  AddContentsViewController.swift
//  SnowBall
//
//  Created by 神山駿 on 2021/03/11.
//

import UIKit

class AddContentsViewController: UIViewController {

    @IBOutlet weak var investContent: UITextField!
    @IBOutlet weak var investAmount: UITextField!
    var investContents = [String: Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func append(_ sender: Any) {
        investContents[String(investContent.text!)] = Int(investAmount.text!)
        UserDefaults.standard.set(investContents, forKey: "investContents")
        
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
