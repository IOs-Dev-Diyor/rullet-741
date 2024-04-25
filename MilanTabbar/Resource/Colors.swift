//
//  Colors.swift
//  Roulette741
//
//  Created by Diyorbek Xikmatullayev on 16/04/24.
//

import Foundation
import UIKit
extension UIColor {
    static var customDarkPurpe: UIColor {
        #colorLiteral(red: 0.7973122001, green: 0.2318383753, blue: 1, alpha: 1)
    }
    static var customRed: UIColor {
        #colorLiteral(red: 1, green: 0.2729154161, blue: 0.3333333333, alpha: 1)
    }
    static var customBlack: UIColor {
        #colorLiteral(red: 0.07843137255, green: 0.1176470588, blue: 0.1607843137, alpha: 1)
    }
}

class Colors {
//    let color1 = UIColor(red: 255.0/255.0, green: 134.0/255.0, blue: 46.0/255.0, alpha: 1.0)
    let color1 = #colorLiteral(red: 1, green: 0.5254901961, blue: 0.1803921569, alpha: 1)
  let color2 = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
    let color3 = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    let color4 = UIColor(red: 255.0/255.0, green: 131.0/255.0, blue: 41.0/255.0, alpha: 1.0)

    var gradientLayer: CAGradientLayer = CAGradientLayer()

  init() {
//      gradientLayer = CAGradientLayer()
      gradientLayer.colors = [ color1, color2]
      gradientLayer.locations = [ 0.0, 1.0]
  }
}
