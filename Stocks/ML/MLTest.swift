//
//  MLTest.swift
//  Stocks
//
//  Created by Dhaval Biradar on 12/17/21.
//

import Foundation
import CoreML
import CreateML

let model: SVM_Classifier_2 = {
    do {
        let config = MLModelConfiguration()
        return try SVM_Classifier_2(configuration: config)
    } catch {
        print(error)
        fatalError("Couldn't create model")
    }
}()
