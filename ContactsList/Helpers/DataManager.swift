//
//  DataManager.swift
//  ContactsList
//
//  Created by Anastasiia Korshina on 22.03.2022.
//

import Foundation

class DataManager {
   
    static let shared = DataManager()
    
    var names = [
        "Kuentin",
        "Aldo",
        "Valentine",
        "Roque",
        "Michelle",
        "Zoe",
        "Louise",
        "Richard",
        "Katherine",
        "Robert"
    ]
    
    var surnames = [
        "Okdell",
        "Epine",
        "Alva",
        "Pridd",
        "Rakane",
        "Arigo",
        "Gastacki",
        "Valme",
        "Dorak",
        "Aramona"
    ]
    
    var emails = [
    "iamawind@gmail.com",
    "likeastone@mail.ru",
    "ironeggs@yandex.ru",
    "womenlikeme@gmail.com",
    "imnotpretty@yahoo.com",
    "likesweets@mail.ru",
    "imtiredofliving@yandex.ru",
    "cunningfox@gmail.com",
    "sweartome@mail.ru",
    "bravebird@gmail.ru"
    ]
    
    var phones = [
    "7(495)895-70-78",
    "7(495)830-48-23",
    "7(495)417-92-57",
    "7(495)197-69-25",
    "7(495)105-17-32",
    "7(495)720-65-43",
    "7(495)509-75-78",
    "7(495)663-69-84",
    "7(495)892-63-42",
    "7(495)727-26-02"
    ]
    
    func getRandomPersons() -> [Person] {
        var persons: [Person] = []
        names.shuffle()
        surnames.shuffle()
        emails.shuffle()
        phones.shuffle()
        
        for index in 1...names.count - 1 {
            
            let person = Person(
                name: names[index],
                suname: surnames[index],
                email: emails[index],
                phone: phones[index]
            )
            persons.append(person)
        }
        
        return persons
    }
}

struct Person {
    let name: String
    let suname: String
    let email: String
    let phone: String
    
    var fullName: String {
        "\(name) \(suname)"
    }
}
