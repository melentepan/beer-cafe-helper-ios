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
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {return}
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func endDayButtonPressed(_ sender: UIButton) {
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {return}
        self.navigationController?.pushViewController(controller, animated: true)
    }

    @IBAction func addBeerButtonPressed(_ sender: UIButton) {
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController else {return}
        self.navigationController?.pushViewController(controller, animated: true)
    }

    @IBAction func setPricesButtonPressed(_ sender: UIButton) {
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {return}
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    private func setUI() {
        startDayButton.beautifullButton()
        endDayButton.beautifullButton()
        addBeerButton.beautifullButton()
        setPricesButton.beautifullButton()
    }
}

