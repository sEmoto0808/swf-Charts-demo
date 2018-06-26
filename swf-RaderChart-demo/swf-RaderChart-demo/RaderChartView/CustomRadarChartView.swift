//
//  RaderChartView.swift
//  swf-RaderChart-demo
//
//  Created by S.Emoto on 2018/06/26.
//  Copyright © 2018年 S.Emoto. All rights reserved.
//

import UIKit
import Charts

final class CustomRadarChartView: RadarChartView {

}

extension CustomRadarChartView {
    
    func setupAxis() {
        let xAxis = self.xAxis
        //xAxis.labelFont = .systemFont(ofSize: 9, weight: .light)
        xAxis.xOffset = 0
        xAxis.yOffset = 0
        //xAxis.valueFormatter = self
        xAxis.labelTextColor = .white
        
        let yAxis = self.yAxis
        //yAxis.labelFont = .systemFont(ofSize: 9, weight: .light)
        //yAxis.labelCount = 5
        yAxis.axisMinimum = 0
        yAxis.axisMaximum = 80
        yAxis.drawLabelsEnabled = true
        yAxis.centerAxisLabelsEnabled = false
    }
    
    func setupLegend() {
        let legend = self.legend
        legend.enabled = false  // 凡例を消す
    }
    
    func setData(withPoints points:[String], values:[Double], delegate:UIViewController?) {
        
        guard let delegate = delegate else {
            return
        }
        self.delegate = delegate as? ChartViewDelegate
        
        if points.count != values.count {
            print("データ数不一致")
            return
        }
        
        // 軸の設定
        setupAxis()
        // 凡例の設定
        setupLegend()
        
        var dataEntries: [RadarChartDataEntry] = []
        
        for value in values {
            let dataEntry = RadarChartDataEntry(value: value)
            dataEntries.append(dataEntry)
        }
        
        let set = RadarChartDataSet(values: dataEntries, label: "Data")
        // グラフ塗りつぶし
        set.fillColor = UIColor.red
        set.drawFilledEnabled = true
        set.fillAlpha = 0.7
        // グラフに値を表示しない
        set.drawValuesEnabled = false
        
        self.data = RadarChartData(dataSet: set)
    }
    
    func setDataWithAnimation(withPoints points:[String], values:[Double], delegate:UIViewController?) {
        
        guard let delegate = delegate else {
            return
        }
        self.delegate = delegate as? ChartViewDelegate
        
        if points.count != values.count {
            print("データ数不一致")
            return
        }
        
        // 軸の設定
        setupAxis()
        // 凡例の設定
        setupLegend()
        
        var dataEntries: [RadarChartDataEntry] = []
        
        for value in values {
            let dataEntry = RadarChartDataEntry(value: value)
            dataEntries.append(dataEntry)
        }
        
        let set = RadarChartDataSet(values: dataEntries, label: "Data")
        // グラフ塗りつぶし
        set.fillColor = UIColor.red
        set.drawFilledEnabled = true
        set.fillAlpha = 0.7
        // グラフに値を表示しない
        set.drawValuesEnabled = false
        
        self.data = RadarChartData(dataSet: set)
        self.animate(yAxisDuration: 1.4)
    }
}
