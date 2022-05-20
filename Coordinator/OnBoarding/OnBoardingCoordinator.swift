import SwiftUI
import Combine

class OnBoardingCoordinator: Coordinator {
    // MARK: - Properties
    var rootViewController = UIViewController()
    var hasSeenOnBoarding: CurrentValueSubject<Bool, Never>
    
    // MARK: - Initializer
    init(hasSeenOnBoarding: CurrentValueSubject<Bool, Never>) {
        self.hasSeenOnBoarding = hasSeenOnBoarding
    }
    
    // MARK: - Functions
    func start() {
        let view = OnBoardingView(doneRequested: { [weak self] in
            self?.hasSeenOnBoarding.send(true)
        })
        
        rootViewController = UIHostingController(rootView: view)
    }
}
