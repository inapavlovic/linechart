//
//  ViewController.swift
//  Chart
//
//  Created by Ina Statkic on 20/07/2020.
//  Copyright © 2020 Ina. All rights reserved.
//

import UIKit
import Charts
import TinyConstraints

class ChartViewController: UIViewController {
    
    lazy var lineChartView: LineChartView = {
        let chartView = LineChartView()
        chartView.rightAxis.enabled = false
        let yAxis = chartView.leftAxis
        yAxis.labelFont = .systemFont(ofSize: 15)
        yAxis.labelTextColor = .gray
        yAxis.setLabelCount(4, force: false)
        
        chartView.xAxis.labelPosition = .bottomInside
        chartView.xAxis.axisLineColor = .gray
        chartView.xAxis.labelTextColor = .gray
        chartView.xAxis.labelFont = .systemFont(ofSize: 15)
        chartView.xAxis.setLabelCount(4, force: false)
        
        chartView.animate(yAxisDuration: 2.0)
        
        chartView.xAxis.gridLineDashLengths = [4.0, 4.0]
        chartView.xAxis.gridLineDashPhase = 0
        
        return chartView
    }()
    
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setData()
    }
    
    // MARK: UI
    
    func setUI() {
        view.addSubview(lineChartView)
        lineChartView.centerInSuperview()
        lineChartView.width(to: view)
        lineChartView.heightToWidth(of: view)
    }
    
    func setData() {
        let dataSet = LineChartDataSet(entries: Data.values, label: "Values")
        dataSet.drawCirclesEnabled = false
        dataSet.mode = .cubicBezier
        dataSet.lineWidth = 4.0
        dataSet.setColor(.systemBlue)
        let colors = [UIColor.white.cgColor, UIColor.systemBlue.cgColor]
        let gradient = CGGradient(colorsSpace: nil, colors: colors as CFArray, locations: nil)!
        dataSet.fill = Fill(linearGradient: gradient, angle: 90)
//        dataSet.fill = Fill(color: UIColor.systemBlue)
//        dataSet.fillAlpha = 0.1
        dataSet.drawFilledEnabled = true
        
        dataSet.drawVerticalHighlightIndicatorEnabled = false
        dataSet.highlightColor = .systemBlue
        dataSet.highlightLineWidth = 1.0
        dataSet.highlightLineDashLengths = [4.0, 4.0]
        
        let data = LineChartData(dataSet: dataSet)
        data.setDrawValues(false)
        lineChartView.data = data
    }

}

// MARK: - Chart Delegate

extension ChartViewController: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        debugPrint(entry)
    }
}

