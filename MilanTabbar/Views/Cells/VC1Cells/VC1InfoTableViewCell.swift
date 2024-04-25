

import UIKit

class VC1InfoTableViewCell: UITableViewCell {
    
    static let identifier = "VC1InfoTableViewCell"
    
    let descImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let titleLbl: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        label.textColor = UIColor.white
        label.textAlignment = .left
        return label
    }()
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = UIColor.customBlack
        textView.layer.borderColor = UIColor.customRed.cgColor
        textView.layer.borderWidth = 1
        textView.textColor = .white
        textView.isEditable = false
        textView.font = .systemFont(ofSize: 14)
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        textView.isScrollEnabled = false
        return textView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(descImage)
        contentView.addSubview(titleLbl)
        contentView.addSubview(textView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            descImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            descImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            descImage.heightAnchor.constraint(equalToConstant: 240),
            
            titleLbl.topAnchor.constraint(equalTo: descImage.bottomAnchor, constant: 10),
            titleLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            titleLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            titleLbl.heightAnchor.constraint(equalToConstant: 50),
            
            textView.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 7),
            textView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 7),
            textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -7),
            textView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7),
        ])
    }
    
    func initData(obj: TabBar1Data) {
        descImage.image = UIImage(named: obj.imageName)
        titleLbl.text = obj.title.uppercased()
        textView.text = obj.desc
    }
    
    func initDataForCell2Info(obj: TabBar2Data) {
        descImage.image = UIImage(named: obj.descImageName)
        titleLbl.text = obj.title.uppercased()
        textView.text = obj.desc
    }
}
