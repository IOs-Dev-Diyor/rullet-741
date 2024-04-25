//
//  VC1CollectionViewCell.swift
//  Roulette741
//
//  Created by Diyorbek Xikmatullayev on 17/04/24.
//

import UIKit

class VC1CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "VC1CollectionViewCell"
    
    let imageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let titleLbl: UILabel = {
       let label = UILabel()
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 2
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentViewAppearance()
        addSubView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            
            titleLbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            titleLbl.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            titleLbl.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            titleLbl.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    func addSubView() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLbl)
    }
    
    func contentViewAppearance() {
        contentView.backgroundColor = UIColor.customBlack
        contentView.layer.masksToBounds = true
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.customRed.cgColor
    }
    
    public func initData(obj: TabBar1Data) {
        imageView.image = UIImage(named: obj.imageName)
        titleLbl.text = obj.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
