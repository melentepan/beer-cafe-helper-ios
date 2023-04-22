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
    }
    
    @IBAction func startDayButtonPressed(_ sender: UIButton) {
        if Manager.shared.beerArray.isEmpty {
            pushToViewController(withIdentifier: "ThirdViewController")
        } else {
            pushToViewController(withIdentifier: "SecondViewController")
        }
    }
    
    @IBAction func endDayButtonPressed(_ sender: UIButton) {
        
    }

    @IBAction func addBeerButtonPressed(_ sender: UIButton) {
        pushToViewController(withIdentifier: "ThirdViewController")
    }

    @IBAction func setPricesButtonPressed(_ sender: UIButton) {
        pushToViewController(withIdentifier: "SecondViewController")
    }
    
    private func pushToViewController(withIdentifier identifier: String) {
        guard let controller = storyboard?.instantiateViewController(withIdentifier: identifier) else { return }
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    private func setUI() {
        startDayButton.beautifullButton()
        endDayButton.beautifullButton()
        addBeerButton.beautifullButton()
    }
}

