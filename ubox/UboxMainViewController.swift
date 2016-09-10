//
//  UboxMainViewController.swift
//  ubox
//
//  Created by Ivan on 10.09.16.
//  Copyright © 2016 Ivan. All rights reserved.
//

import UIKit
import Charts

class UboxMainViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var HitsChart: BarChartView!
    
    @IBOutlet weak var TimerLabel: UILabel!
    
    @IBOutlet weak var HitsLabel: UILabel!
    
    //MARK: - Private Methods
    private func setChart(values: [Double]) {
        HitsChart.noDataText = "You need to provide data for the chart."
        

        var dataEntries = [BarChartDataEntry]()
        
        for i in 0 ..< values.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Hits Thrown")
        chartDataSet.valueTextColor = UIColor.yellowColor()
        chartDataSet.valueFont = UIFont(name: "helvetica", size: 16)!
        
        let chartData = BarChartData(dataSet: chartDataSet)
        HitsChart.leftAxis.axisMinimum = 0.0
        HitsChart.leftAxis.axisMaximum = 13.0
//        HitsChart.leftAxis.labelTextColor = UIColor.yellowColor()
        HitsChart.leftAxis.drawLabelsEnabled = false
        HitsChart.leftAxis.drawGridLinesEnabled = false
//        HitsChart.leftAxis.drawZeroLineEnabled = false
        HitsChart.leftAxis.drawAxisLineEnabled = false
        

//        HitsChart.leftAxis.enabled = false
        
        HitsChart.rightAxis.enabled = false
        
        HitsChart.xAxis.enabled = false
        
        HitsChart.descriptionText = ""
        
        
        
        HitsChart.legend.direction = .LeftToRight
        HitsChart.legend.horizontalAlignment = .Center
        HitsChart.legend.textColor = UIColor.yellowColor()
        HitsChart.legend.font = UIFont(name: "helvetica", size: 16)!
        
        HitsChart.data = chartData
        
    }
    
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        TimerLabel.text = "Boxing time: 01:05:34"
        HitsLabel.text = "Last series: 12 hits"
        
        let hitsThrown = [0.0, 2.0, 4.0, 6.0, 3.0, 12.0, 0.0]
        
        setChart(hitsThrown)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
