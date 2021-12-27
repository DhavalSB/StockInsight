//
//  Model.swift
//  Stocks
//
//  Created by Dhaval Biradar on 11/10/21.
//

import Foundation
import SwiftSoup
import SwiftUI
import Alamofire
import Combine


let defaults = UserDefaults.standard

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}

func checkStockValidity(stock: String) -> Bool {
    if getSector(stock: stock) == "N/A" {
        return false
    } else {
        return true
    }
}

func isCS(stock: String) -> Bool {
    var returnVal: Bool = false
    do {
    let content = try String(contentsOf: URL(string: "https://finance.yahoo.com/quote/\(stock)/profile?p=\(stock)")!)
    let doc: Document = try SwiftSoup.parse(content)
    if try doc.select("span[data-reactid='19']")[0].text() == "Sector(s)" {
        returnVal = true
    } else {
        returnVal = false
    }

    } catch Exception.Error(_, let message) {
    print(message)
    } catch {
        print("error")
    }
    return returnVal

}


// CHECK IF STOCK IS COMMON STOCK BEFORE RETURNING SECTOR
// RETURN N/A for Industry if ETF or not Common Stock
func getSector(stock: String) -> String {
    var sector = ""
do {
    let originalURL = "https://finance.yahoo.com/quote/\(stock)/profile?p=\(stock)"
    let replacedURL = originalURL.replacingOccurrences(of: " ", with: "")
    let content = try String(contentsOf: URL(string: replacedURL)!)
    let doc: Document = try SwiftSoup.parse(content)
//   Check if html tag is Sector
    if try (try doc.select("span[data-reactid='19']").indices.contains(0)) && (try doc.select("span[data-reactid='19']")[0].text() == "Sector(s)") {
        let retrievedSector = try doc.select("span[data-reactid='21']")[0]
        sector = try retrievedSector.text()
    } else if try (try doc.select("span[data-reactid='21']").indices.contains(0)) && (try doc.select("span[data-reactid='21']")[0].text() == "Sector(s)") {
         let retrievedSector = try doc.select("span[data-reactid='23']")[0]
        sector = try retrievedSector.text()
// Check if html tag is Legal Type (For ETF's)
    } else if try (try doc.select("span[data-reactid='53']").indices.contains(0)) && (try doc.select("span[data-reactid='53']")[0].text() == "Legal Type"){
        let type = try doc.select("span[data-reactid='54']")[0]
        sector = try type.text()
//  If Neither, Just return N/A
    } else {
        return "N/A"
    }

//    Error Handling
    } catch Exception.Error(_, let message) {
    print(message)
    } catch {
        print("error")
    }

   return sector
    
}

func getIndustry(stock: String) -> String {
    var industry = ""
do {
    let content = try String(contentsOf: URL(string: "https://finance.yahoo.com/quote/\(stock)/profile?p=\(stock)")!)
    let doc: Document = try SwiftSoup.parse(content)
    if try doc.select("span[data-reactid='19']")[0].text() == "Sector(s)" {
        let retrievedIndustry = try doc.select("span[data-reactid='25']")[0]
        industry = try retrievedIndustry.text()

    } else if try doc.select("span[data-reactid='53']")[0].text() == "Legal Type"{ //If not common stock
        let type = try doc.select("span[data-reactid='54']")[0]
        industry = try type.text()
    }

    } catch Exception.Error(_, let message) {
    print(message)
    } catch {
        print("error")
    }

   return industry
    
}


func printSector() {
    let stocks = ["TSLA", "Z", "AAPL", "CPB", "PFE", "BRK-A", "BA", "SPG", "AWK", "MP", "XOM", "SPY"]
    var returnedSectors: [String] = []
    for stock in stocks {
        returnedSectors.append(getSector(stock: stock))
        print("Good for \(stock)")
    }
    print(returnedSectors)
}
