//
//  ToastManager.swift
//  ToastExtension
//
//  Created by Azad KIZILTAŞ on 7.10.2024.
//


import SwiftUI

class ToastManager: ObservableObject {
    @Published var toasts: [ToastModel] = []

    func showToast(type: ToastType, title: String, message: String, duration: TimeInterval) {
        let toast = ToastModel(type: type, title: title, message: message, duration: duration)
        toasts.insert(toast, at: 0)

        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.dismissToast(toast: toast)
        }
    }

    func dismissToast(toast: ToastModel) {
        if let index = toasts.firstIndex(where: { $0.id == toast.id }) {
                toasts.remove(at: index)
            
        }
    }
}


