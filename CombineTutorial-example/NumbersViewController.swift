//
//  NumbersViewController.swift
//  RxExample
//
//  Created by Krunoslav Zaher on 12/6/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import UIKit
import Combine
import CombineCocoa

class NumbersViewController: UIViewController {
    @IBOutlet weak var number1: UITextField!
    @IBOutlet weak var number2: UITextField!
    @IBOutlet weak var number3: UITextField!

    @IBOutlet weak var result: UILabel!
    
    var subscriptions = Set<AnyCancellable>()

    var viewModel = NumbersVM()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        number1.textPublisher
            .compactMap{ $0 }
            .assign(to: \.number1, on: viewModel)
            .store(in: &subscriptions)
        number2.textPublisher
            .compactMap{ $0 }
            .assign(to: \.number2, on: viewModel)
            .store(in: &subscriptions)
        number3.textPublisher
            .compactMap{ $0 }
            .assign(to: \.number3, on: viewModel)
            .store(in: &subscriptions)
      
        viewModel.$resultValue
            .compactMap { $0 }
            .assign(to: \.text, on: result)
            .store(in: &subscriptions)
        
        
        Publishers
            .CombineLatest3(
                number1.textPublisher,
                number2.textPublisher,
                number3.textPublisher
            )
            .map {
                textValue1,
                textValue2,
                textValue3
                -> Int in
                return textValue1.getNumber() + textValue2.getNumber() + textValue3.getNumber()
            }
            .map { "\($0)" }
            .assign(to: \.text, on: result)
//            .sink { value in
//                self.result.text = String(value)
//            }
            .store(in: &subscriptions)

    }
}


extension String? {
    fileprivate func getNumber() -> Int {
        return Int(self ?? "0") ?? 0
    }
}
