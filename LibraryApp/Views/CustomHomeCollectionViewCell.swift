//
//  CustomHomeCollectionViewCell.swift
//  LibraryApp
//
//  Created by Emmanuele Montagna on 16/10/22.
//

import UIKit
import SDWebImage



class CustomHomeCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomHomeCollectionViewCell"
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(posterImageView)
        
        applyConstraints()

    }
    private func applyConstraints() {
        
        let posterImageViewConstr = [
            posterImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            posterImageView.centerYAnchor.constraint(equalTo: contentView.topAnchor, constant: 75),
            posterImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            posterImageView.heightAnchor.constraint(equalToConstant: 150)

        ]
        
        let titleLabelConstraints = [
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: posterImageView.bottomAnchor,constant: 10),
            titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 15),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 5),

        ]
        
        let descriptionLabelConstraints = [
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 5),
            descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 5),
            descriptionLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 15)
        ]
        
        let priceLabelConstraints = [
            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor,constant: 5),
            priceLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 5),
            priceLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            priceLabel.heightAnchor.constraint(equalToConstant: 15)
        ]

        
        NSLayoutConstraint.activate(posterImageViewConstr)
        NSLayoutConstraint.activate(descriptionLabelConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(priceLabelConstraints)
    }
    
    override func layoutSubviews() {
   //     titleLabel.frame        = CGRect(x: 0, y: contentView.frame.size.width/2+10,  width: contentView.frame.size.width/2, height: contentView.frame.size.height)
   //     descriptionLabel.frame  = CGRect(x: 0, y: contentView.frame.size.width/2+10, width: contentView.frame.size.width/2, height: contentView.frame.size.height)
   //     priceLabel.frame        = CGRect(x: 0, y: contentView.frame.size.width/2+10, width: contentView.frame.size.width/2, height: contentView.frame.size.height)
   //     posterImageView.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width/2, height: contentView.frame.size.height/2)
        
    }
    
    public func configure(with model: ProductResponse) {
        
        guard let url = URL(string: model.image) else {
            return
        }
        posterImageView.sd_setImage(with: url, completed: nil)
        titleLabel.text         = model.title
        descriptionLabel.text   = model.welcomeDescription
        priceLabel.text         = model.price.toString() + " EUR"
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


