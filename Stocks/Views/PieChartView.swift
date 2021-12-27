//
//  PieChartView1.swift
//  Stocks
//
//  Created by Dhaval Biradar on 12/26/21.
//

import SwiftUI
import SwiftUICharts

struct PieChartView: View {
    let title: String
    let data: [Double]
    let info1: String
    let info2: String
    var body: some View {
            VStack {
                Text(title)
                HStack {
                    PieChart()
                        .data(data)
                        .chartStyle(ChartStyle(backgroundColor: .white, foregroundColor: [ColorGradient(.cyan), ColorGradient(.orange), ColorGradient(.mint), ColorGradient(.red), ColorGradient(.green)]))
                        .padding()
                    VStack {
                        Text(info1)
                            .padding()
                        Text(info2)
                            .padding()
                }
            }
        }
    }

}

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView(title: "Sectors", data: [3, 5, 8, 13, 11], info1: "Example—32%", info2: "")
    }
}
