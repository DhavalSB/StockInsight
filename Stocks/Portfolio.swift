//
//  Portfolio.swift
//  Stocks
//
//  Created by Dhaval Biradar on 12/12/21.
//

import Foundation

class Portfolio: ObservableObject {
    
    private let saveKey: String = "Portfolio"
    
    @Published var stocks: [String: Double] = [:]
    
    @Published var consumerCyclicalNum: Double
    @Published var communicationServicesNum: Double
    @Published var technologyNum: Double
    @Published var consumerDefensiveNum: Double
    @Published var healthcareNum: Double
    @Published var financialServicesNum: Double
    @Published var industrialsNum: Double
    @Published var realEstateNum: Double
    @Published var utilitiesNum: Double
    @Published var basicMaterialsNum: Double
    @Published var energyNum: Double
    @Published var exchangeTradedFundNum: Double
    
    init() {
//        self.consumerCyclicalNum = consumerCyclicalNum
//        self.communicationServicesNum = communicationServicesNum
//        self.technologyNum = technologyNum
//        self.consumerDefensiveNum = consumerDefensiveNum
//        self.healthcareNum = healthcareNum
//        self.financialServicesNum = financialServicesNum
//        self.industrialsNum = industrialsNum
//        self.realEstateNum = realEstateNum
//        self.utilitiesNum = utilitiesNum
//        self.basicMaterialsNum = basicMaterialsNum
//        self.energyNum = energyNum
//        self.exchangeTradedFundNum = exchangeTradedFundNum
        
        self.stocks = defaults.object(forKey: saveKey) as? [String:Double] ?? [:]
        self.consumerCyclicalNum = defaults.object(forKey: "cCyclical") as? Double ?? 0
        self.communicationServicesNum = defaults.object(forKey: "comServices") as? Double ?? 0
        self.technologyNum = defaults.object(forKey: "tech") as? Double ?? 0
        self.consumerDefensiveNum = defaults.object(forKey: "cDefensive") as? Double ?? 0
        self.healthcareNum = defaults.object(forKey: "healthcare") as? Double ?? 0
        self.financialServicesNum = defaults.object(forKey: "finServices") as? Double ?? 0
        self.industrialsNum = defaults.object(forKey: "industrials") as? Double ?? 0
        self.realEstateNum = defaults.object(forKey: "realEstate") as? Double ?? 0
        self.utilitiesNum = defaults.object(forKey: "utilities") as? Double ?? 0
        self.basicMaterialsNum = defaults.object(forKey: "materials") as? Double ?? 0
        self.energyNum = defaults.object(forKey: "energy") as? Double ?? 0
        self.exchangeTradedFundNum = defaults.object(forKey: "etf") as? Double ?? 0
        
        
        guard let data = UserDefaults.standard.data(forKey: saveKey) else {
            // write your code as per your requirement
            stocks = [:]
            return
        }
        guard let values = try? JSONDecoder().decode(Dictionary<String, Double>.self, from: data) else {
            fatalError("unable to decode this data")
        }
        stocks = values
    }
    
     func addStock(stock: String, number: Double) {
        self.stocks[stock.uppercased()] = number
        save()
    }
    
    func save() {
        guard let data = try? JSONEncoder().encode(self.stocks) else {
            fatalError("unable encode as data")
        }
        UserDefaults.standard.set(data, forKey: saveKey)
        defaults.set(consumerCyclicalNum, forKey: "cCyclical")
        defaults.set(communicationServicesNum, forKey: "comServices")
        defaults.set(technologyNum, forKey: "tech")
        defaults.set(consumerDefensiveNum, forKey: "cDefensive")
        defaults.set(healthcareNum, forKey: "healthcare")
        defaults.set(financialServicesNum, forKey: "finServices")
        defaults.set(industrialsNum, forKey: "industrials")
        defaults.set(realEstateNum, forKey: "realEstate")
        defaults.set(utilitiesNum, forKey: "utilities")
        defaults.set(basicMaterialsNum, forKey: "materials")
        defaults.set(energyNum, forKey: "energy")
        defaults.set(exchangeTradedFundNum, forKey: "etf")
    }
    
     func setPortfolioNums() {
        self.resetSectorNums()
        for i in self.stocks.keys {
            let stockSector = getSector(stock: i)
            if stockSector == "Consumer Cyclical" {
                consumerCyclicalNum += self.stocks[i] ?? 0
            } else if stockSector == "Communication Services" {
                communicationServicesNum += self.stocks[i] ?? 0
            } else if stockSector == "Technology" {
                technologyNum += self.stocks[i] ?? 0
            } else if stockSector == "Consumer Defensive" {
                consumerDefensiveNum += self.stocks[i] ?? 0
            } else if stockSector == "Healthcare" {
                healthcareNum += self.stocks[i] ?? 0
            } else if stockSector == "Financial Services" {
                financialServicesNum += self.stocks[i] ?? 0
            } else if stockSector == "Industrials" {
                industrialsNum += self.stocks[i] ?? 0
            } else if stockSector == "Real Estate" {
                realEstateNum += self.stocks[i] ?? 0
            } else if stockSector == "Utilities" {
                utilitiesNum += self.stocks[i] ?? 0
            } else if stockSector == "Basic Materials" {
                basicMaterialsNum += self.stocks[i] ?? 0
            } else if stockSector == "Energy" {
                energyNum += self.stocks[i] ?? 0
            } else if stockSector == "Exchange Traded Fund" {
                exchangeTradedFundNum += self.stocks[i] ?? 0
            }
        }
         self.save()
    }
    
