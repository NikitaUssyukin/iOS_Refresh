//
//  ViewController.swift
//  StreamingServiceApp
//
//  Created by Yakuza on 10/06/2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        
        //adding our VCs to UINavigationController
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        let upcomingViewController = UINavigationController(rootViewController: UpcomingViewController())
        let searchViewController = UINavigationController(rootViewController: SearchViewController())
        let dowloadsViewController = UINavigationController(rootViewController: DownloadsViewController())
        
        //setting images for each tab bar item
        homeViewController.tabBarItem.image = UIImage(systemName: "house")
        upcomingViewController.tabBarItem.image = UIImage(systemName: "play.circle")
        searchViewController.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        dowloadsViewController.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        //setting names for each tab
        homeViewController.title = "Home"
        upcomingViewController.title = "Upcoming"
        searchViewController.title = "Search"
        dowloadsViewController.title = "Downloads"
        
        //setting common color for all tab bat items
        tabBar.tintColor = .label
        
        setViewControllers([homeViewController, upcomingViewController, searchViewController, dowloadsViewController], animated: true)
    }


}

