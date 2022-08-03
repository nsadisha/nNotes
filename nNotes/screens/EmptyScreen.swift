//
//  EmptyScreen.swift
//  nNotes
//
//  Created by Sadisha Nimsara on 2022-08-02.
//

import SwiftUI

struct EmptyScreen: View {
    var msg: String
    var body: some View {
        VStack{
            Text(msg).foregroundColor(Color.gray)
        }.frame(maxHeight: .infinity)
    }
}

struct EmptyScreen_Previews: PreviewProvider {
    static var previews: some View {
        EmptyScreen(msg: "test")
    }
}
