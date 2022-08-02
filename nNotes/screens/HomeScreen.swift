//
//  HomeScreen.swift
//  nNotes
//
//  Created by Sadisha Nimsara on 2022-08-02.
//

import SwiftUI

struct HomeScreen: View {
    @State private var notes: [Note] = []
    @State private var searchTerm = ""
    
    private let db = Database.getInstance()
    
    var body: some View {
        NavigationView{
            VStack {
                TextField("Search notes", text: $searchTerm)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 20)
                    .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
                if notes.count == 0{
                    EmptyScreen()
                }else{
                    NoteList(notes: notes)
                }
                
            }
                .navigationTitle("nNotes")
                .background(Color.gray.opacity(0.1))
                .toolbar{
                    ToolbarItemGroup(placement: .navigationBarTrailing){
                    NavigationLink(destination: NewNoteScreen()){
                        Image(systemName: "plus")
                    }
                    NavigationLink(destination: SettingsScreen()){
                        Image(systemName: "gear")
                    }
                        
                    }

                }
                .onAppear{
                    notes = db.readAll()
                }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
