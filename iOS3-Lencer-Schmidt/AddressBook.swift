//
//  AddressBook.swift
//  iOS3-Lencer-Schmidt
//
//  Created by Marie on 11.11.20.
//

import Foundation

class AddressBook: Codable {
    
    var addressCards: [AddressCard]
    
    init() {
        addressCards = []
    }
    
    func add(card: AddressCard) {
        addressCards.append(card)
    }
    
    func remove(card: AddressCard){
        let index = addressCards.firstIndex(of: card)
        if let _index = index {
            for i in addressCards {
                i.remove(friend: card)
            }
            addressCards.remove(at: _index)
        }
<<<<<<< HEAD
=======
    }
    
//    func sort(book: AddressBook) {
//        for card in addressCards {
//            card.nachname
//        }
//    }
    
    func save(toFile path: String) {
        let url = URL(fileURLWithPath: path)
        let encoder = PropertyListEncoder()
        if let data = try? encoder.encode(self) {
            try? data.write(to: url)
        }
>>>>>>> f420c7c4c53c08f57f2cb465255b6cec2d2503a3
    }
    
    
}
