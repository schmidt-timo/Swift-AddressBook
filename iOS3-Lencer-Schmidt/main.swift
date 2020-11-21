//
//  main.swift
//  iOS3-Lencer-Schmidt
//
//  Created by Timo Schmidt on 11.11.20.
//

import Foundation

// Adressbuch erstellen
var addressbook = AddressBook()

// File einlesen
var readAddressbook = AddressBook.addressBook(fromFile: "book.plist")

if let book = readAddressbook {
    addressbook = readAddressbook!
}

// Mit Beispieldaten füllen
addressbook = fillWithData()

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
        addressbook.add(card: card)
        
        // Addressbuch sortieren
        addressbook.sort()
        
    case "s", "S":
        
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
        for card in addressbook.addressCards {
            printAddressCard(card: card)
        }
        
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


func fillWithData() -> AddressBook {
    addressbook = AddressBook()

    // Erste Karte
    let card1 = AddressCard(vorname: "John", nachname: "Doe", strasse: "Hauptstraße 4", plz: 11223, ort: "Berlin")
    card1.add(hobby: "Schwimmen")
    card1.add(hobby: "Fußball")
    
    addressbook.add(card: card1)
    
    let card2 = AddressCard(vorname: "Max", nachname: "Mustermann", strasse: "Waldstraße 1", plz: 12345, ort: "Hamburg")
    card2.add(hobby: "Reiten")
    card2.add(friend: card1)
    
    addressbook.add(card: card2)
    
    let card3 = AddressCard(vorname: "Jane", nachname: "Smith", strasse: "Berliner Ring 100", plz: 54321, ort: "Frankfurt")
    card3.add(hobby: "Bogenschießen")
    card3.add(hobby: "Kayak")
    card3.add(friend: card1)
    card3.add(friend: card2)
    
    addressbook.add(card: card3)
    
    return addressbook
}

func printAddressCard(card: AddressCard) {
    
        print("+-----------------------------------")
    
        print("| " + card.vorname + " " + card.nachname)
        print("| " + card.strasse)
        print("| " + String(card.plz) + " " + card.ort)
        
        print ("| " + "Hobbies:")
        for hobby in card.hobbies {
            print("|   " + hobby)
        }
        
        print ("| " + "Freunde:")
        for friend in card.friends {
            print("|   " + friend.vorname + " " + friend.nachname + ", " + String(friend.plz) + " " + friend.ort)
        }
        
        print("+-----------------------------------")
    
}

func searchForAddressCard() {
    
    // Nachname erfragen
    let searchName = read(withPrompt: "Nachname suchen: ")
    
    var searchCard : AddressCard
    
    var cardFound = false
    
    // Check, ob Name vorhanden ist
    for card in addressbook.addressCards {
        if card.nachname == searchName {
            searchCard = card
            cardFound = true
        }
    }
    
    if !cardFound {
        print("wurde nicht gefunden!")
    }

}
