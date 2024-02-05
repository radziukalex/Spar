//
//  ProductViewController.swift
//  Spar
//
//  Created by Admin on 31.01.2024.
//

import UIKit

class ProductViewController: UIViewController {
    
    private let productCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let ratingTitle = "4.1"
    private let ratingCount = "19 отзывов"
    
    var reviewModels: [ReviewModel] = [
        ReviewModel(name: "Александр В.", date: "7 мая 2021", text: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими"),
        ReviewModel(name: "Александр C.", date: "7 мая 2021", text: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими"),
        ReviewModel(name: "Александр Г.", date: "7 мая 2021", text: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими")
    ]
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemBackground
        return scrollView
    }()
    
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .systemBackground
        return contentView
    }()
    
    private let productMainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let productCardPrice: UIButton = {
        let button = UIButton()
        button.setTitle("Цена по карте", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 6
        return button
    }()
    
    private let productName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = .clear
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.numberOfLines = 2
        label.text = "Добавка \"Липа\" к чаю, 200 г."
        return label
    }()
    
    private let productRating: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "star.fill"), for: .normal)
        button.tintColor = .systemYellow
        return button
    }()
    
    private let productCountryFlag: UIImageView  = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "spain")
        return imageView
    }()
    
    private let productCountryName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 1
        label.text = "Испания, Риоха"
        return label
    }()
    
    private let productDescriptionTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = .clear
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 1
        label.text = "Описание"
        return label
    }()
    
    private let productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 6
        label.text = "Флавоноиды липового цвета обладают противовоспалительным действием, способствуют укреплению стенки сосудов."
        return label
    }()
    
    private let productCharacteristicTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = .clear
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 1
        label.text = "Основные характеристики"
        return label
    }()
    
    private let productCharacteristicText: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 6
        label.text = "Флавоноиды липового цвета обладают противовоспалительным действием, способствуют укреплению стенки сосудов."
        return label
    }()
    
    private let reviewsLabel: UILabel = {
        let label = UILabel()
        label.text = "Отзывы"
        label.textColor = .black
        label.backgroundColor = .clear
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 1
        return label
    }()
    
    private let reviewsButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.systemGreen, for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    private let reviewRequest: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(.systemGreen, for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 17
        button.layer.borderColor = UIColor.systemGreen.cgColor
        button.layer.borderWidth = 2
        button.setTitle("Оставить отзыв", for: .normal)
        return button
    }()
    
    private let counterLabel: UILabel = {
        let label = UILabel()
        label.text = "mdksal"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupUI()
        setupCollectionView()
    }

}

extension ProductViewController {
  
