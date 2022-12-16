//
//  UIViewController+Utils.swift
//  Bankey
//
//  Created by Ammar Al Aranji on 12/16/22.
//

import UIKit

extension UIViewController {

    func setTabBarItem(withImage name: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let tabImage = UIImage(systemName: name, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: tabImage, tag: 0)
    }

    func setStatusBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithTransparentBackground()
        navBarAppearance.backgroundColor = appColor
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    }
}
