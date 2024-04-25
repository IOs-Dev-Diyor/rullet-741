//
//  VC2CollectionViewCell.swift
//  Roulette741
//
//  Created by Diyorbek Xikmatullayev on 17/04/24.
//

import UIKit

class VC2CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "VC2CollectionViewCell"

    let triangleView = UIView()
    
    let cell2DescIcon: UIImageView = {
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
    
    let readLbl: UILabel = {
       let label = UILabel()
        label.backgroundColor = .clear
        label.text = "Read"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13, weight: .bold)
        label.textColor = UIColor.white
        label.textAlignment = .center
        return label
    }()
    
    let cell2DescTitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = UIColor.white
        label.textAlignment = .left
        return label
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
            cell2DescIcon.topAnchor.constraint(equalTo: contentView.topAnchor),
            cell2DescIcon.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            cell2DescIcon.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            cell2DescIcon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            backView.topAnchor.constraint(equalTo: cell2DescIcon.topAnchor),
            backView.leftAnchor.constraint(equalTo: cell2DescIcon.leftAnchor),
            backView.rightAnchor.constraint(equalTo: cell2DescIcon.rightAnchor),
            backView.bottomAnchor.constraint(equalTo: cell2DescIcon.bottomAnchor),
         
            readLbl.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -5),
            readLbl.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -5),
            readLbl.widthAnchor.constraint(equalToConstant: 40),
            readLbl.heightAnchor.constraint(equalToConstant: 30),
            
            cell2DescTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            cell2DescTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            cell2DescTitle.heightAnchor.constraint(equalToConstant: 20),
            cell2DescIcon.widthAnchor.constraint(equalToConstant: contentView.frame.width - 110)
        ])
//        backView.frame = cell2DescIcon.bounds
        
    }
    
    func addSubView() {
        contentView.addSubview(cell2DescIcon)
        contentView.addSubview(backView)
        contentView.addSubview(cell2DescTitle)
        contentView.addSubview(triangleView)
        contentView.addSubview(readLbl)
    }
    
     func createBackImage(triangleColor: UIColor) {
        
        let path = UIBezierPath()
         path.move(to: CGPoint(x: contentView.frame.width - 100, y: contentView.frame.height))
        path.addLine(to: CGPoint(x: contentView.frame.width, y: contentView.frame.height)) // B nuqta
        path.addLine(to: CGPoint(x: contentView.frame.width, y: contentView.frame.height - 50)) // C nuqta
        path.close()

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = triangleColor.cgColor

        triangleView.layer.addSublayer(shapeLayer)
        triangleView.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        
        
    }
    
    func initData(obj: TabBar2Data) {
        cell2DescIcon.image = UIImage(named: obj.imageNamed)
        cell2DescTitle.text = obj.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
