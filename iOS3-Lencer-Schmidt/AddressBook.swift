//
//  AddressBook.swift
//  iOS3-Lencer-Schmidt
//
//  Created by Marie on 11.11.20.
//

import Foundation

class AddressBook: Codable {
    
    var addressCards: [AddressCard]
    
    init(){
        addressCards = []
    }
    
    func add(card: AddressCard){
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
        
    }
    
    
}
