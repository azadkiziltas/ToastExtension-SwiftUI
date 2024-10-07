import SwiftUI


struct ToastView: View {
    let toast: ToastModel
    let onClose: () -> Void

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                toast.type.icon
                    .padding(.trailing, 16)
                VStack(alignment: .leading) {
                    Text(toast.title)
                        .font(.system(size: 16, weight: .bold))
                        .padding(.bottom, 4)
                        .foregroundColor(Color(hex: "1E1E1E"))
                    Text(toast.message)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Color(hex: "494A50"))
                }
                Spacer()
                Button(action: onClose) {
                    Image("toast_close")
                }
            }
            .padding(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.black.opacity(0.2), lineWidth: 1)
            )
            .background(toast.type.backgroundColor)
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 4)
            .padding(.horizontal, 24)
            
        }
    }
}



struct ToastModel: Identifiable {
    let id = UUID()
    let type: ToastType
    let title: String
    let message: String
    let duration: TimeInterval
}


enum ToastType {
    case info
    case warning
    case error
    case success

    var backgroundColor: Color {
        switch self {
        case .info: return Color(hex: "#EAF2FF")
        case .warning: return Color(hex: "#FFF4E4")
        case .error: return Color(hex: "#FFE2E5")
        case .success: return Color(hex: "#E7F4E8")
        }
    }
    
    var icon: Image {
        switch self {
        case .info: return Image("toast_info")
        case .error: return Image("toast_error")
        case .success: return Image("toast_success")
        case .warning: return Image("toast_warning")
        }
    }
}
