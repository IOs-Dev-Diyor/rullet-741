//
//  CustomShopBtn.swift
//  Roulette741
//
//  Created by Diyorbek Xikmatullayev on 22/04/24.
//

import Foundation
import UIKit

class CustomShopBtn {
    
    var backView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customBlack
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        return view
    }()
    
    var titleLbl: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "GillSans-Bold", size: 19)
        label.textColor = UIColor.white
        label.textAlignment = .center
        return label
    }()
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    var button: UIButton = {
       let button = UIButton()
        button.backgroundColor = UIColor.clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    open func createGameView(view: UIView, title: String, imageName: String) {
        imageView.image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor.white
        titleLbl.text = title
        
        view.addSubview(backView)
        backView.addSubview(titleLbl)
        backView.addSubview(imageView)
        backView.addSubview(button)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5),
            imageView.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 7),
            imageView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -5),
            imageView.heightAnchor.constraint(equalToConstant: 20),
            imageView.widthAnchor.constraint(equalToConstant: 20),
            
            titleLbl.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5),
            titleLbl.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 1),
            titleLbl.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -5),
            titleLbl.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -5),
            titleLbl.heightAnchor.constraint(equalToConstant: 24),
            
            button.topAnchor.constraint(equalTo: backView.topAnchor),
            button.leftAnchor.constraint(equalTo: backView.leftAnchor),
            button.rightAnchor.constraint(equalTo: backView.rightAnchor),
            button.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
            
        ])
        
    }
    
}

