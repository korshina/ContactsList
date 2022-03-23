//
//  ContactsTableViewController.swift
//  ContactsList
//
//  Created by Anastasiia Korshina on 22.03.2022.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    
    let contacts = DataManager.shared.getRandomPersons()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)

        let person = contacts[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = person.fullName
        cell.contentConfiguration = content
        
        return cell
    }
    

    
    // MARK: - Navigation

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let detailVC = segue.destination as? DetailViewController else { return }
            detailVC.person = sender as? Person
        }
}

// MARK: Table View Delegate

extension ContactsTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = contacts[indexPath.row]
        performSegue(withIdentifier: "showDetail", sender: person)
    }
    
}

//extension ContactsTableViewController: UITabBarControllerDelegate {
//
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        tabBarController.delegate = self
//        guard let contactsWithSectionsVC = viewController as? ContactsWithSectionsTableViewController else { return }
//                contactsWithSectionsVC.contacts = contacts
//    }
//}
