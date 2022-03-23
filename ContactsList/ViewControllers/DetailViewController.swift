//
//  DetailViewController.swift
//  ContactsList
//
//  Created by Anastasiia Korshina on 22.03.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var person: Person!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = person.fullName
        phoneLabel.text = "Phone: \(person.phone)"
        emailLabel.text = "E-mail: \(person.email)"
    }

}
