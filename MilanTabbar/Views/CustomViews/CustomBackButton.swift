//
//  CustomBackButton.swift
//  Roulette741
//
//  Created by Diyorbek Xikmatullayev on 20/04/24.
//

import Foundation
import UIKit

class CustomBackButton {
    var button = UIButton()

    open func createButton(view: UIView) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleToFill
        button.setImage(UIImage(named: "pop"), for: .normal)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -3),
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            button.widthAnchor.constraint(equalToConstant: 25),
            button.heightAnchor.constraint(equalToConstant: 25)
        ])
    }

}
