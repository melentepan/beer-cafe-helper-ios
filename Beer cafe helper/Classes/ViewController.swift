import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startDayButton: UIButton!
    @IBOutlet weak var endDayButton: UIButton!
    @IBOutlet weak var addBeerButton: UIButton!
    @IBOutlet weak var setPricesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        startDayButton.beautifullButton()
        Manager.shared.loadBeerArray()
    }
    
    @IBAction func startDayButtonPressed(_ sender: UIButton) {
        if Manager.shared.beerArray.isEmpty {
            pushToViewController(withIdentifier: "ThirdViewController")
        } else {
            pushToViewController(withIdentifier: "SecondViewController")
        }
    }
    
    @IBAction func endDayButtonPressed(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }

    @IBAction func addBeerButtonPressed(_ sender: UIButton) {
        pushToViewController(withIdentifier: "ThirdViewController")
    }

    @IBAction func setPricesButtonPressed(_ sender: UIButton) {
        pushToViewController(withIdentifier: "SecondViewController")
    }
}

