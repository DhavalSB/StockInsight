//
//  StockDataView.swift
//  Stocks
//
//  Created by Dhaval Biradar on 12/27/21.
//

import SwiftUI
import SwiftUICharts

struct StockDataView: View {
    @EnvironmentObject var userPortfolio: Portfolio
    let title: String
    let isDiverse: Bool
    let data: [Double]
    var body: some View {
            ScrollView {
                VStack(alignment: .leading) {
                    PieChart()
                        .data(data)
                        .chartStyle(ChartStyle(backgroundColor: .white, foregroundColor: [ColorGradient(.cyan), ColorGradient(.orange), ColorGradient(.mint), ColorGradient(.red), ColorGradient(.green)]))
                        .padding()
                        .frame(width: 340, height: 340)
                    ForEach(Array(userPortfolio.stocks.keys), id: \.self) {
                        Text("\($0): \(Int(userPortfolio.stockPercentage(stock: $0)*100))%")
                            .foregroundColor(!isDiverse && (userPortfolio.highestValStock() == $0) ? .red : .secondary)
                    }
                }
                .padding()
        }
            .navigationTitle("Stocks")
    }
}

struct StockDataView_Previews: PreviewProvider {
    static var previews: some View {
        StockDataView(title: "Test", isDiverse: false, data: [3, 4, 8])
    }
}
