//
//  ContactsTableViewController.swift
//  ContactsList
//
//  Created by Anastasiia Korshina on 22.03.2022.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    
    let contacts = DataManager.shared.getRandomPersons()

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
    
    // MARK: Table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = contacts[indexPath.row]
        performSegue(withIdentifier: "showDetail", sender: person)
    }

    
    // MARK: - Navigation

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let detailVC = segue.destination as? DetailViewController else { return }
            detailVC.person = sender as? Person
        }
}
