//
//  PieChartView.swift
//  Stocks
//
//  Created by Dhaval Biradar on 12/26/21.
//

import Foundation
import SwiftUI
import SwiftUICharts

struct PieChartView: View {
    let data: [Double]
    var body: some View {
        VStack {
            PieChart()
                .data(data)
                .chartStyle(ChartStyle(backgroundColor: .white, foregroundColor: [ColorGradient(.cyan), ColorGradient(.orange), ColorGradient(.mint), ColorGradient(.red), ColorGradient(.green)]))
        }
    }
}
