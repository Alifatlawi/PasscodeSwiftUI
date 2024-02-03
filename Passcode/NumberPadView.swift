//
//  NumberPadView.swift
//  Passcode
//
//  Created by Ali Amer on 2/3/24.
//

import SwiftUI

struct NumberPadView: View {
    
    @Binding var passcode : String
    
    private let columns: [GridItem] = [
        .init(),
        .init(),
        .init()
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(1 ... 9, id: \.self) { index in
                Button(action: {
                    addValue(index)
                }, label: {
                    Text("\(index)")
                        .font(.title)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .contentShape(.rect)
                })
            }
            Button(action: {
                removeValue()
            }, label: {
                Image(systemName: "delete.backward")
                    .font(.title)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .contentShape(.rect)
            })
            
            Button(action: {
                addValue(0)
            }, label: {
                Text("0")
                    .font(.title)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .contentShape(.rect)
            })
        }
        .foregroundStyle(.primary)
    }
    
    private func addValue(_ value: Int){
        if passcode.count < 6 {
            passcode += "\(value)"
        }
    }
    
    private func removeValue(){
        if !passcode.isEmpty {
            passcode.removeLast()
        }
    }
    
}

#Preview {
    NumberPadView(passcode: .constant(""))
}
