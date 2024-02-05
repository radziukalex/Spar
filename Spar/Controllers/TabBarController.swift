//
//  TabBarController.swift
//  Spar
//
//  Created by Admin on 31.01.2024.
//

import UIKit

private enum TabBarItem: Int {
    
    case main
    case catalog
    case cart
    case profile
    
    var title: String {
        switch self {
        case .main:
            return "Главная"
        case .profile:
            return "Профиль"
        case .cart:
            return "Корзина"
        case .catalog:
            return "Каталог"
        }
    }
        
    var iconName: String {
        
        switch self {
        case .main:
            return "house.fill"
        case .profile:
            return "person.fill"
        case .cart:
            return "cart"
        case .catalog:
            return "square.grid.2x2"
            }
        }
    }

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
    }
    
    private func generateTabBar() {
        
        let dataSource: [TabBarItem] = [.main, .profile, .cart, .catalog]
        
        view.backgroundColor = .systemBackground
        
        self.viewControllers = dataSource.map {
            switch $0 {
            case .main:
                let mainVC = ProductViewController()
                return self.wrappedVC(with: mainVC, title: $0.title)
            case .profile:
                let profileVC = ProfileViewController()
                return self.wrappedVC(with: profileVC, title: $0.title)
            case .cart:
                let cartVC = CartViewController()
                return self.wrappedVC(with: cartVC, title: $0.title)
            case .catalog:
                let catalogVC = CatalogViewController()
                return self.wrappedVC(with: catalogVC, title: $0.title)
            }
        }
        
        self.viewControllers?.enumerated().forEach {
            $1.tabBarItem.title = dataSource[$0].title
            $1.tabBarItem.image = UIImage(systemName: dataSource[$0].iconName)
            $1.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: .zero, bottom: -5, right: .zero)
        }
    }
    
    private func wrappedVC(with: UIViewController, title: String) -> UINavigationController {
        return UINavigationController(rootViewController: with)
    }
    
    private func setupNavBar() {
        self.navigationController?.navigationBar.backgroundColor = .systemBackground
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: nil, action: nil)
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: nil, action: nil),
            UIBarButtonItem(image: UIImage(systemName:"square.and.arrow.up"), style: .plain, target: nil, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "list.bullet.rectangle.portrait"), style: .plain, target: nil, action: nil)
        ]
    }
}

