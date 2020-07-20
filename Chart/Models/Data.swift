//
//  Data.swift
//  Chart
//
//  Created by Ina Statkic on 20/07/2020.
//  Copyright © 2020 Ina. All rights reserved.
//

import Foundation
import Charts

struct Data {
    let x: Double
    let y: Double

    static var values: [ChartDataEntry] {
        return [
            ChartDataEntry(x: 0.0, y: 48.0),
            ChartDataEntry(x: 1.0, y: 40.0),
            ChartDataEntry(x: 2.2, y: 65.0),
            ChartDataEntry(x: 3.0, y: 50.0),
            ChartDataEntry(x: 3.8, y: 90.0)
        ]
    }
}
