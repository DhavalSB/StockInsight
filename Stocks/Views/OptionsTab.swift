//
//  OptionsTab.swift
//  Stocks
//
//  Created by Dhaval Biradar on 12/24/21.
//

import Foundation
import SwiftUI

struct OptionsTab: View {
    @EnvironmentObject var userPortfolio: Portfolio
    @AppStorage("setupIsComplete") private var setupIsComplete: Bool = true
    var body: some View {
        VStack {
            Spacer()
            
            Button(action: {setupIsComplete=false}) {
                HStack {
                    Image(systemName: "ellipsis.circle.fill")
                    Text("Edit Portfolio")
                }
            }
            .foregroundColor(.black)
            .buttonStyle(PlainButtonStyle())
            
            Spacer()
           
            Button(action: {userPortfolio.resetAll()}) {
                HStack {
                    Image(systemName: "exclamationmark.triangle.fill")
                    Text("Reset All")
                }
            }
            .foregroundColor(.black)
            .buttonStyle(PlainButtonStyle())
            
            Spacer()
        }
    }
}
