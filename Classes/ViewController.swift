import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startDayButton: UIButton!
    @IBOutlet weak var endDayButton: UIButton!
    @IBOutlet weak var setPricesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    @IBAction func startDayButtonPressed(_ sender: UIButton) {
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {return}
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}

