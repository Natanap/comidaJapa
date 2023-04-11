//
//  FirstTableViewCell.swift
//  comidaJapa
//
//  Created by Natanael Alves Pereira on 11/04/23.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    static let identifier = "FirstTableViewCell"
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubViews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubViews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(image)
    }
    
    private func setUpData() {
    
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            image.widthAnchor.constraint(equalToConstant: 50),
            image.heightAnchor.constraint(equalToConstant: 50),
            
            nameLabel.topAnchor.constraint(equalTo: image.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 40),
        ])
        
    }
    
    
}
