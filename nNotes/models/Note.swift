//
//  Note.swift
//  nNotes
//
//  Created by Sadisha Nimsara on 2022-08-02.
//

import Foundation

struct Note: Hashable, Codable{
    var id: Int
    var title: String
    var note: String
    var lastUpdate: String
}
