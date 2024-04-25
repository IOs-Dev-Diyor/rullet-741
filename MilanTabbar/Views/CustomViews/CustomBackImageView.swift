//
//  CustomBackImageView.swift
//  Roulette741
//
//  Created by Diyorbek Xikmatullayev on 17/04/24.
//

import Foundation
import UIKit

class CustomBackImageView {
    
    var backImageView: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var patnis: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var backImage: UIImageView = {
        let view = UIImageView()
//        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let triangleView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    open func createBackImage(view: UIView, named: String, triangleColor: UIColor) {
        backView.backgroundColor = UIColor.customBlack.withAlphaComponent(0.8)
        backImageView.image = UIImage(named: named)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: view.bounds.width, y: 0)) // B nuqta
        path.addLine(to: CGPoint(x: view.bounds.width, y: view.frame.height / 2)) // C nuqta
        path.close()

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = triangleColor.cgColor

        triangleView.layer.addSublayer(shapeLayer)
        triangleView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/2)
        view.addSubview(patnis)
        patnis.addSubview(backImageView)
        patnis.addSubview(backView)
        patnis.addSubview(triangleView)
        
        NSLayoutConstraint.activate([
            patnis.topAnchor.constraint(equalTo: view.topAnchor),
            patnis.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            patnis.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            patnis.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
//            backImageView.topAnchor.constraint(equalTo: view.topAnchor),
//            backImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            backImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            backImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//
            backView.topAnchor.constraint(equalTo: backImageView.topAnchor),
            backView.leadingAnchor.constraint(equalTo: backImageView.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: backImageView.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: backImageView.bottomAnchor),
        ])
        backImageView.frame = patnis.bounds
        
    }
    
}
