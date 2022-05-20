import UIKit

class SecondTabCoordinator: Coordinator {
    // MARK: - Properties
    var rootViewController = UINavigationController()
    lazy var secondViewController: SecondViewController = {
        let vc = SecondViewController()
        vc.title = "Second"
        return vc
    }()
    
    // MARK: - Functions
    func start() {
        rootViewController.setViewControllers([secondViewController], animated: false)
    }
}
