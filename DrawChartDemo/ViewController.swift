//
//  ViewController.swift
//  DrawChartDemo
//
//  Created by Nguyễn Mạnh Linh on 19/06/2023.
//

import UIKit

class ViewController: UIViewController {

    var chartDataSource: [ChartData] = []
    
    var chartView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initChartData()

        chartView = UIView(frame: CGRect(x: 20, y: 200, width: 300, height: 350))
        chartView.backgroundColor = .white
        
        self.view.addSubview(chartView)
        
        drawChartColumn()
    }
    
    func maxValueInChart() -> Double{
        var maxValueInChart = chartDataSource[0].value
        for data in chartDataSource{
            if data.value > maxValueInChart{
                maxValueInChart = data.value
            }
        }
        return maxValueInChart
    }
    
    func drawChartColumn(){
        for (i, currentData) in chartDataSource.enumerated(){
            let currentX = 15 + (i * 30)
            let currentHeight = (currentData.value/maxValueInChart()) * (chartView.frame.height * 0.8)
            let currentY = chartView.frame.height - currentHeight
            
            let currentColumn = UIView(frame: CGRect(x: Double(currentX + 30), y: currentY, width: 25, height: currentHeight))
            currentColumn.backgroundColor = currentData.color
            
            chartView.addSubview(currentColumn)
        }
        
        drawChartLabels()
        drawYLabels()
    }
    
    func drawChartLabels(){
        for (i, currentData) in chartDataSource.enumerated() {
            let labelX = 15 + (i * 30) + 30
            let labelY = chartView.frame.height
            
            let valueX = UILabel(frame: CGRect(x: labelX , y: Int(labelY), width: 25, height: 20))
            valueX.text = currentData.type
            valueX.textAlignment = .center
            valueX.font = UIFont.systemFont(ofSize: 10)
            valueX.textColor = .black
            chartView.addSubview(valueX)
            
            let valueY = UILabel(frame: CGRect(x: labelX, y: Int(labelY - (currentData.value/maxValueInChart()) * (chartView.frame.height * 0.8)) , width: 25, height: 20))
            valueY.text = String(currentData.value)
            valueY.textAlignment = .center
            valueY.font = UIFont.systemFont(ofSize: 10)
            valueY.textColor = .black
            chartView.addSubview(valueY)
        }
    }
    
    func drawYLabels() {
        let values: [Int] = [0,5000,10000,15000,20000,25000,30000,35000,40000]
        let maxValue = CGFloat(maxValueInChart())
        let chartHeight = chartView.frame.height * 0.8
        
        for value in values {
            let labelY = chartView.frame.height - (CGFloat(value) / maxValue) * chartHeight - 20
            
            let label = UILabel(frame: CGRect(x: 0, y: labelY, width: 40, height: 20))
            label.text = String(value)
            label.textAlignment = .right
            label.font = UIFont.systemFont(ofSize: 10)
            label.textColor = .black
            
            chartView.addSubview(label)
        }
    }
    
    func initChartData(){
        let thang1 = ChartData(type: "Jan", value: 12000, color: .red)
        let thang2 = ChartData(type: "Feb", value: 20000, color: .green)
        let thang3 = ChartData(type: "Mar", value: 15000, color: .yellow)
        let thang4 = ChartData(type: "Apr", value: 19000, color: .purple)
        let thang5 = ChartData(type: "May", value: 7000, color: .orange)
        let thang6 = ChartData(type: "Jun", value: 30000, color: .cyan)
        let thang7 = ChartData(type: "Jul", value: 25000, color: .darkGray)
        let thang8 = ChartData(type: "Aug", value: 4000, color: .magenta)
        let thang9 = ChartData(type: "Sep", value: 28000, color: .purple)
        let thang10 = ChartData(type: "Oct", value: 11000, color: .red)
        let thang11 = ChartData(type: "Nov", value: 8000, color: .brown)
        let thang12 = ChartData(type: "Dec", value: 15000, color: .clear)
        
        chartDataSource.append(thang1)
        chartDataSource.append(thang2)
        chartDataSource.append(thang3)
        chartDataSource.append(thang4)
        chartDataSource.append(thang5)
        chartDataSource.append(thang6)
        chartDataSource.append(thang7)
        chartDataSource.append(thang8)
        chartDataSource.append(thang9)
        chartDataSource.append(thang10)
        chartDataSource.append(thang11)
        chartDataSource.append(thang12)
        
    }

}


