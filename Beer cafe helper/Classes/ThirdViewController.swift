import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var beerNameTextField: UITextField!
    @IBOutlet weak var countPerDayTextField: UITextField!
    @IBOutlet weak var PriceTextField: UITextField!
    
    @IBOutlet weak var AddBeerClassButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AddBeerClassButton.beautifullButton()
    }
    
    @IBAction func AddBeerClassButtonPressed(_ sender: UIButton) {
        addBeer()
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        returnBack()
    }
}
