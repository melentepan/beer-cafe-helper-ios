import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var firstViewNameLabel: UILabel!
    @IBOutlet weak var firstViewCountOfSelectedTF: UITextField!
    @IBOutlet weak var firstViewCountOfRemLabel: UILabel!
    @IBOutlet weak var firstViewCurentPriceLabel: UILabel!
    
    var secondView: UIView!
    var secondViewNameLabel: UILabel!
    var secondViewCountOfSelectedTF: UITextField!
    var secondViewCountOfRemLabel: UILabel!
    var secondViewCurentPriceLabel: UILabel!
    
    @IBOutlet weak var addInDayButtonFW: UIButton!
    @IBOutlet weak var deleteButtonFW: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setCurrentBeer()
    }

    @IBAction func leftSwipeDone() {
        guard Manager.shared.beerArray.count > 1 else {return}
        updateCurrentBeer(with: +1)
        animateTransition(to: 1)
    }

    @IBAction func rightSwipeDone() {
        guard Manager.shared.beerArray.count > 1 else {return}
        updateCurrentBeer(with: -1)
        animateTransition(to: -1)
    }
    
    
    @IBAction func backButtonFWPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func plusButtonPressed(_ sender: UIButton) {
        changeCountOfSelected(+1)
        
    }
    
    @IBAction func minusButtonPressed(_ sender: UIButton) {
        changeCountOfSelected(-1)
    }
}
