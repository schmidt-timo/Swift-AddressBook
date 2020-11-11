//
//  AddressCard.swift
//  iOS3-Lencer-Schmidt
//
//  Created by Marie Lencer, Timo Schmidt on 11.11.20.
//

import Foundation

class AddressCard : Codable, Equatable {
    
    func == (left: AddressCard, right: AddressCard) -> Bool {
        return left.nachname == right.nachname
    }
    
    let vorname : String
    let nachname : String
    let strasse : String      // Straße + Hausnummer
    let plz : Int
    let ort : String
    
    var hobbies : [String]
    var friends : [AddressCard]
    
    init() {}
    
    init(vorname: String, nachname: String, strasse: String,
         plz: Int, ort: String) {
        self.vorname = vorname
        self.nachname = nachname
        self.strasse = strasse
        self.plz = plz
        self.ort = ort
        hobbies = []
        friends = []
    }
    
    func add(hobby: String) {
        hobbies.append(hobby)
    }
    
    func remove(hobby: String) {
        let index = hobbies.firstIndex(of: hobby)
        if let _index = index {
            hobbies.remove(at: _index)
        }
    }
    
    func add(friend: AddressCard) {
        friends.append(friend)
    }
    
    func remove (friend: AddressCard) {
        let index = friends.firstIndex(of: friend)
        if let _index = index {
            friends.remove(at: _index)
        }
    }
    
}
