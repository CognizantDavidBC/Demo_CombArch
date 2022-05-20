import SwiftUI

struct ScaledImage: View {
    let name: String
    
    var body: some View {
        Image(systemName: name)
            .resizable()
            .scaledToFit()
            .foregroundColor(.red)
            .padding()
    }
}
