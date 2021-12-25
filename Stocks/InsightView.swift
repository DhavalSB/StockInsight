//
//  GridView.swift
//  Stocks
//
//  Created by Dhaval Biradar on 12/24/21.
//

import Foundation
import SwiftUI
import SwiftUICharts
import CoreML

struct InsightView: View {
    @EnvironmentObject var userPortfolio: Portfolio
    var body: some View {
    let isDiverse = try! model.prediction(Consumer_Cyclical: userPortfolio.sectorPercentage(sector: 1), Communication_Services: userPortfolio.sectorPercentage(sector: 2), Technology: userPortfolio.sectorPercentage(sector: 3), Consumer_Defensive: userPortfolio.sectorPercentage(sector: 4), Healthcare: userPortfolio.sectorPercentage(sector: 5), Financial_Services: userPortfolio.sectorPercentage(sector: 6), Industrials: userPortfolio.sectorPercentage(sector: 7), Real_Estate: userPortfolio.sectorPercentage(sector: 8), Utilities: userPortfolio.sectorPercentage(sector: 9), Basic_Materials: userPortfolio.sectorPercentage(sector: 10), Energy: userPortfolio.sectorPercentage(sector: 11), Exchange_Traded_Fund: userPortfolio.sectorPercentage(sector: 12)).isDiverse
        NavigationView {
            VStack {
                NavigationLink(destination: InsightInfoView(isDiverse: isDiverse).environmentObject(userPortfolio)) {
                VStack {
                    HStack {
                    VStack(alignment: .leading){
                        Text("Your portfolio is \(Bool(isDiverse.lowercased()) ?? false ? Text("diverse.").bold() : Text("not diverse.").bold())")
                            .foregroundColor(.black)
                        Text("Find out more.")
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.black)
                        .padding()
                    }
                }
            }
            .padding()
                    Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Spacer()
                        HStack {
                            Image(systemName: Bool(isDiverse.lowercased()) ?? false ? "chart.line.uptrend.xyaxis" : "arrow.down.forward.circle")
                                .foregroundColor(Bool(isDiverse.lowercased()) ?? false ? .mint : .red)
                            Spacer()
                        }
                    }
                }
            }
        }
        .onAppear(perform: {
            print("MODEL PREDICTION: \(isDiverse)")
        })
    }
}


struct InsightInfoView: View {
    @EnvironmentObject var userPortfolio: Portfolio
    var isDiverse: String
    var body: some View {
        let diverse = Bool(isDiverse.lowercased()) ?? false ? "diverse" : "not diverse"
        ScrollView {
            HStack {
                Image(systemName: Bool(isDiverse.lowercased()) ?? false ? "chart.line.uptrend.xyaxis" : "arrow.down.forward.circle")
                    .resizable()
                    .frame(width: diverse == "diverse" ? 70 : 60, height: 60)
                    .foregroundColor(Bool(isDiverse.lowercased()) ?? false ? .mint : .red)
                Spacer()
                Text(Bool(isDiverse.lowercased()) ?? false ? "Nice Portfolio" : "Try Improving")
                    .foregroundColor(.secondary)
                    .font(.title)
                Spacer()
            }
            .padding()
            Text("  The model has classified your portfolio as \(Text(diverse).bold()). The algorithm makes its classification by determining whether your portfolio is concentrated in a few market sectors, rather than a variety of sectors. \n To improve your portfolio, consider these options: \n    \(Text("Diversify").bold())—invest in larger varieties of stocks. Investing in large index funds is a great way of diversifying, because they track a large number of stocks; \n  \(Text("Consistency").bold())—keep investing despite current market situations. Research has shown that being invested in the market longer beats timing the market; \n   \(Text("Risk Management").bold())—only invest the amount you are willing to lose. \n \n \(diverse == "diverse" ? Text("Nice work. Keep up your investing habits!").bold() : Text("Try improving your portfolio.").bold())")
                .foregroundColor(.secondary)
                .padding()
            Spacer()
        }
    }
}
