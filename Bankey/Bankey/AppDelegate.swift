//
//  AppDelegate.swift
//  Bankey
//
//  Created by Ammar Al Aranji on 10/7/22.
//

import UIKit

let appColor: UIColor = .systemRed

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let onboardingContainerViewController = OnboardingContainerViewController()
    let loginViewController = LoginViewController()
    let dummyLogoutViewController = DummyViewController()
    let mainViewController = MainViewController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground

        onboardingContainerViewController.delegate = self
        loginViewController.delegate = self
        dummyLogoutViewController.delegate = self

        window?.rootViewController = mainViewController
        return true
    }
}

// MARK: - Transitions
extension AppDelegate {
    private func setRootViewController(with vc: UIViewController, animated: Bool = true) {
        guard animated, let window = window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }

        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(
            with: window,
            duration: 0.3,
            options: .transitionFlipFromLeft,
            animations: nil,
            completion: nil)
    }
}

// MARK: - Onboarding Delegate
extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        LocalState.hasOnboarded = true
        setRootViewController(with: dummyLogoutViewController)
    }
}

// MARK: - Login Delegate
extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        if LocalState.hasOnboarded {
            setRootViewController(with: dummyLogoutViewController)
        } else {
            setRootViewController(with: onboardingContainerViewController)
        }
    }
}

extension AppDelegate: LogoutDelegate {
    func didLogout() {
        setRootViewController(with: loginViewController)
    }
}
