import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var firstView: UIView!
    
    var secondView: UIView!
    var secondViewLabel: UILabel!
    
    @IBOutlet weak var addInDayButtonFW: UIButton!
    @IBOutlet weak var deleteButtonFW: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func createViewRecognizers() {
        let leftSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(leftSwipeDone))
        leftSwipeRecognizer.direction = .left
        view.addGestureRecognizer(leftSwipeRecognizer)
        
        let rightSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(rightSwipeDone))
        rightSwipeRecognizer.direction = .right
        view.addGestureRecognizer(rightSwipeRecognizer)
    }
    
    @IBAction func leftSwipeDone() {
        secondView.frame.origin.x = view.frame.width
        UIView.animate(withDuration: 0.3) {
            self.firstView.frame.origin.x = -self.firstView.frame.width
            self.secondView.frame.origin.x = 0
        } completion: { _ in
            self.view.sendSubviewToBack(self.secondView)
            self.firstView.frame.origin.x = 0
        }
    }
    
    @IBAction func rightSwipeDone() {
        secondView.frame.origin.x = -view.frame.width
        UIView.animate(withDuration: 0.3) {
            self.firstView.frame.origin.x = self.firstView.frame.width
            self.secondView.frame.origin.x = 0
        } completion: { _ in
            self.view.sendSubviewToBack(self.secondView)
            self.firstView.frame.origin.x = 0
        }
    }
    
    @IBAction func backButtonFWPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func plusButtonPressed(_ sender: UIButton) {
        print("+")
    }
    
    @IBAction func minusButtonPressed(_ sender: UIButton) {
        print("-")
    }
    
    
    private func setUI() {
        addInDayButtonFW.beautifullButton()
        deleteButtonFW.beautifullButton()
        
        createSecondView()
        createViewRecognizers()
    }
    
    private func createSecondView() {
        secondView = firstView.copyView()!
        view.addSubview(secondView)
        view.sendSubviewToBack(secondView)
        secondViewLabel = secondView.subviews[0] as? UILabel
//        secondViewLabel.text = "123"
    }
}
