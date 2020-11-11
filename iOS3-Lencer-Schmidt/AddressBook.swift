//
//  AddressBook.swift
//  iOS3-Lencer-Schmidt
//
//  Created by Marie on 11.11.20.
//

import Foundation

class AddressBook: Codable {
    
    init(){
        addressCards = []
    }
    
    var addressCards: [AddressCard]
    
}
