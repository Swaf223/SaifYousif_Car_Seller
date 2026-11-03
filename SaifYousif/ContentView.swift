import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)

            Text("Hello, world!")
                .font(.title)
                .fontWeight(.semibold)

            Text("Your new iOS app starts here.")
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
