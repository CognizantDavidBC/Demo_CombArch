import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // MARK: - Properties
    var appCoordinator: AppCoordinator?

    // MARK: - Functions
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let appCoordinator = AppCoordinator(window: window)
            appCoordinator.start()
            
            self.appCoordinator = appCoordinator
            window.makeKeyAndVisible()
        }
    }
}

