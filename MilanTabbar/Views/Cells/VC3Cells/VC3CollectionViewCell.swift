//
//  VC3CollectionViewCell.swift
//  Roulette741
//
//  Created by Diyorbek Xikmatullayev on 18/04/24.
//

import UIKit

class VC3CollectionViewCell: UICollectionViewCell {
    
    
    static let identifier = "VC3CollectionViewCell"
    
    let imageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customBlack.withAlphaComponent(0.8)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLbl: UILabel = {
       let label = UILabel()
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 3
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let nextIcon: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "next")
        return image
    }()

    let triangleView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentViewAppearance()
        createBackImage(triangleColor: UIColor.customRed)
        addSubView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2),
            
            backView.topAnchor.constraint(equalTo: imageView.topAnchor),
            backView.leftAnchor.constraint(equalTo: imageView.leftAnchor),
            backView.rightAnchor.constraint(equalTo: imageView.rightAnchor),
            backView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
            
            nextIcon.rightAnchor.constraint(equalTo: imageView.rightAnchor, constant: -5),
            nextIcon.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -5),
            nextIcon.widthAnchor.constraint(equalToConstant: 40),
            nextIcon.heightAnchor.constraint(equalToConstant: 30),
            
            titleLbl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLbl.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            titleLbl.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            titleLbl.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    func addSubView() {
        contentView.addSubview(imageView)
        contentView.addSubview(backView)
        contentView.addSubview(titleLbl)
        contentView.addSubview(triangleView)
        contentView.addSubview(nextIcon)
    }
    
    func contentViewAppearance() {
        contentView.layer.masksToBounds = true
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.customRed.cgColor
    }
    
    func createBackImage(triangleColor: UIColor) {
       
       let path = UIBezierPath()
        path.move(to: CGPoint(x: contentView.frame.width - 100, y: contentView.frame.height))
       path.addLine(to: CGPoint(x: contentView.frame.width, y: contentView.frame.height)) // B nuqta
       path.addLine(to: CGPoint(x: contentView.frame.width, y: contentView.frame.height - 80)) // C nuqta
       path.close()

       let shapeLayer = CAShapeLayer()
       shapeLayer.path = path.cgPath
       shapeLayer.fillColor = triangleColor.cgColor

       triangleView.layer.addSublayer(shapeLayer)
       triangleView.frame = CGRect(x: 0, y: 0, width: 100, height: 80)
   }
    
    public func initData(obj: TabBar3Data) {
        imageView.image = UIImage(named: obj.imageName)
        titleLbl.text = obj.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
