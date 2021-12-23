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
    var body: some View {
        Text("Hello World!")
            .onAppear{
//                print(printSector()) - works
                model = {
                    do {
                        return try Test_2(configuration: MLModelConfiguration())
                    }
                    catch {
                        print(error)
                        fatalError()
                    }
                }()
                do {
                    print(try model.prediction(etfPercent: 0, techPercent: 100).isDiverseProbability)
                }
                catch {
                    print("didn't work")
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
