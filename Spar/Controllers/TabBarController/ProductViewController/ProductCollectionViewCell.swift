//
//  ProductCollectionViewCell.swift
//  Spar
//
//  Created by Admin on 02.02.2024.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    var reviewsModel: ReviewModel? = nil
    
    private let reviewsName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .black
        label.backgroundColor = .clear
        return label
    }()
    
    private let reviewsDate: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .systemFill
        label.backgroundColor = .clear
        return label
    }()
    
    private let reviewsText: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .black
        label.backgroundColor = .clear
        label.numberOfLines = 0
        return label
    }()
    
    private let reviewsStars: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .clear
        image.clipsToBounds = true
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure (model: ReviewModel) {
        self.reviewsModel = model
        self.reviewsName.text = model.name
        self.reviewsDate.text = model.date
        self.reviewsText.text = model.text
    }
    
    private func setupUI() {
        contentView.addSubview(reviewsName)
        contentView.addSubview(reviewsDate)
        contentView.addSubview(reviewsStars)
        contentView.addSubview(reviewsText)
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .systemBackground
        contentView.layer.shadowColor = UIColor.systemFill.cgColor
        contentView.layer.shadowOpacity = 1.0
        contentView.layer.shadowOffset = CGSize(width: -1, height: 1)
        contentView.layer.shadowPath = UIBezierPath(rect: contentView.bounds).cgPath
        
        reviewsName.translatesAutoresizingMaskIntoConstraints = false
        reviewsName.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        reviewsName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10).isActive = true
        reviewsName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        reviewsName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        reviewsDate.translatesAutoresizingMaskIntoConstraints = false
        reviewsDate.topAnchor.constraint(equalTo: reviewsName.bottomAnchor).isActive = true
        reviewsDate.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        reviewsDate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        reviewsDate.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        reviewsStars.translatesAutoresizingMaskIntoConstraints = false
        reviewsStars.image = UIImage(systemName: "star")
        reviewsStars.topAnchor.constraint(equalTo: reviewsDate.bottomAnchor, constant: 5).isActive = true
        reviewsStars.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        reviewsStars.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -170).isActive = true
        reviewsStars.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        reviewsText.translatesAutoresizingMaskIntoConstraints = false
        reviewsText.topAnchor.constraint(equalTo: reviewsStars.bottomAnchor, constant: 5).isActive = true
        reviewsText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        reviewsText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        reviewsText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
    }
}
