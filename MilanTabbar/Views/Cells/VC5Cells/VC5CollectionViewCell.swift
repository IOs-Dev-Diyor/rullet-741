//
//  VC5Cell.swift
//  Roulette741
//
//  Created by Diyorbek Xikmatullayev on 19/04/24.
//

import UIKit

class VC5CollectionViewCell: UICollectionViewCell {
    static let identifier = "VC5CollectionViewCell"

    let triangleView = UIView()
    
    let cell5BackImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customBlack.withAlphaComponent(0.6)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLbl: UILabel = {
       let label = UILabel()
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "GillSans-Bold", size: 15)
        label.numberOfLines = 2
        label.textColor = UIColor.white
        label.textAlignment = .left
        return label
    }()
    
    let levelLbl: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.textAlignment = .left
        return label
    }()
    
    let nextIcon: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "next")
        return image
    }()
    
    let cardIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createBackImage(triangleColor: UIColor.customRed)
        addSubView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//
        NSLayoutConstraint.activate([
            cell5BackImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            cell5BackImage.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            cell5BackImage.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            cell5BackImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            backView.topAnchor.constraint(equalTo: cell5BackImage.topAnchor),
            backView.leftAnchor.constraint(equalTo: cell5BackImage.leftAnchor),
            backView.rightAnchor.constraint(equalTo: cell5BackImage.rightAnchor),
            backView.bottomAnchor.constraint(equalTo: cell5BackImage.bottomAnchor),
         
            nextIcon.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -5),
            nextIcon.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -5),
            nextIcon.widthAnchor.constraint(equalToConstant: 40),
            nextIcon.heightAnchor.constraint(equalToConstant: 30),
            
            levelLbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -13),
            levelLbl.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            levelLbl.heightAnchor.constraint(equalToConstant: 20),
            cell5BackImage.widthAnchor.constraint(equalToConstant: contentView.frame.width - 110),
            
            titleLbl.bottomAnchor.constraint(equalTo: levelLbl.topAnchor, constant: -5),
            titleLbl.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            titleLbl.widthAnchor.constraint(equalToConstant: contentView.frame.width/2),
            titleLbl.heightAnchor.constraint(equalToConstant: 45),
            
            cardIcon.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardIcon.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            cardIcon.widthAnchor.constraint(equalToConstant: 202),
            cardIcon.heightAnchor.constraint(equalToConstant: 202),
            
            
        ])
//        backView.frame = cell2DescIcon.bounds
        
    }
    
    func addSubView() {
        contentView.addSubview(cell5BackImage)
        contentView.addSubview(backView)
        contentView.addSubview(titleLbl)
        contentView.addSubview(levelLbl)
        contentView.addSubview(triangleView)
        contentView.addSubview(nextIcon)
        contentView.addSubview(cardIcon)
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
    
    func initData(obj: TabBar5Data) {
        cell5BackImage.image = UIImage(named: obj.backImageName)
        levelLbl.text = obj.level
        titleLbl.text = obj.title.uppercased()
        cardIcon.image = UIImage(named: obj.cardIcon)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
