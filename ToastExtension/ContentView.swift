//
//  ContentView.swift
//  ToastExtension
//
//  Created by Azad KIZILTAŞ on 6.10.2024.
//


import SwiftUI

struct ContentView: View {
    
    @StateObject private var toastManager = ToastManager()
    
    
    var body: some View {
        VStack(spacing: 16) {
            
            Spacer()
            // Success Toast Button
            Button(action: {
                toastManager.showToast(type: .success, title: "Success", message: "Operation completed successfully!", duration: 4)
                
            }) {
                Text("Show Success Toast")
                    .frame(maxWidth: .infinity)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }.buttonStyle(PlainButtonStyle())

            // Error Toast Button
            Button(action: {
                
                toastManager.showToast(type: .error, title: "Error", message: "An error occurred!", duration: 4)
                
                
            }) {
                Text("Show Error Toast")
                    .frame(maxWidth: .infinity)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }.buttonStyle(PlainButtonStyle())
            
            // Info Toast Button
            Button(action: {
                toastManager.showToast(type: .info, title: "Info", message: "This is some informational text.", duration: 4)
                
            }) {
                Text("Show Info Toast")
                    .frame(maxWidth: .infinity)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }.buttonStyle(PlainButtonStyle())

            // Warning Toast Button
            Button(action: {
                toastManager.showToast(type: .warning, title: "Warning", message: "This is a warning message!", duration: 4)
                
            }) {
                Text("Show Warning Toast")
                    .frame(maxWidth: .infinity)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }.buttonStyle(PlainButtonStyle())

        }
        .padding()
        .overlay(
            VStack {
                ForEach(toastManager.toasts) { toast in
                    ToastView(toast: toast) {
                        toastManager.dismissToast(toast: toast)
                    }
                    .padding(.top, 8)
                    .transition(.opacity.animation(.linear)) // Apply transition to entire ToastView
                }
                Spacer()
                
            }
        )
    }
}

#Preview {
    ContentView()
}
