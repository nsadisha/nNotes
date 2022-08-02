//
//  NoteViewScreen.swift
//  nNotes
//
//  Created by Sadisha Nimsara on 2022-08-02.
//

import SwiftUI

struct NoteViewScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    private let db = Database.getInstance()
    @State var note: Note
    
    var body: some View {
        VStack{
            TextField("Enter title", text: $note.title)
                .font(.title)
                .padding(.bottom, 20)
                .onChange(of: note.title){nt in
                    db.update(_note: note)
                }
            TextEditor(text: $note.note)
                .onChange(of: note.note){nn in
                    db.update(_note: note)
                }
            Spacer()
            
            Text("Last update: "+note.lastUpdate).foregroundColor(Color.gray.opacity(0.5))
        }
            .padding(10.0)
            .toolbar {
                Button {
                    db.delete(id: note.id)
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "trash")
                }
            }
    }
}

struct NoteViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

