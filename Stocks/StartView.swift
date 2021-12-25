//
//  StartView.swift
//  Stocks
//
//  Created by Dhaval Biradar on 12/24/21.
//

import Foundation
import SwiftUI

struct StartView: View {
    @State var name: String = ""
    @State var shares: String = ""
    @State var isValid: Bool = false
    @State private var showingAlert = false
    @State var hasSubmitted = false
    @AppStorage("setupIsComplete") private var setupIsComplete: Bool = false
    var body: some View {
        NavigationView {
            Form() {
                Section(header: Text("Input your stocks:")) {
                    VStack {
                        HStack {
                        TextField("Enter Ticker (Ex. AAPL, GOOG)", text: $name)
                                .disableAutocorrection(true)
                                .onSubmit {
                                    isValid = checkStockValidity(stock: name)
                                    hasSubmitted = true
                                }
                            Image(systemName: isValid ? "checkmark.circle.fill" : "multiply.circle.fill")
                                .foregroundColor(isValid ? .green : .red)
                        }
                    }
                        TextField("$ amount of stock held", text: $shares)
                            .keyboardType(.decimalPad)
                            .submitLabel(.next)
                            .disableAutocorrection(true)
                            .onTapGesture {
                                if !hasSubmitted {
                                    isValid = checkStockValidity(stock: name)
                                }
                            }
                    HStack {
                        Spacer()
                        Button(action: {
                            hideKeyboard()
                            if isValid && ((Double(shares) ?? -1 > 0))  {
                                userPortfolio.addStock(stock: name, number: Double(shares)!)
                                print(userPortfolio)
                                name = ""
                                shares = ""
                                isValid = false
                                hasSubmitted = false
                            } else {
                                showingAlert = true
                            }
                        }) {
                            Text("Next")
                        }
                        .buttonStyle(PlainButtonStyle())
                        .alert("Invalid Entry", isPresented: $showingAlert) {
                            Button("OK", role: .cancel) {}
                        }
                        
                        Spacer()
                        Divider()
                        Spacer()
                        
                        Button(action: {
                            hideKeyboard()
                            if isValid && ((Double(shares) ?? -1 > 0))  {
                                userPortfolio.addStock(stock: name, number: Double(shares)!)
                                print(userPortfolio)
                                setupIsComplete = true
                            } else if userPortfolio.stocks.isEmpty{
                                showingAlert = true
                            } else {
                                setupIsComplete = true
                            }
                        }) {
                            Text("Finish")
                        }
                        .buttonStyle(PlainButtonStyle())
                        Spacer()
                    }
                }
            }
            .navigationBarTitle("Intelligent Insight")
        }
    }
}

