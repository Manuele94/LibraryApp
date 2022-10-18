//
//  CustomTableViewCell.swift
//  LibraryApp
//
//  Created by Emmanuele Montagna on 18/10/22.
//

import Foundation
import UIKit

class CustomTableviewCell : UITableViewCell{
    static let identifier = "CustomTableviewCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let videoUIImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(videoUIImageView)
        contentView.addSubview(titleLabel)
        
        applyConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyConstraints() {
        let videoUIImageViewConstraints = [
            videoUIImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            videoUIImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            videoUIImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            videoUIImageView.widthAnchor.constraint(equalToConstant: 125)
        ]
        
        
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: videoUIImageView.trailingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ]
        
        
        NSLayoutConstraint.activate(videoUIImageViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
    }
    
    public func configure(with model: YTItem) {
        guard let url = URL(string: model.snippet.thumbnails.thumbnailsDefault.url) else {
            return
        }
        videoUIImageView.sd_setImage(with: url, completed: nil)
        titleLabel.text = model.snippet.title
    }
    
}
