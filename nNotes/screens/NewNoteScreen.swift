//
//  NewNoteScreen.swift
//  nNotes
//
//  Created by Sadisha Nimsara on 2022-08-02.
//

import SwiftUI

struct NewNoteScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    private let db = Database.getInstance()
    @State var note = Note(id: 0, title: "", note: "", lastUpdate: "")
    @State var showAlert = false
    
    var body: some View {
        VStack{
            TextField("Enter title", text: $note.title)
                .font(.title)
                .padding(.bottom, 20)
            TextEditor(text: $note.note)
            Spacer()
        }
            .padding(10.0)
            .toolbar {
                Button("Save"){
                    if(note.note == ""){
                        showAlert = true
                        return
                    }
                    if(note.title == ""){
                        note.title = "Untitled"
                    }
                    db.insert(_note: note)
                    self.presentationMode.wrappedValue.dismiss()
                }.alert("Please enter a description to save", isPresented: $showAlert){
                    Button("OK", role: .cancel) {
                        showAlert = false
                }}
            }
    }
}

struct NewNoteScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewNoteScreen()
    }
}
