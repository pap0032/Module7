//
//  ViewController.swift
//  HelloWorld
//
//  Created by Abhishek Jariwala on 12/8/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    let items = [("Auburn", "AL"), ("Atlanta", "GA"), ("Chicago", "IL"),
                 ("New York", "NY"), ("Los Angeles", "CA"), ("Austin", "TX"),
                 ("Tucson", "AZ"), ("Miami", "FL"), ("Denver", "CO"), ("Seattle", "WA")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.0
        cell.detailTextLabel?.text = item.1
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetailSegue", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailSegue" {
            if let destinationVC = segue.destination as? SecondViewController,
               let indexPath = sender as? IndexPath {
                destinationVC.selectedItem = items[indexPath.row]
            }
        }
    }
}


