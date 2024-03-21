//
//  UIViewController+Extensions.swift
//  SigningFlow
//
//  Created by raiaan on 21/03/2024.
//

import Foundation
import UIKit
import Photos
import SwiftMessages


extension UIViewController {
    func presentLoginScreen(){
        let vc = LoginVC()
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true) {
            self.tabBarController?.selectedIndex = 0
        }
    }
    func swiftMessage(title: String, body: String, color: Theme, layout: MessageView.Layout, style: SwiftMessages.PresentationStyle) {
        let view = MessageView.viewFromNib(layout: layout)
        view.configureTheme(color)
        view.configureDropShadow()
        view.configureContent(title: title, body: body)
        view.button?.isHidden = true
        var config = SwiftMessages.defaultConfig
        config.presentationStyle = style
        config.dimMode = .gray(interactive: true)
        config.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        config.duration = .seconds(seconds: 5)
        SwiftMessages.show(config: config, view: view)
    }
    
}
