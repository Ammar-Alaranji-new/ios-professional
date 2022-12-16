//
//  MainViewController.swift
//  Bankey
//
//  Created by Ammar Al Aranji on 12/16/22.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupTapBar()
    }

    private func setupViews() {
        let summaryViewController = SummaryViewController()
        let moveViewController = MoveMoneyViewController()
        let moreViewCOntroller = MoreViewController()

        summaryViewController.setTabBarItem(withImage: "list.dash.header.rectangle", title: "Summary")
        moveViewController.setTabBarItem(withImage: "arrow.left.arrow.right", title: "Move Money")
        moreViewCOntroller.setTabBarItem(withImage: "ellipsis.circle", title: "More")

        let summaryNavController = UINavigationController(rootViewController: summaryViewController)
        let moveMoneyNavContrller = UINavigationController(rootViewController: moveViewController)
        let moreNavController = UINavigationController(rootViewController: moreViewCOntroller)

        viewControllers = [summaryNavController, moveMoneyNavContrller, moreNavController]
        selectedIndex = 1
    }

    private func setupTapBar() {
        tabBar.tintColor = appColor
        tabBar.isTranslucent = false
        setStatusBar()
    }
}

class SummaryViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}

class MoveMoneyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}

class MoreViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
    }
}

