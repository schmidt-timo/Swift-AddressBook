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

// Leere AddressCard erstellen
var card: AddressCard

var start = ""

repeat {
    start = read(withPrompt: "(E)ingabe, (S)uche, (L)iste oder (Q)uit?")

    switch(start) {
    case "e", "E":
        print("Neue Karte anlegen:")
        let vorname = read(withPrompt: "Vorname: ")
        let nachname = read(withPrompt: "Nachname: ")
        let strasse = read(withPrompt: "Straße: ")
        let plz = Int(read(withPrompt: "Postleitzahl: "))
        let ort = read(withPrompt: "Ort: ")
        
        // Werte in Karte abspeichern
        card = AddressCard(vorname: vorname, nachname: nachname, strasse: strasse, plz: plz ?? 0, ort: ort)
        
        // Nach Hobbies fragen
        var hobbies = ""
        repeat {
            hobbies = read(withPrompt: "Hobby: (Abbruch mit (Q))")

            if hobbies.isEmpty {
                print("Du hast nichts eingegeben! Versuche es nochmal!")
            }
            else {
                card.add(hobby: hobbies) // Hobby zur Addresscard hinzufügen
            }
        } while hobbies != "q" && hobbies != "Q"
        
        // Karte zum Adressbuch hinzufügen
        addressbook?.add(card: card)
        
    case "s", "S":
        // Nachname erfragen
        let searchName = read(withPrompt: "Nachname suchen: ")
        // Leere AddressCard initialisieren? var addressCard
    //    // Gefundenes Ergebnis anzeigen
    //    if (suchName ist im Addressbuch) {
    //         addressCard = treffer
    //    }
    //    else {
    //        print("Nicht gefunden!")
    //    }
        // Zweites Menü anzeigen
        let friendMenu = read(withPrompt: "(F)reund/in hinzufügen, (L)öschen oder (Z)urück?")
        
        switch(friendMenu) {
            case "f", "F":
                let friend = read(withPrompt: "Name Freund/in: ")
                // Nach Addresskarte mit diesem Namen suchen
    //            card.add(friend: //adresskarte)
            case "l", "L":
                print("nix")
                // name von löschender Person erfragen
                // nach passender card suchen
                // addressbook.remove(card: card)
            case "z", "Z":
                print("nix")
            default:
                print("nix")
            }
    case "l", "L":
        print("nix")
    case "q", "Q":
        // Abspeichern
        print("gespeichert!")
        break
    //    if card = AddressCard() {
    //        addressbook?.add(card: card)
    //    }
    default:
        // erneut fragen
        start = read(withPrompt: "(E)ingabe, (S)uche, (L)iste oder (Q)uit?")
    }
} while start != "q" && start != "Q"
