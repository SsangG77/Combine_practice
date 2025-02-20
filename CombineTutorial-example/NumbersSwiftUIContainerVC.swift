//
//  NumbersSwiftUIContainerVC.swift
//  CombineTutorial-example
//
//  Created by 차상진 on 2/19/25.
//

import Foundation
import UIKit
import SwiftUI



class SwiftUIContainerVC<SwiftUIView: View> : UIViewController {
    
    
    
    let swiftUIView: SwiftUIView
    
    
    init(swiftUiView: SwiftUIView) {
        self.swiftUIView = swiftUiView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.configureHostingVC()
        
        
    }
    
    
    fileprivate func configureHostingVC() {
        let hostingVC = UIHostingController(rootView: swiftUIView)
        hostingVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.addChild(hostingVC)
        self.view.addSubview(hostingVC.view)
        hostingVC.didMove(toParent: self)
        NSLayoutConstraint.activate([
            hostingVC.view.topAnchor.constraint(equalTo: self.view.topAnchor),
            hostingVC.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            hostingVC.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            hostingVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    
}





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
        NSLayoutConstraint.activate([
            hostingVC.view.topAnchor.constraint(equalTo: self.view.topAnchor),
            hostingVC.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            hostingVC.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            hostingVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    
}






struct NumbersView: View {
    
    @State var input: String = ""
    
    @StateObject var viewModel = NumbersVM()
    
    var body: some View {
        VStack(alignment: .trailing) {
            TextField("",text: $viewModel.number1)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("",text: $viewModel.number2)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("",text: $viewModel.number3)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Divider()
            
            Text($viewModel.resultValue.wrappedValue)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
        }
        .padding()
        .background(.green)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
//    static func getContainerVC() -> UIViewController {
//        SwiftUIContainerVC(swiftUiView: Self())
//    }
    
}

extension View {
    func getContainerVC() -> UIViewController {
        SwiftUIContainerVC(swiftUiView: self)
    }
}


#Preview {
    NumbersView()
}
