//
//  MainTabView.swift
//  TakeOff
//
//  Created by Jun on 2021/08/23.
//

import Foundation
import UIKit
import Firebase

class MainTabViewController: UITabBarController, UITabBarControllerDelegate {
    
    
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let index = viewControllers?.firstIndex(of: viewController)
        if index == 2 {
            let vc = PostUploadViewController()
            let navController = UINavigationController(rootViewController: vc)
            present(navController, animated: true, completion: nil)
            return false
        }
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setupViewControllers()
    }
    
    
    func setupViewControllers() {
        let homeNavController = templateNavController(unselectedImage: UIImage(named: "home_unselected")!, selectedImage: UIImage(named: "home_selected")!, rootViewController: HomeViewController())
        let canlendarController = templateNavController(unselectedImage: UIImage(named: "calendar_unselected")!, selectedImage: UIImage(named: "calendar_selected")!, rootViewController: CalendarViewController())
        let postUploadViewController = templateNavController(unselectedImage: UIImage(named: "plus_unselected")!, selectedImage: UIImage(named: "plus_unselected")!)
        let messageViewController = templateNavController(unselectedImage: UIImage(named:"message_unselected")!, selectedImage: UIImage(named: "message_selected")!, rootViewController: MessageViewController())
        let profileVIewController = templateNavController(unselectedImage: UIImage(named: "profile_unselected")!, selectedImage: UIImage(named: "profile_selected")!, rootViewController: ProfileViewController())
        tabBar.tintColor = .black
        viewControllers = [homeNavController, canlendarController, postUploadViewController, messageViewController, profileVIewController]
        
        guard let items = tabBar.items else { return }
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
        
        
    }
    
    
    fileprivate func templateNavController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController = UIViewController()) -> UINavigationController {
        
        let viewController = rootViewController
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        
        return navController
    }
    
    
}
