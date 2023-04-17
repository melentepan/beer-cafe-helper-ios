import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var beerNameTextField: UITextField!
    @IBOutlet weak var countPerDayTextField: UITextField!
    @IBOutlet weak var PriceTextField: UITextField!
    
    @IBOutlet weak var AddBeerClassButton: UIButton!
    
    
    @IBAction func AddBeerClassButtonPressed(_ sender: UIButton) {
        guard let name = beerNameTextField.text else {return}
        guard let count = Int(countPerDayTextField.text!) else {return}
        guard let price = Float(PriceTextField.text!) else {return}
        Manager.shared.beerArray.append(Beer(name: name, price: price, countPerDay: count))
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
