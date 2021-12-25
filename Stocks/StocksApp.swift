//
//  StocksApp.swift
//  Stocks
//
//  Created by Dhaval Biradar on 8/29/21.
//

import SwiftUI

@main
struct StocksApp: App {
    @AppStorage("setupIsComplete") private var setupIsComplete: Bool = false
    @StateObject var userPortfolio: Portfolio = Portfolio()
    var body: some Scene {
        WindowGroup {
            if !setupIsComplete {
                StartView()
                    .environmentObject(userPortfolio)
                    .preferredColorScheme(.light)
            } else {
                ContentView()
                    .environmentObject(userPortfolio)
                    .preferredColorScheme(.light)
            }
        }
    }
}
