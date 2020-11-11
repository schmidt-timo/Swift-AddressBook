//
//  main.swift
//  iOS3-Lencer-Schmidt
//
//  Created by Timo Schmidt on 11.11.20.
//

import Foundation

// File einlesen
var addressbook = AddressBook.addressBook(fromFile: "book.plist")

// überprüfen, ob Optional etwas enthält
if let book = addressbook {}
else {
    addressbook = AddressBook() // sonst leeres AddressBook erstellen
}

func read(withPrompt: String) -> String {
    print(withPrompt)
    let inputLine = readLine()

    if let input = inputLine {
        return input
    }
    return ""
}

var card: AddressCard

let first = read(withPrompt: "(E)ingabe, (S)uche, (L)iste oder (Q)uit?")

switch(first) {
case "e", "E":
    print("Neue Karte anlegen:")
    let vorname = read(withPrompt: "Vorname: ")
    let nachname = read(withPrompt: "Nachname: ")
    let strasse = read(withPrompt: "Straße: ")
    let plz = Int(read(withPrompt: "Postleitzahl: "))
    let ort = read(withPrompt: "Ort: ")
    
    card = AddressCard(vorname: vorname, nachname: nachname, strasse: strasse, plz: plz ?? 0, ort: ort)
case "s", "S":
    print("nix")
case "l", "L":
    print("nix")
case "q", "Q":
    if card = AddressCard() {
        addressbook?.add(card: card)
    }
default:
    print("nix")
}

let friendMenu = read(withPrompt: "(F)reund/in hinzufügen, (L)öschen oder (Z)urück?")
switch(friendMenu) {
case "f", "F":
    print("nix")
case "l", "L":
    print("nix")
case "z", "Z":
    print("nix")
default:
    print("nix")
}
