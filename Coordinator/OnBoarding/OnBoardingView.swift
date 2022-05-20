import SwiftUI

struct OnBoardingView: View {
    
    var doneRequested: () -> Void
    
    var body: some View {
        TabView {
            ScaledImage(name: "doc.richtext")
                .tag(0)
            ScaledImage(name: "doc.text.below.ecg")
                .tag(1)
            ScaledImage(name: "doc.append")
                .tag(2)
            Button("Done") { doneRequested() }
        }
        .tabViewStyle(PageTabViewStyle())
        .background(Color.black.ignoresSafeArea())
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView(doneRequested: {})
    }
}
