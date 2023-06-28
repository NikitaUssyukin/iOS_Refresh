//
//  ViewController.swift
//  Project7
//
//  Created by Nikita on 28.06.2023.
//

import UIKit

class ViewController: UITableViewController {
    var petitions = [Petition]()
    var isFiltered = false
    var filteredPetitions = [Petition]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString: String
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .add, style: .plain, target: self, action: #selector(showCredits))
        
        let filterButton = UIBarButtonItem(image: .actions, style: .plain, target: self, action: #selector(filterPetitions))
        let resetFilterButton = UIBarButtonItem(image: .checkmark, style: .plain, target: self, action: #selector(resetFilter))
        
        navigationItem.leftBarButtonItems = [filterButton, resetFilterButton]
        
        if navigationController?.tabBarItem.tag == 0 {
            // let urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            // urlString = "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=10000&limit=100"
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }

        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                return
            }
        }
        
        showError()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isFiltered {
            return filteredPetitions.count
        }
        
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if isFiltered {
            let petition = filteredPetitions[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = petition.title
            cell.detailTextLabel?.text = petition.body
            return cell
        }
        
        let petition = petitions[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        
        if isFiltered {
            vc.detailItem = filteredPetitions[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
            return
        }
        
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            tableView.reloadData()
        }
    }
    
    func showError() {
        let ac = UIAlertController(title: "Loading error", message: "Check internet connection", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    @objc func showCredits() {
        let ac = UIAlertController(title: "Origin of data", message: "We The People API of the Whitehouse", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    @objc func filterPetitions() {
        let ac = UIAlertController(title: "Filter petitions", message: "Type a key word below to filter petitions", preferredStyle: .alert)
        ac.addTextField()
        let filterAction = UIAlertAction(title: "Filter", style: .default) { [ weak self, weak ac ] _ in
            guard let request = ac?.textFields?[0].text else { return }
            self?.applyFilter(request)
        }
        
        ac.addAction(filterAction)
        present(ac, animated: true)
    }
    
    func applyFilter(_ request: String) {
        filteredPetitions = petitions.filter {
            $0.body.contains(request) || $0.title.contains(request)
        }
        isFiltered = true
        tableView.reloadData()
        
    }
    
    @objc func resetFilter() {
        isFiltered = false
        filteredPetitions.removeAll()
        tableView.reloadData()
    }
}

