//
//  TabItemCollectionViewCell.swift
//  MYTabBarDemo
//
//  Created by Abhishek Thapliyal on 25/05/20.
//  Copyright © 2020 Abhishek Thapliyal. All rights reserved.
//

import UIKit

protocol StackItemViewDelegate: class {
    func handleTap(_ view: StackItemView)
}

class StackItemView: UIView {
    
    //MARK:- IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var highlightView: UIView!
    
    //MARK:- Properties
    private let higlightBGColor = hexStringToUIColor(hex: "#7F3363")
    
    static var newInstance: StackItemView {
        return Bundle.main.loadNibNamed(
            StackItemView.className(),
            owner: nil,
            options: nil
        )?.first as! StackItemView
    }
    
    weak var delegate: StackItemViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addTapGesture()
    }
    
    var isSelected: Bool = false {
        willSet {
            self.updateUI(isSelected: newValue)
        }
    }
    
    var item: Any? {
        didSet {
            self.configure(self.item)
        }
    }
    
    private func configure(_ item: Any?) {
        guard let model = item as? TabStackItemModel else { return }
        self.titleLabel.text = model.title
        self.imgView.image = UIImage(named: model.image)!.withRenderingMode(.alwaysTemplate)
        self.isSelected = model.isSelected
    }
    
    private func updateUI(isSelected: Bool) {
        
        DispatchQueue.main.async {
            self.highlightView.layer.cornerRadius = self.highlightView.frame.height / 2
        }
        
        guard let model = item as? TabStackItemModel else { return }
        model.isSelected = isSelected
        let options: UIView.AnimationOptions = isSelected ? [.curveEaseIn] : [.curveEaseOut]
        let imgColor = isSelected ? hexStringToUIColor(hex: "#FF2600") : hexStringToUIColor(hex: "#929292")
        self.imgView.tintColor = imgColor
        
        UIView.animate(withDuration: 0.4,
                       delay: 0.0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.5,
                       options: options,
                       animations: {
                        
            self.titleLabel.textColor = UIColor.red
                        self.titleLabel.text = isSelected ? model.title : ""
                        let color = isSelected ? self.higlightBGColor : #colorLiteral(red: 0.07843137255, green: 0.1176470588, blue: 0.1607843137, alpha: 1)
                        self.highlightView.backgroundColor = color
                        (self.superview as? UIStackView)?.layoutIfNeeded()
                       }, completion: nil)
    }
    
}

extension StackItemView {
    
    func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(handleGesture(_:)))
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc
    func handleGesture(_ sender: UITapGestureRecognizer) {
        self.delegate?.handleTap(self)
    }
    
}


public extension NSObject {
    
    class func className() -> String {
        let className = (NSStringFromClass(self) as String).components(separatedBy: ".").last! as String
        return className
    }
    
    func className() -> String {
        let className = (NSStringFromClass(self.classForCoder) as String).components(separatedBy: ".").last! as String
        return className
    }
    
}

func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return #colorLiteral(red: 0.07843137255, green: 0.1176470588, blue: 0.1607843137, alpha: 1)
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
