import UIKit
import Combine

class FirstViewController: UIViewController {
    // MARK: - Variables
    var viewModel: FirstTabViewModel!
    var infoLabel: UILabel?
    var showDetailRequest: () -> Void = {}
    
    var subscriptions = Set<AnyCancellable>()

    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupDetailButton()
        setupInfoLabel()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        infoLabel?.text = "\(viewModel.name) - \(viewModel.mail)"
//    }
    
    // MARK: - Functions
    private func setupDetailButton() {
        let button = UIButton(frame: CGRect(x: 100, y: 500, width: 200, height: 60))
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("Go to Detail", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc private func buttonAction() {
        showDetailRequest()
    }
    
    private func setupInfoLabel() {
        let infoLabel = UILabel(frame: CGRect(x: 100, y: 300, width: 300, height: 60))
        view.addSubview(infoLabel)
        self.infoLabel = infoLabel
        
        viewModel.$name.combineLatest(viewModel.$mail).sink { [weak self] name, mail in
            if name.count + mail.count > 0 {
            self?.infoLabel?.text = "\(name) - \(mail)"
            } else {
                self?.infoLabel?.text = ""
            }
        }.store(in: &subscriptions)
    }
}
