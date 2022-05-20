import SwiftUI
import Combine

class AppCoordinator: Coordinator {
    // MARK: - Properties
    let window: UIWindow
    var childCoordinators = [Coordinator]()
    
    let hasSeenOnBoarding = CurrentValueSubject<Bool, Never>(false)
    var subscriptions = Set<AnyCancellable>()
    
    // MARK: - Initializers
    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: - Functions
    func start() {
        setupOnBoardingValue()
        
        hasSeenOnBoarding
            .removeDuplicates()
            .sink { [weak self] hasSeen in
                if hasSeen {
                    let mainCoordinator = MainCoordinator()
                    mainCoordinator.start()
                    self?.childCoordinators.append(mainCoordinator)
                    self?.window.rootViewController = mainCoordinator.rootViewController
                } else if let hasSeenOnBoarding = self?.hasSeenOnBoarding {
                    let onBoardingCoordinator = OnBoardingCoordinator(hasSeenOnBoarding: hasSeenOnBoarding)
                    onBoardingCoordinator.start()
                    self?.childCoordinators.append(onBoardingCoordinator)
                    self?.window.rootViewController = onBoardingCoordinator.rootViewController
                }
            }.store(in: &subscriptions)
        
        // window.rootViewController = UIHostingController(rootView: ContentView())
        // window.rootViewController = ViewController()  // UIKit
    }
    
    private func setupOnBoardingValue() {
        let key = "hasSeenOnBoarding"
        let value = UserDefaults.standard.bool(forKey: key)
        hasSeenOnBoarding.send(value)
        
        hasSeenOnBoarding
            .filter { $0 }
            .sink { newValue in
                UserDefaults.standard.setValue(newValue, forKey: key)
            }.store(in: &subscriptions)
    }
}
