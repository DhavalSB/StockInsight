//
//  SectorDataView.swift
//  Stocks
//
//  Created by Dhaval Biradar on 12/27/21.
//

import SwiftUI
import SwiftUICharts

struct SectorDataView: View {
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
                    Group {
                    Text("Consumer Cyclical: \(Int(userPortfolio.sectorPercentage(sector: 1)*100))%")
                            .foregroundColor(!isDiverse && userPortfolio.highestValSector() == "Consumer Cyclical" ? .red : .secondary)
                    Text("Communication Services: \(Int(userPortfolio.sectorPercentage(sector: 2)*100))%")
                            .foregroundColor(!isDiverse && userPortfolio.highestValSector() == "Communication Services" ? .red : .secondary)
                    Text("Technology: \(Int(userPortfolio.sectorPercentage(sector: 3)*100))%")
                            .foregroundColor(!isDiverse && userPortfolio.highestValSector() == "Technology" ? .red : .secondary)
                    Text("Consumer Defensive: \(Int(userPortfolio.sectorPercentage(sector: 4)*100))%")
                            .foregroundColor(!isDiverse && userPortfolio.highestValSector() == "Consumer Defensive" ? .red : .secondary)
                    Text("Healthcare: \(Int(userPortfolio.sectorPercentage(sector: 5)*100))%")
                            .foregroundColor(!isDiverse && userPortfolio.highestValSector() == "Healthcare" ? .red : .secondary)
                    Text("Financial Services: \(Int(userPortfolio.sectorPercentage(sector: 6)*100))%")
                            .foregroundColor(!isDiverse && userPortfolio.highestValSector() == "Financial Services" ? .red : .secondary)
                    Text("Industrials: \(Int(userPortfolio.sectorPercentage(sector: 7)*100))%")
                            .foregroundColor(!isDiverse && userPortfolio.highestValSector() == "Industrials" ? .red : .secondary)
                    Text("Real Estate: \(Int(userPortfolio.sectorPercentage(sector: 8)*100))%")
                            .foregroundColor(!isDiverse && userPortfolio.highestValSector() == "Real Estate" ? .red : .secondary)
                    Text("Utilities: \(Int(userPortfolio.sectorPercentage(sector: 9)*100))%")
                            .foregroundColor(!isDiverse && userPortfolio.highestValSector() == "Utilities" ? .red : .secondary)
                    Text("Basic Materials: \(Int(userPortfolio.sectorPercentage(sector: 10)*100))%")
                            .foregroundColor(!isDiverse && userPortfolio.highestValSector() == "Basic Materials" ? .red : .secondary)
                    }
                    Text("Energy: \(Int(userPortfolio.sectorPercentage(sector: 11)*100))%")
                            .foregroundColor(!isDiverse && userPortfolio.highestValSector() == "Energy" ? .red : .secondary)
                    Text("Exchange Traded Funds (ETFs): \(Int(userPortfolio.sectorPercentage(sector: 12)*100))%")
                        .foregroundColor(.secondary)
                }
                .padding()
        }
            .navigationTitle("Sectors")
    }
}
    
struct SectorDataView_Previews: PreviewProvider {
    static var previews: some View {
        SectorDataView(title: "Test", isDiverse: false, data: [3, 7])
    }
}
