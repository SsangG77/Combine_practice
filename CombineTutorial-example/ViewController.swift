//
//  ViewController.swift
//  CombineTutorial-example
//
//  Created by 차상진 on 2/19/25.
//

import UIKit
import CombineCocoa
import Combine






class ViewController: UIViewController {
    
    
    @IBOutlet var navToNumbersBtn: UIButton!
    
    var subscriptions = Set<AnyCancellable>()
    @IBOutlet var navToNumberrsSwiftUI: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navToNumbersBtn
            .tapPublisher
            .sink(receiveValue: {
                print(#fileID, #function, #line)
                
                // 화면 이동
               
                let numbersVC = NumbersViewController.instantiate("Numbers")
                self.navigationController?.pushViewController(numbersVC, animated: true)
                
        })
        .store(in: &subscriptions)
        
        
        navToNumberrsSwiftUI
            .tapPublisher
            .sink(receiveValue: {
//                let numbersSwiftUIvc = NumbersSwiftUIViewContainerVC()
//                let numbersSwiftUIvc = SwiftUIContainerVC(swiftUiView: NumbersView())
//                let numbersSwiftUIvc = NumbersView.getContainerVC()
                let numbersSwiftUIvc = NumbersView().getContainerVC()
                self.navigationController?.pushViewController(numbersSwiftUIvc, animated: true)
            })
            .store(in: &subscriptions)
        
        
    }
    


}

