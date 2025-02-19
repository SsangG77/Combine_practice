//
//  UIViewController+Ext.swift
//  CombineTutorial-example
//
//  Created by 차상진 on 2/19/25.
//

import Foundation
import UIKit


protocol StoryBoarded {
    static func instantiate(_ storyboard: String) -> Self
}

extension StoryBoarded where Self: UIViewController {
    static func instantiate(_ storyboard: String) -> Self {
       
        let storyBoard = UIStoryboard(name: storyboard, bundle: Bundle.main)
        let VC = storyBoard.instantiateViewController(withIdentifier: String(describing: self)) as! Self
        
        return VC
    }
}

extension UIViewController : StoryBoarded {}
