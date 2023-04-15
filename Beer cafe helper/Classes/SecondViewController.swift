import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    @IBOutlet weak var addInDayButtonFW: UIButton!
    @IBOutlet weak var addInDayButtonSW: UIButton!
    
    @IBOutlet weak var deleteButtonFW: UIButton!
    @IBOutlet weak var deleteButtonSW: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        createViewRecognizers()
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
        }
        (firstView, secondView) = (secondView, firstView)
    }
    
    @IBAction func rightSwipeDone() {
        secondView.frame.origin.x = -view.frame.width
        UIView.animate(withDuration: 0.3) {
            self.firstView.frame.origin.x = self.firstView.frame.width
            self.secondView.frame.origin.x = 0
        }
        (firstView, secondView) = (secondView, firstView)
    }
    
    @IBAction func backButtonFWPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func backButtonSWPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
    
    
    
    private func setUI() {
        addInDayButtonFW.beautifullButton()
        addInDayButtonSW.beautifullButton()
        deleteButtonFW.beautifullButton()
        deleteButtonSW.beautifullButton()
    }
}
