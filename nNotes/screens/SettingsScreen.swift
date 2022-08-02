//
//  SettingsScreen.swift
//  nNotes
//
//  Created by Sadisha Nimsara on 2022-08-02.
//

import SwiftUI

struct SettingsScreen: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("Under development")
                    .foregroundColor(Color.gray)
            }.navigationTitle("Settings")
        }
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}
