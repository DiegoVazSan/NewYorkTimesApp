//
//  ErrorView.swift
//  NewYorkTimesApp
//
//  Created by Diego Vazquez Sanchez on 08/12/24.
//

import SwiftUI


struct ErrorView : View {
    let msg : String
    let action: () -> Void
    
    var body: some View {
        VStack {
            
            VStack {
                Text("error_message".localized())
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                    .font(.title2)
                    .padding(.bottom, 5)
                Text(msg)
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                    .padding()
                Button("retry".localized()) {
                    action()
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 200)
                .background(Color.black)
                .cornerRadius(12)
            }.padding()
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.5), radius: 5, x: 4, y: 4)
        .padding(.horizontal, 10)
        .padding(.bottom, 10)
    }
}

#Preview {
    ErrorView(msg: "There was an error", action: {})
}