    func sectorPercentage(sector: Int) -> Double {
        let total = (consumerCyclicalNum+communicationServicesNum+technologyNum+consumerDefensiveNum+healthcareNum+financialServicesNum+industrialsNum+realEstateNum+utilitiesNum+basicMaterialsNum+energyNum+exchangeTradedFundNum)
        
        if sector == 1 {
            return consumerCyclicalNum/total
        } else if sector == 2 {
            return communicationServicesNum/total
        } else if sector == 3 {
            return technologyNum/total
        } else if sector == 4 {
            return consumerDefensiveNum/total
        } else if sector == 5 {
            return healthcareNum/total
        } else if sector == 6 {
            return financialServicesNum/total
        } else if sector == 7 {
            return industrialsNum/total
        } else if sector == 8 {
            return realEstateNum/total
        } else if sector == 9 {
            return utilitiesNum/total
        } else if sector == 10 {
            return basicMaterialsNum/total
        } else if sector == 11 {
            return energyNum/total
        } else if sector == 12 {
            return exchangeTradedFundNum/total
        } else {
            return 0
        }
        
    }
    
    func stockPercentage(stock: String) -> Double {
        let total = (consumerCyclicalNum+communicationServicesNum+technologyNum+consumerDefensiveNum+healthcareNum+financialServicesNum+industrialsNum+realEstateNum+utilitiesNum+basicMaterialsNum+energyNum+exchangeTradedFundNum)
        
        return (self.stocks[stock] ?? 0) / total
    }
    
     func resetAll() {
        self.stocks = [:]
        self.consumerCyclicalNum = 0
        self.communicationServicesNum = 0
        self.technologyNum = 0
        self.consumerDefensiveNum = 0
        self.healthcareNum = 0
        self.financialServicesNum = 0
        self.industrialsNum = 0
        self.realEstateNum = 0
        self.utilitiesNum = 0
        self.basicMaterialsNum = 0
        self.energyNum = 0
        self.exchangeTradedFundNum = 0
        self.save()
    }
    
     func resetSectorNums() {
        self.consumerCyclicalNum = 0
        self.communicationServicesNum = 0
        self.technologyNum = 0
        self.consumerDefensiveNum = 0
        self.healthcareNum = 0
        self.financialServicesNum = 0
        self.industrialsNum = 0
        self.realEstateNum = 0
        self.utilitiesNum = 0
        self.basicMaterialsNum = 0
        self.energyNum = 0
        self.exchangeTradedFundNum = 0
        self.save()
    }
    
    func highestPercentStock() -> Double {
        let total = (consumerCyclicalNum+communicationServicesNum+technologyNum+consumerDefensiveNum+healthcareNum+financialServicesNum+industrialsNum+realEstateNum+utilitiesNum+basicMaterialsNum+energyNum+exchangeTradedFundNum)
        var highestVal: Double = 0
        for stock in stocks.keys {
            if stocks[stock]  ?? 0 > highestVal {
                highestVal = stocks[stock] ?? 0
            }
        }
        return highestVal/total
    }
    
    func highestValStock() -> String {
        var highestValStock: String = ""
        var highestVal: Double = 0
        for stock in stocks.keys {
            if stocks[stock]  ?? 0 > highestVal {
                highestValStock = stock
                highestVal = stocks[stock] ?? 0
            }
        }
        return highestValStock
    }
    
    func highestPercentSector() -> Double {
        let total = (consumerCyclicalNum+communicationServicesNum+technologyNum+consumerDefensiveNum+healthcareNum+financialServicesNum+industrialsNum+realEstateNum+utilitiesNum+basicMaterialsNum+energyNum+exchangeTradedFundNum)
        var highestVal: Double = 0
        for i in  [consumerCyclicalNum, communicationServicesNum, technologyNum, consumerDefensiveNum, healthcareNum, financialServicesNum, industrialsNum, realEstateNum, utilitiesNum, basicMaterialsNum, energyNum]{
            if i > highestVal {
                highestVal = i
            }
        }
        return highestVal/total
    }
    
    func highestValSector() -> String {
        let sectorsNamesArray: [String] = ["Consumer Cyclical", "Communication Services", "Technology", "Consumer Defensive", "Healthcare", "Financial Services", "Industrials", "Real Estate", "Utilities", "Basic Materials", "Energy"]
        let sectorsValArray: [Double] = [consumerCyclicalNum, communicationServicesNum, technologyNum, consumerDefensiveNum, healthcareNum, financialServicesNum, industrialsNum, realEstateNum, utilitiesNum, basicMaterialsNum, energyNum]
        var highestVal: Double = 0
        var highestValName: String = ""
        for i in 0...10 {
            if sectorsValArray[i] > highestVal {
                highestVal = sectorsValArray[i]
                highestValName = sectorsNamesArray[i]
            }
        }
        return highestValName
    }
}

