//
//  GridView.swift
//  Stocks
//
//  Created by Dhaval Biradar on 12/24/21.
//

import Foundation
import SwiftUI
import SwiftUICharts

struct InsightView: View {
    var body: some View {
        VStack {
            Text("Hello World!")
        }
        .onAppear(perform: {
            guard let output =  try? model.prediction(Consumer_Cyclical: userPortfolio.sectorPercentage(sector: 1), Communication_Services: userPortfolio.sectorPercentage(sector: 2), Technology: userPortfolio.sectorPercentage(sector: 3), Consumer_Defensive: userPortfolio.sectorPercentage(sector: 4), Healthcare: userPortfolio.sectorPercentage(sector: 5), Financial_Services: userPortfolio.sectorPercentage(sector: 6), Industrials: userPortfolio.sectorPercentage(sector: 7), Real_Estate: userPortfolio.sectorPercentage(sector: 8), Utilities: userPortfolio.sectorPercentage(sector: 9), Basic_Materials: userPortfolio.sectorPercentage(sector: 10), Energy: userPortfolio.sectorPercentage(sector: 11), Exchange_Traded_Fund: userPortfolio.sectorPercentage(sector: 12)) else {
                fatalError("Unexpected runtime error.")
            }
            print("MODEL PREDICTION: \(output.isDiverse)")
        })
    }
}


