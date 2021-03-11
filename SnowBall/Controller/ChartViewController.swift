//
//  ChartViewController.swift
//  SnowBall
//
//  Created by 神山駿 on 2021/03/10.
//

import UIKit
import Charts

class ChartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    

    
    @IBOutlet weak var chartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.chartView.centerText = "投資割合"
        
        let dataEntries = [
                    PieChartDataEntry(value: 40, label: "つみたてNISA"),
                    PieChartDataEntry(value: 35, label: "iDeCo"),
                    PieChartDataEntry(value: 25, label: "米国ETF")
                ]
        let dataSet = PieChartDataSet(entries: dataEntries)
        
        dataSet.colors = ChartColorTemplates.vordiplom()
        dataSet.valueTextColor = UIColor.black
        dataSet.entryLabelColor = UIColor.black
        self.chartView.data = PieChartData(dataSet: dataSet)
        
        let formatter = NumberFormatter()
                formatter.numberStyle = .percent
                formatter.maximumFractionDigits = 2
                formatter.multiplier = 1.0
                self.chartView.data?.setValueFormatter(DefaultValueFormatter(formatter: formatter))
                self.chartView.usePercentValuesEnabled = true
                
                view.addSubview(self.chartView)
        
        if UserDefaults.standard.object(forKey: "investContents") != nil{
            investContents = UserDefaults.standard.object(forKey: "investContents")
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return investContents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    


}
