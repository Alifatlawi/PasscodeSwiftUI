//
//  PasscodeIndicatorView.swift
//  Passcode
//
//  Created by Ali Amer on 2/3/24.
//

import SwiftUI

struct PasscodeIndicatorView: View {
    @Binding var passcode: String
    var body: some View {
        HStack (spacing: 32) {
            ForEach(0 ..< 6) { index in
                Circle()
                    .fill(passcode.count > index ? Color.primary : Color(UIColor.secondarySystemBackground))
                    .frame(width: 20, height: 30)
                    .overlay {
                        Circle()
                            .stroke(.black, lineWidth: 1.0)
                    }
            }
        }
    }
}

#Preview {
    PasscodeIndicatorView(passcode: .constant(""))
}
