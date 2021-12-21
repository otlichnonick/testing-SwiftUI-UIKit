//
//  TabBarController.swift
//  testApp
//
//  Created by Anton Agafonov on 20.12.2021.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [createSwiftUIVersion(), createUIKit13iOSVersion(), createUIKit15iOSVersion()]
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().barTintColor = .black
    }
    
    func createSwiftUIVersion() -> UIViewController {
        let vc = SwiftUIViewController()
        vc.title = "Version with SwiftUI"
        vc.tabBarItem = UITabBarItem(title: "SwiftUI", image: nil, tag: 0)
        return vc
    }
    
    func createUIKit13iOSVersion() -> UIViewController {
        let vc = UIKitiOS13ViewController()
        vc.title = "Version with UIkit iOS13"
        vc.tabBarItem = UITabBarItem(title: "iOS13", image: nil, tag: 1)
        return vc
    }
    
    func createUIKit15iOSVersion() -> UIViewController {
        let vc = UIKitiOS15ViewController()
        vc.title = "Version with UIkit iOS15"
        vc.tabBarItem = UITabBarItem(title: "iOS15", image: nil, tag: 2)
        return vc
    }
}

extension UIImage {
    func imageResized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
