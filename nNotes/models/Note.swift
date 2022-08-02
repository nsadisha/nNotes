//
//  Note.swift
//  nNotes
//
//  Created by Sadisha Nimsara on 2022-08-02.
//

import Foundation

struct Note: Hashable{
    var title: String
    var note: String
    var date: String
    
    func getTitle() -> String {
        return title
    }
    func getNote() -> String {
        return note
    }
    func getDate() -> String {
        return date
    }
}