    private func setupNavBar() {
        self.navigationController?.navigationBar.backgroundColor = .systemBackground
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: nil, action: nil)
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: nil, action: nil),
            UIBarButtonItem(image: UIImage(systemName:"square.and.arrow.up"), style: .plain, target: nil, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "list.bullet.rectangle.portrait"), style: .plain, target: nil, action: nil)
        ]
    }
    
    private func setupScrollView(scrollView: UIScrollView, contentView: UIView) {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        let heightConst = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        heightConst.isActive = true
        heightConst.priority = UILayoutPriority(50)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 1.2).isActive = true
    }
    
    private func setupProductMainImageUI(image: UIImageView) {
        view.addSubview(image)
        image.image = UIImage(named: "lipa")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        image.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        image.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: 360).isActive = true
    }
    
    private func setupProductNameUI(name: UILabel) {
        view.addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.topAnchor.constraint(equalTo: productMainImage.bottomAnchor, constant: 20).isActive = true
        name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }
    
    private func setupProductCountryFlagUI(image: UIImageView) {
        view.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        image.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 20).isActive = true
        image.heightAnchor.constraint(equalToConstant: 25).isActive = true
        image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -345).isActive = true
    }
    
    private func setupProductRatingUI(button: UIButton) {
        productMainImage.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leftAnchor.constraint(equalTo: productMainImage.leftAnchor, constant: 10).isActive = true
        button.bottomAnchor.constraint(equalTo: productMainImage.bottomAnchor).isActive = true
        button.setTitle(ratingTitle + " | " + ratingCount, for: .normal)
        button.setTitleColor( .systemGray2, for: .normal)
    }
    
    private func setupProductCountryNameUI(country: UILabel) {
        view.addSubview(country)
        country.translatesAutoresizingMaskIntoConstraints = false
        country.leadingAnchor.constraint(equalTo: productCountryFlag.trailingAnchor, constant: 1).isActive = true
        country.topAnchor.constraint(equalTo: productCountryFlag.topAnchor).isActive = true
        country.bottomAnchor.constraint(equalTo: productCountryFlag.bottomAnchor).isActive = true
    }
    
    private func setupProductDescriptionTitleUI(title: UILabel) {
        view.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: productCountryName.bottomAnchor, constant: 30).isActive = true
        title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }
    
    private func setupProductDescriptionLabelUI(label: UILabel) {
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: productDescriptionTitle.bottomAnchor, constant: 15).isActive = true
        label.leadingAnchor.constraint(equalTo: productDescriptionTitle.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: productDescriptionTitle.trailingAnchor).isActive = true
    }
    
    private func setupProductCharacteristicTitleUI(title: UILabel) {
        view.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: productDescriptionLabel.bottomAnchor, constant: 30).isActive = true
        title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }
    
    private func setupProductCharacteristicTextUI(text: UILabel) {
        view.addSubview(text)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.topAnchor.constraint(equalTo: productCharacteristicTitle.bottomAnchor, constant: 15).isActive = true
        text.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        text.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }
    
    private func setupProductCardPriceUI(button: UIButton) {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: productMainImage.topAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private func setupReviewsLabelUI(label: UILabel) {
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: productCharacteristicText.bottomAnchor, constant: 30).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func setupReviewsButtonUI(button: UIButton) {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: reviewsLabel.topAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        button.setTitle("Все \(reviewModels.count)", for: .normal)
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func setupReviewRequestUI(button: UIButton) {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: reviewsLabel.bottomAnchor, constant: 180).isActive = true
        button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        button.heightAnchor.constraint(equalToConstant: 34).isActive = true
    }
    
    private func setupUI() {
        setupScrollView(scrollView: scrollView, contentView: contentView)
        setupProductMainImageUI(image: productMainImage)
        setupProductNameUI(name: productName)
        setupProductCountryFlagUI(image: productCountryFlag)
        setupProductRatingUI(button: productRating)
        setupProductCountryNameUI(country: productCountryName)
        setupProductDescriptionTitleUI(title: productDescriptionTitle)
        setupProductDescriptionLabelUI(label: productDescriptionLabel)
        setupProductCharacteristicTitleUI(title: productCharacteristicTitle)
        setupProductCharacteristicTextUI(text: productCharacteristicText)
        setupProductCardPriceUI(button: productCardPrice)
        setupReviewsLabelUI(label: reviewsLabel)
        setupReviewsButtonUI(button: reviewsButton)
        setupReviewRequestUI(button: reviewRequest)
    }
}

extension ProductViewController {
    private func setupCollectionView() {
        view.addSubview(productCollectionView)
        productCollectionView.contentInsetAdjustmentBehavior = .never
        productCollectionView.showsHorizontalScrollIndicator = false
        productCollectionView.showsVerticalScrollIndicator = false
        productCollectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        productCollectionView.dataSource = self
        productCollectionView.delegate = self
        productCollectionView.backgroundColor = .systemBackground
        productCollectionView.translatesAutoresizingMaskIntoConstraints = false
        productCollectionView.topAnchor.constraint(equalTo: reviewsLabel.bottomAnchor, constant: 10).isActive = true
        productCollectionView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        productCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        productCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        let layout = productCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10.0
        layout.minimumInteritemSpacing = 10.0
    }
}

extension ProductViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.reviewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCollectionViewCell
        let item = self.reviewModels[indexPath.row]
        cell.configure(model: item)
        return cell
    }
}

extension ProductViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat(200), height: CGFloat(150))
    }
}
