//
//  OnboardingViewModel.swift
//  Bankey
//
//  Created by Ammar Al Aranji on 12/14/22.
//

import Foundation
import UIKit

struct OnboardingViewModel {
    let title: String
    let imageName: String

    var image: UIImage? {
        return UIImage(named: imageName)
    }
}
