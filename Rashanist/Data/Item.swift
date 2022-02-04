//
//  Item.swift
//  Rashanist
//
//  Created by Ashish Dwivedi on 03/02/22.
//

import Foundation

class Item {
    let name: String
    var quantity: Int
    let imageUrl: String
    
    init(name: String, quantity: Int, imageUrl: String) {
        self.name = name
        self.quantity = quantity
        self.imageUrl = imageUrl
    }
}

typealias Items = [Item]

extension Items {
    static let myList = [
        Item(name: "Tuvar Dal", quantity: 0, imageUrl: "tuvar_dal"),
        Item(name: "Flour", quantity: 0, imageUrl: "wheat_flour"),
        Item(name: "Rice Jeera Shahi", quantity: 0, imageUrl: "jeera_shahi"),
        Item(name: "Rice Basmati", quantity: 0, imageUrl: "basmati_ice"),
        Item(name: "Turmeric Powder", quantity: 0, imageUrl: "turmeric_powder"),
        Item(name: "Sugar", quantity: 0, imageUrl: "sugar"),
        Item(name: "Kayam Churan", quantity: 0, imageUrl: "kayam_churan"),
        Item(name: "Black Salt", quantity: 0, imageUrl: "black_salt"),
        Item(name: "Lizol", quantity: 0, imageUrl: "lizol"),
        Item(name: "Room Freshner", quantity: 0, imageUrl: "room_freshner"),
        Item(name: "Chola Chana Kg", quantity: 0, imageUrl: "chola"),
        Item(name: "Dhokla mix", quantity: 0, imageUrl: "dhokla"),
        Item(name: "Surf", quantity: 0, imageUrl: "surf"),
        Item(name: "Nirma Powder", quantity: 0, imageUrl: "nirma"),
        Item(name: "Nirma Bar", quantity: 0, imageUrl: "nirma_bar"),
        Item(name: "Tata Gold Tea", quantity: 0, imageUrl: "tata_gold_tea"),
        Item(name: "Safola Oil", quantity: 0, imageUrl: "safolla_oil"),
        Item(name: "Hing", quantity: 0, imageUrl: "hing"),
        Item(name: "Lijjat Pappad", quantity: 0, imageUrl: "lijjat_papad"),
        Item(name: "Dettol Handwash", quantity: 0, imageUrl: "dettol_handwash"),
        Item(name: "Agarbatti", quantity: 0, imageUrl: "incense_sticks"),
        Item(name: "Coriander Powder", quantity: 0, imageUrl: "coriander_powder"),
        Item(name: "Goodday Biscuit", quantity: 0, imageUrl: "gooday_biscuits"),
        Item(name: "Parle G Biscuit", quantity: 0, imageUrl: "parleg"),
        Item(name: "Monaco Biscuit", quantity: 0, imageUrl: "monaco"),
        Item(name: "Green Tea", quantity: 0, imageUrl: "green_tea"),
        Item(name: "Patanjali Facewash", quantity: 0, imageUrl: "patanjali_facewash"),
        Item(name: "White Murmura", quantity: 0, imageUrl: "murmura"),
        Item(name: "White Dhokla", quantity: 0, imageUrl: "white_dhokla"),
        Item(name: "Cumin(Jeera)", quantity: 0, imageUrl: "cumin"),
        Item(name: "Methi Powder", quantity: 0, imageUrl: "methi_powder"),
        Item(name: "Kaju 100 gm", quantity: 0, imageUrl: "kaju"),
        Item(name: "Mutton Masala", quantity: 0, imageUrl: "mutton_masala"),
        Item(name: "Sarson Oil", quantity: 0, imageUrl: "mustard_oil"),
        Item(name: "Besan", quantity: 0, imageUrl: "besan"),
        Item(name: "Walnut 100 gm", quantity: 0, imageUrl: "walnut"),
        Item(name: "Garnier Hair Colour", quantity: 0, imageUrl: "garnier_hari_colour"),
        Item(name: "Parachute Oil", quantity: 0, imageUrl: "parachute_oil"),
        Item(name: "Coffee Nescafe", quantity: 0, imageUrl: "nescafe_coffee"),
        Item(name: "Shampoo Head and Shoulder", quantity: 0, imageUrl: "shampoo_head_shoulder"),
        Item(name: "Dove Soap", quantity: 0, imageUrl: "dove_soap"),
        Item(name: "Colgate", quantity: 0, imageUrl: "colgate"),
        Item(name: "Tooth Brush", quantity: 0, imageUrl: "tooth_brush"),
        Item(name: "Bajaj Badam Oil", quantity: 0, imageUrl: "almond_oil"),
        Item(name: "Garlic Kg", quantity: 0, imageUrl: "garlic"),
        Item(name: "Vaseline Cocoa glow", quantity: 0, imageUrl: "vaseline"),
        Item(name: "Navratan Oil", quantity: 0, imageUrl: "navratan_oil"),
        Item(name: "Rajma", quantity: 0, imageUrl: "rajma"),
        Item(name: "Hair Conditioner", quantity: 0, imageUrl: "hair_conditioner"),
        Item(name: "Moong Dal", quantity: 0, imageUrl: "moong_dal"),
        Item(name: "Maida", quantity: 0, imageUrl: "maida"),
        Item(name: "Sooji", quantity: 0, imageUrl: "sooji"),
        Item(name: "Sugar Free", quantity: 0, imageUrl: "sugar_free"),
        Item(name: "Maggi", quantity: 0, imageUrl: "maggi"),
        Item(name: "Chola Masala", quantity: 0, imageUrl: "chole_masala"),
        Item(name: "Harpic", quantity: 0, imageUrl: "harpic"),
        Item(name: "Seek Jhadoo", quantity: 0, imageUrl: "seekh_jhadoo"),
        Item(name: "Scortch Brite", quantity: 0, imageUrl: "scorch_brite"),
        Item(name: "Prill", quantity: 0, imageUrl: "prill"),
        Item(name: "Hit", quantity: 0, imageUrl: "hit")
    ]
}

extension Items {
    
    var writableDescription: String {
        return self.map { "› \($0.name), quantity: \($0.quantity)" }.joined(separator: "\n")
    }
}
