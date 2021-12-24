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
    var body: some Scene {
        WindowGroup {
            if !setupIsComplete {
                StartView()
                    .preferredColorScheme(.light)
            } else {
                ContentView()
                    .preferredColorScheme(.light)
            }
        }
    }
}
