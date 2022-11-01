//
//  GraphTVC.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 01/11/22.
//

import UIKit
import Charts

class GraphTVC: UITableViewCell {
    
    static let id : String = "GraphTVC"
    
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var chartView: PieChartView!
    
    var colorsChartView : [NSUIColor] = [
        NSUIColor(red: 77, green: 180, blue: 175),
        NSUIColor(red: 255, green: 70, blue: 90),
        NSUIColor(red: 255, green: 144, blue: 0),
        NSUIColor(red: 125, green: 133, blue: 0),
        NSUIColor(red: 248, green: 220, blue: 0),
        NSUIColor(red: 10, green: 200, blue: 245),
    ]
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setup(with data: GraphicModel){
        
        questionLbl.text = data.pregunta

        setupChartView()
        let dataSet = setupEntriesValues(with: data)
        chartView.data = PieChartData(dataSet: dataSet)
        
    }
    
    func setupChartView() {
        chartView.delegate = self
        chartView.chartDescription.enabled = false
        chartView.drawHoleEnabled = true
        chartView.rotationAngle = 0
        chartView.rotationEnabled = false
        chartView.isUserInteractionEnabled = false
        chartView.drawEntryLabelsEnabled = false
    }
    
    func setupEntriesValues(with data: GraphicModel) -> PieChartDataSet {
        var entries : [PieChartDataEntry] = Array()
        var colors : [NSUIColor] = []
        
        var indexcolors = 0;
        
    
        for i in 0..<data.values.count {
            let obj = data.values[i]
            
            entries.append(PieChartDataEntry(value: Double(obj.value), label: "\(obj.label) \(obj.value)%"))
            colors.append(colorsChartView[indexcolors])
            
            if indexcolors == colorsChartView.count - 1 {
                indexcolors = 0
            }
            else {
                indexcolors += 1
            }
        }
        
        let dataSet = PieChartDataSet(entries: entries, label: "")
        dataSet.colors = colors
        dataSet.drawValuesEnabled = false
        
        return dataSet
    }

}

extension GraphTVC: ChartViewDelegate {
    
}
