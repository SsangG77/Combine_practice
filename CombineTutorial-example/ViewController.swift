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
        
    }
    


}

