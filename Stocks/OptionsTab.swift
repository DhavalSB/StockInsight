//
//  OptionsTab.swift
//  Stocks
//
//  Created by Dhaval Biradar on 12/24/21.
//

import Foundation
import SwiftUI

struct OptionsTab: View {
    @AppStorage("setupIsComplete") private var setupIsComplete: Bool = true
    var body: some View {
        VStack {
            Spacer()
            
            Button(action: {setupIsComplete=false}) {
                    Text("Reset")
            }
            .padding()
            
            Spacer()
            
            Button(action: {userPortfolio.setPortfolioNums()}) {
                Text("Set Nums")
            }
            .padding()
            
            Spacer()
            
            Button(action: {userPortfolio.resetAll()}) {
                Text("RESET ALL.")
            }
            .padding()
            
            Spacer()
        }
    }
}
