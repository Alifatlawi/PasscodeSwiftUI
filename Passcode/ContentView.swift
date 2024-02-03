//
//  ContentView.swift
//  Passcode
//
//  Created by Ali Amer on 2/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isAuthenticated = false
    var body: some View {
        VStack {
            if isAuthenticated {
                VStack {
                    Text("Welcome !!")
                    Button("Log Out"){
                        isAuthenticated = false
                    }
                }
            } else {
                PasscodeView(isAuthenticated: $isAuthenticated)
            }
        }
    }
}

#Preview {
    ContentView()
}
