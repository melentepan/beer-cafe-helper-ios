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
        guard let name = beerNameTextField.text else {return showFailAC()}
        guard let count = Int(countPerDayTextField.text!) else {return showFailAC()}
        guard let price = Float(PriceTextField.text!) else {return showFailAC()}
        showSuccessfullAC(beerName: name)
        Manager.shared.beerArray.append(Beer(name: name, price: price, countPerDay: count))
        Manager.shared.saveBeer()
        beerNameTextField.text = ""
        countPerDayTextField.text = ""
        PriceTextField.text = ""
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        returnBack()
    }
}
