//
//  ContactsWithSectionsTableViewController.swift
//  ContactsList
//
//  Created by Anastasiia Korshina on 22.03.2022.
//

import UIKit

class ContactsWithSectionsTableViewController: UITableViewController {
    
    var contacts: [Person] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromContactsTVC()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        contacts.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        contacts[section].fullName
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let person = contacts[section]
        let contactsDetails = [person.email, person.phone]
        return contactsDetails.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "personCellWithSection",
            for: indexPath)

        let person = contacts[indexPath.section]
        let contactsDetails = [person.email, person.phone]
        let cellInfo = contactsDetails[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = cellInfo
        content.image = cellInfo == person.email
        ? UIImage(systemName: "phone")
        : UIImage(systemName: "envelope")
        
        cell.contentConfiguration = content

        return cell
    }
    
    private func getDataFromContactsTVC() {
        guard let viewControllers = tabBarController?.viewControllers else { return }
        viewControllers.forEach { viewController in
            guard let contactsTableVC = viewController as? ContactsTableViewController else { return }
            contacts = contactsTableVC.contacts
        }
    }


    
}
