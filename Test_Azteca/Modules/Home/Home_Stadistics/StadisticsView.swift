//
//  StadisticsView.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 31/10/22.
//

import UIKit
import Charts

class StadisticsView: UIViewController, Storyboarded {

    @IBOutlet weak var chartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChart()
    }
    
    func setupChart() {
        chartView.delegate = self
        chartView.chartDescription.enabled = false
        chartView.drawHoleEnabled = true
        chartView.rotationAngle = 0
        chartView.rotationEnabled = false
        chartView.isUserInteractionEnabled = false
        chartView.drawEntryLabelsEnabled = false
//        chartView.legend.enabled = false
        
        var entries : [PieChartDataEntry] = Array()
        entries.append(PieChartDataEntry(value: 50.0, label: "Take 1"))
        entries.append(PieChartDataEntry(value: 50.0, label: "Take 2"))
        entries.append(PieChartDataEntry(value: 50.0, label: "Take 3"))
        entries.append(PieChartDataEntry(value: 50.0, label: "Take 4"))
        entries.append(PieChartDataEntry(value: 50.0, label: "Take 5"))
        entries.append(PieChartDataEntry(value: 50.0, label: "Take 6"))
        
        let dataSet = PieChartDataSet(entries: entries, label: "")
        
        let c1 = NSUIColor(red: 77, green: 180, blue: 175)
              let c2 = NSUIColor(red: 255, green: 70, blue: 90)
              let c3 = NSUIColor(red: 255, green: 144, blue: 0)
              let c4 = NSUIColor(red: 125, green: 133, blue: 0)
        let c5 = NSUIColor(red: 248, green: 220, blue: 0)
              let c6 = NSUIColor(red: 10, green: 200, blue: 245)
          
              dataSet.colors = [c1, c2, c3, c4, c5, c6]
              dataSet.drawValuesEnabled = false
              
              chartView.data = PieChartData(dataSet: dataSet)
        
        
        
        
    }
    
}


extension StadisticsView: ChartViewDelegate {
    
}

extension NSUIColor {
    
    convenience init(red: Int, green: Int, blue: Int){
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
        
    }
    
    
      convenience init(hex: Int) {
          self.init(
              red: (hex >> 16) & 0xFF,
              green: (hex >> 8) & 0xFF,
              blue: hex & 0xFF
          )
      }
    
}

