//
//  ViewController.swift
//  Project4
//
//  Created by Nikita on 23.06.2023.
//

import UIKit

class ViewController: UITableViewController {
    var websites = ["apple.com", "hackingwithswift.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Website", for: indexPath)
        cell.textLabel?.text = websites[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "WebView") as? WebViewController {
            vc.websites = websites
            vc.selectedWebsite = websites[indexPath.row]
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}

