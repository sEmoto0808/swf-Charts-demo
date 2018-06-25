//
//  ViewController.swift
//  swf-RaderChart-demo
//
//  Created by S.Emoto on 2018/06/26.
//  Copyright © 2018年 S.Emoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var radarView: CustomRadarChartView!
    private let elements = ["A", "B", "C", "D", "E", "F"]
    private let values = [10.0, 20.0, 30.0, 40.0, 50.0, 60.0]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        radarView.setData(withPoints: elements, values: values, delegate:self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

