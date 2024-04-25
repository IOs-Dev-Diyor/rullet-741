//
//  FirstViewController.swift
//  TabTc
//
//  Created by mac on 08/10/21.
//

import UIKit

class VC1: UIViewController {
    
    let vC1Data = TabBar1Data.TabBar1GetData()
    
    let backImageV = CustomBackImageView()
    
    var collectionView: UICollectionView!
    
    let imageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "VC1image")
        return image
    }()
    
    let titleLbl: UILabel = {
       let label = UILabel()
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Inside the Mind\nof a Croupier: Insights\nfrom the Casino Floor".uppercased()
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
        
        collectionView.register(VC1CollectionViewCell.self, forCellWithReuseIdentifier: VC1CollectionViewCell.identifier)
        
 }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: Const.wd/1.8),
            imageView.heightAnchor.constraint(equalToConstant: Const.wd/1.8),
        ])

        NSLayoutConstraint.activate([
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
        
        layout.itemSize = CGSize(width: (view.frame.width - 40)/2, height:  (view.frame.width - 40)/2 + 20)
        layout.sectionInset = UIEdgeInsets(top: 90, left: 15, bottom: 50, right: 15)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.showsVerticalScrollIndicator = false
    }
    
    
    
}

extension VC1: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vC1Data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let obj = vC1Data[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VC1CollectionViewCell.identifier, for: indexPath) as! VC1CollectionViewCell
        cell.initData(obj: obj)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let vc = VC1Info()
        vc.descData = vC1Data[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
   
}

