//
//  ContentView.swift
//  Stocks
//
//  Created by Dhaval Biradar on 8/29/21.
//

import SwiftUI
import SwiftSoup
import CoreML

struct ContentView: View {
    @EnvironmentObject var userPortfolio: Portfolio
    @AppStorage("setupIsComplete") private var setupIsComplete: Bool = true
    var body: some View {
        TabView {
            InsightView()
                .environmentObject(userPortfolio)
                .tabItem({
                    Label("Home", systemImage: "house.fill")
                })
            
            OptionsTab()
                .environmentObject(userPortfolio)
            .tabItem{
                Label("Options", systemImage: "gear")
            }
                    
        }
        .onAppear {
            print(userPortfolio.stocks)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
