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
    @AppStorage("setupIsComplete") private var setupIsComplete: Bool = true
    var body: some View {
        TabView {
            InsightView()
                .tabItem({
                    Label("Home", systemImage: "house.fill")
                })
            
            OptionsTab()
            .tabItem{
                Label("Options", systemImage: "gear")
            }
                    
        }
        .onAppear {
            print(userPortfolio)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
