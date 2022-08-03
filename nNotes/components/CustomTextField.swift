//
//  CustomTextField.swift
//  nNotes
//
//  Created by Sadisha Nimsara on 2022-08-03.
//

import SwiftUI

struct CustomTextField: View {
    @State var searchTerm: Binding<String>
    @State var showClearButton = false
    var body: some View {
        HStack{
            Image(systemName: "trash").foregroundColor(Color.gray)
            TextField("Search notes", text: searchTerm)
                .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
                .onChange(of: searchTerm.wrappedValue){query in
                    showClearButton = query != ""
                    
                }
            if(showClearButton == true){
                Button {
                    searchTerm.wrappedValue = ""
                } label: {
                    Image(systemName: "house.fill")
                }
            }
        }
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 0.5))
            .background(Color.white)
            .padding(.horizontal, 20)
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
