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
                CustomTextField(
                    placeHolder: "Search notes",
                    prefixIcon: "magnifyingglass",
                    text: $searchTerm
                )
                    .onChange(of: searchTerm){query in
                        notes = db.query(q: query)
                    }
 
                if notes.count == 0 && searchTerm == ""{
                    EmptyScreen(msg: "You don't have any notes.")
                }else if notes.count == 0 && searchTerm != ""{
                    EmptyScreen(msg: "Coudn't find any matching notes.")
                }else{
                    NoteList(notes: $notes)
                }
                
            }
                .navigationTitle("nNotes")
                .background(Color.gray.opacity(0.1))
                .toolbar{
                    ToolbarItemGroup(placement: .navigationBarTrailing){
                    NavigationLink(destination: NewNoteScreen()){
                        Image(systemName: "plus.circle.fill")
                    }
                    NavigationLink(destination: SettingsScreen()){
                        Image(systemName: "gear")
                    }
                        
                    }

                }
                .onAppear{
                    notes = db.query(q: searchTerm)
                }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
