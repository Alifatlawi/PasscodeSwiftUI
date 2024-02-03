//
//  PasscodeView.swift
//  Passcode
//
//  Created by Ali Amer on 2/3/24.
//

import SwiftUI

struct PasscodeView: View {
    @Binding var isAuthenticated: Bool
    @State private var passcode = ""
    @State private var isPasscodeIncorrect = false
    var body: some View {
        VStack (spacing: 48) {
            VStack(spacing: 24) {
                Text("Enter Passcode")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                Text("Please enter your 6-digit pin to securely access your account")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
            }
            .padding(.top)
            
            // indecatro view
            PasscodeIndicatorView(passcode: $passcode)
            
            
            if isPasscodeIncorrect {
                Text("Incorrect passcode. Try again.")
                    .foregroundColor(.red)
                    .transition(AnyTransition.opacity.animation(.easeInOut)) // Adjusted animation
                    
            }
            
            Spacer()
            
            // numpad view
            NumberPadView(passcode: $passcode)
        }
        .onChange(of: passcode){
            verifyPasscode()
        }
    }
    
    private func verifyPasscode() {
        guard passcode.count == 6 else {return}
        
        Task {
            try? await Task.sleep(nanoseconds: 125_000_000)
            if passcode == "111111"{
                isAuthenticated = true
                passcode = ""
            } else {
                isPasscodeIncorrect = true
                passcode = ""
            }
        }
    }
}

#Preview {
    PasscodeView(isAuthenticated: .constant(false))
}
