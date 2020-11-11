//
//  AddressCard.swift
//  iOS3-Lencer-Schmidt
//
//  Created by Marie Lencer, Timo Schmidt on 11.11.20.
//

import Foundation

class AddressCard {
    
    let vorname : String
    let nachname : String
    let strasse : String      // Straße + Hausnummer
    let plz : Int
    let ort : String
    
    var hobbies : [String]
    var friends : [AddressCard]
    
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
    
}
