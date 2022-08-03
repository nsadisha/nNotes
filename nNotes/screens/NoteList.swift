//
//  NoteList.swift
//  nNotes
//
//  Created by Sadisha Nimsara on 2022-08-02.
//

import SwiftUI

struct NoteList: View {
    @Binding var notes: [Note]
    var body: some View {
        List{
            ForEach(notes.reversed(), id: \.self){note in
                NoteItem(note: note)
            }
            .onDelete(perform: removeNote)
        }
    }
    
    func removeNote(at offsets: IndexSet){
        offsets.forEach{i in
            notes.remove(at: i)
            
            let noteId = notes.reversed()[i].id
            Database.getInstance().delete(id: noteId)
        }
    }
}
