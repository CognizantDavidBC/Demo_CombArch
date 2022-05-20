import UIKit
import SwiftUI

class FirstTabCoordinator: NSObject, Coordinator {
    // MARK: - Properties
    var rootViewController: UINavigationController
    let viewModel = FirstTabViewModel()
    lazy var firstViewController: FirstViewController = {
        let vc = FirstViewController()
        vc.viewModel = viewModel
        vc.showDetailRequest = { [weak self] in
            self?.goToDetails()
        }
        vc.title = "First title"
        return vc
    }()
    
    // MARK: - Initializers
    override init() {
        rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
        super.init()
        
        rootViewController.delegate = self
    }
    
    // MARK: - Functions
    func start() {
        rootViewController.setViewControllers([firstViewController], animated: false)
    }
    
    private func goToDetails() {
        let detailViewController = UIHostingController(rootView: FirstDetailView(viewModel: viewModel))
        rootViewController.pushViewController(detailViewController, animated: true)
    }
}

extension FirstTabCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController as? UIHostingController<FirstDetailView> != nil {
            print("Detail will be shown")
        } else if viewController as? FirstViewController != nil {
            print("First will be shown")
        }
    }
}
