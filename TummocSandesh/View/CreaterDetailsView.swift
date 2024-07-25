import SwiftUI

struct CreatorDetailsView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("App Creator: Gembali Sandesh Kumar")
                .font(.title2)
                .padding()

            Text("LinkedIn")
                .foregroundColor(.blue)
                .onTapGesture {
                    openURL("https://www.linkedin.com/in/gembali-sandesh-kumar-a16178225")
                }
                .padding()

            Text("GitHub")
                .foregroundColor(.blue)
                .onTapGesture {
                    openURL("https://github.com/gembalisandesh")
                }
                .padding()

            Spacer()

            Button("Close") {
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
        }
        .navigationTitle("Creator Details")
    }

    private func openURL(_ urlString: String) {
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
}

#Preview {
    CreatorDetailsView()
}

