//
//  HomeScreen.swift
//  nNotes
//
//  Created by Sadisha Nimsara on 2022-08-02.
//

import SwiftUI

struct HomeScreen: View {
    @State private var notes = [
        Note(title: "Title 1", note: "Note 1", date: "Date 1"),
        Note(title: "Title 2", note: "Note 2", date: "Date 2"),
        Note(title: "Title 3", note: "Note 3", date: "Date 3"),
        Note(title: "Title 4", note: "Note 4", date: "Date 4"),
        Note(title: "Title 5", note: "Note 5", date: "Date 5")
    ]
    @State private var searchTerm = ""
    
    var body: some View {
        NavigationView{
            VStack {
                TextField("Search notes", text: $searchTerm)
                List{
                    ForEach(notes, id: \.self){note in
                        Text(note.title)
                    }
                }
            }
                .navigationTitle("nNotes")
                .background(Color.gray.opacity(0.1))
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
