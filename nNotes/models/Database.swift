//
//  Database.swift
//  nNotes
//
//  Created by Sadisha Nimsara on 2022-08-02.
//

import Foundation
import SQLite3

class Database {
    var db : OpaquePointer?
    var path : String = "myDataBaseName.sqlite"
    private static var instance = Database()
    
    private init() {
        self.db = createDB()
        self.createTable()
    }
    
    static func getInstance() -> Database{
        return instance
    }

    func createDB() -> OpaquePointer? {
        let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathExtension(path)

        var db : OpaquePointer? = nil
        
        if sqlite3_open(filePath.path, &db) != SQLITE_OK {
            print("There is error in creating DB")
            return nil
        }else {
            print("Database has been created with path \(path)")
            return db
        }
    }
    
    private func createTable()  {
//        let query = "DROP TABLE notes;"
        let query = "CREATE TABLE IF NOT EXISTS notes(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT, note TEXT, lastUpdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP);"
        var statement : OpaquePointer? = nil

        if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Table creation success")
            }else {
                print("Table creation fail")
            }
        } else {
            print("Prepration fail")
        }
    }
    
    func insert(_note: Note) {
        let title = _note.title
        let note = _note.note
        
        let query = "INSERT INTO notes(title, note) VALUES (?, ?);"
        
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            sqlite3_bind_text(statement, 1, (title as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 2, (note as NSString).utf8String, -1, nil)
            
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Data inserted success")
            }else {
                print("Data is not inserted in table")
            }
        } else {
            print("Query is not as per requirement")
        }
    }
        
        
    func readAll() -> [Note] {
        var mainList = [Note]()
        
        let query = "SELECT * FROM notes;"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            while sqlite3_step(statement) == SQLITE_ROW {
                let id = Int(sqlite3_column_int(statement, 0))
                let title = String(describing: String(cString: sqlite3_column_text(statement, 1)))
                let note = String(describing: String(cString: sqlite3_column_text(statement, 2)))
                let lastUpdate = String(sqlite3_column_int(statement, 3))

                let model = Note(id: id, title: title, note: note, lastUpdate: lastUpdate)
                    
                mainList.append(model)
            }
        }
        return mainList
    }
    
    func update(_note: Note) {
        let id = _note.id
        let title = _note.title
        let note = _note.note
        
        let query = "UPDATE notes SET title = '\(title)', note = '\(note)' WHERE id = \(id);"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Data updated success")
            }else {
                print("Data is not updated in table")
            }
        }
    }
    
    func delete(id : Int) {
        let query = "DELETE FROM notes where id = \(id)"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Data delete success")
            }else {
                print("Data is not deleted in table")
            }
        }
    }
}
