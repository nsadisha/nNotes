//
//  CustomTextField.swift
//  nNotes
//
//  Created by Sadisha Nimsara on 2022-08-03.
//

import SwiftUI

struct CustomTextField: View {
    var placeHolder: String
    var prefixIcon: String?
    @Binding var text: String
    @State private var showClearButton = false
    var clearBtn: Bool?
    var body: some View {
        HStack{
            if(prefixIcon?.isEmpty == false){
                Image(systemName: prefixIcon!).foregroundColor(Color.gray)
            }
            TextField(placeHolder, text: $text)
                .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
                .onChange(of: text){query in
                    showClearButton = !query.isEmpty
                }
            if(showClearButton && !(clearBtn != nil)){
                Button {
                    text = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(Color.gray)
                }
            }
        }
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 0.5))
//            .background(Color.red)
            .padding(.horizontal, 20)
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
