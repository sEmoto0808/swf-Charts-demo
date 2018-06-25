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
    
    func setData(withPoints points:[String], values:[Double], delegate:UIViewController?) {
        
        guard let delegate = delegate else {
            return
        }
        self.delegate = delegate as? ChartViewDelegate
        
        if points.count != values.count {
            print("データ数不一致")
            return
        }
        
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
        
        self.data = RadarChartData(dataSet: set)
        
    }
}
