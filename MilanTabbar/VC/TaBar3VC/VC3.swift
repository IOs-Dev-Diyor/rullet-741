//
//  ThirdViewController.swift
//  TabTc
//
//  Created by mac on 08/10/21.
//

import UIKit

class VC3: UIViewController {

    let vC3Data = TabBar3Data.TabBar3GetData()
    
    let backImageV = CustomBackImageView()
    
    var collectionView: UICollectionView!
    
    let imageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "VC3image")
        return image
    }()
    
    let titleLbl: UILabel = {
       let label = UILabel()
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Maximizing Your\nRoulette Experience:\nEssential Tips & Tricks".uppercased()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 3
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.customBlack
        backImageV.createBackImage(view: view, named: "back1", triangleColor: UIColor.customRed)
        createCollectionView()
        addSubView()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(VC3CollectionViewCell.self, forCellWithReuseIdentifier: VC3CollectionViewCell.identifier)
        
 }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            imageView.heightAnchor.constraint(equalToConstant: 175),
            
            collectionView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            titleLbl.topAnchor.constraint(equalTo: collectionView.topAnchor),
            titleLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            titleLbl.widthAnchor.constraint(equalToConstant: view.frame.width - 35),
            titleLbl.heightAnchor.constraint(equalToConstant: 80),
            
        ])
     
    }
    
    func addSubView() {
        view.addSubview(imageView)
        view.addSubview(collectionView)
        collectionView.addSubview(titleLbl)
    }
    
    func createCollectionView()  {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        layout.itemSize = CGSize(width: (view.frame.width - 42)/2, height:  view.frame.width*2/3)
        layout.sectionInset = UIEdgeInsets(top: 90, left: 15, bottom: 50, right: 15)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.showsVerticalScrollIndicator = false
    }
    
}

extension VC3: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vC3Data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let obj = vC3Data[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VC3CollectionViewCell.identifier, for: indexPath) as! VC3CollectionViewCell
        cell.initData(obj: obj)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(view.frame.width*2/3.4)
        collectionView.deselectItem(at: indexPath, animated: true)
        let vc = VC3Info()
        vc.descData = vC3Data[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
   
}

