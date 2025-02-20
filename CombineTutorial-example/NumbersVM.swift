//
//  NumbersVM.swift
//  CombineTutorial-example
//
//  Created by 차상진 on 2/20/25.
//

import Foundation
import Combine
import UIKit

class NumbersVM: ObservableObject {
    
    //input
    @Published var number1: String = ""
    @Published var number2: String = ""
    @Published var number3: String = ""
    
    
    //output
    @Published var resultValue: String = ""
    
    
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        print("init()")
        
        Publishers
            .CombineLatest3(
                $number1,
                $number2,
                $number3
            )
            .map {
                textValue1,
                textValue2,
                textValue3
                -> Int in
                return textValue1.getNumber() + textValue2.getNumber() + textValue3.getNumber()
            }
            .map { "\($0)" }
            .assign(to: \.resultValue, on: self)
//            .sink { value in
//                self.result.text = String(value)
//            }
            .store(in: &subscriptions)
        
    }
}

extension String {
    fileprivate func getNumber() -> Int {
        return Int(self) ?? 0
    }
}
