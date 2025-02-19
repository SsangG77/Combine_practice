//
//  NumbersSwiftUIContainerVC.swift
//  CombineTutorial-example
//
//  Created by 차상진 on 2/19/25.
//

import Foundation
import UIKit
import SwiftUI


class NumbersSwiftUIViewContainerVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        self.configureHostingVC()
        
        
    }
    
    
    fileprivate func configureHostingVC() {
        let hostingVC = UIHostingController(rootView: NumbersView())
        hostingVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.addChild(hostingVC)
        self.view.addSubview(hostingVC.view)
        hostingVC.didMove(toParent: self)
        
    }
    
    
}



struct NumbersView: View {
    
    @State var input: String = ""
    
    
    var body: some View {
        VStack(alignment: .trailing) {
            TextField("",text: $input)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("",text: $input)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("",text: $input)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("",text: $input)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Divider()
            
            Text("Total")
                .fontWeight(.bold)
                .foregroundColor(.white)
            
        }
        .padding()
        .background(Color.green)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}


#Preview {
    NumbersView()
}
