//
//  NoteItem.swift
//  nNotes
//
//  Created by Sadisha Nimsara on 2022-08-02.
//

import SwiftUI

struct NoteItem: View {
    var note: Note
    var body: some View {
        NavigationLink(destination: NoteViewScreen(note: note)) {
            VStack(alignment: .leading){
                Text(note.title)
                    .font(.title3)
                    .fontWeight(.medium)
                    .padding(.bottom, 1)
                Text(note.note)
                    .foregroundColor(Color.gray)
            }.frame(height: 60)
        }
    }
}

struct NoteItem_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
