//
//  NoteList.swift
//  nNotes
//
//  Created by Sadisha Nimsara on 2022-08-02.
//

import SwiftUI

struct NoteList: View {
    var notes: [Note]
    var body: some View {
        List{
            ForEach(notes.reversed(), id: \.self){note in
                NoteItem(note: note)
            }
        }
    }
}
