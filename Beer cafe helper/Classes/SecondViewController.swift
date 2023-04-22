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
        Manager.shared.currentBeerIndex += 1
        secondView.frame.origin.x = view.frame.width
        UIView.animate(withDuration: 0.3) {
            self.firstView.frame.origin.x = -self.firstView.frame.width
            self.secondView.frame.origin.x = 0
        } completion: { _ in
            self.view.sendSubviewToBack(self.secondView)
            self.firstView.frame.origin.x = 0
        }
        Manager.shared.currentBeerIndex = beerIndex()
        setCurrentBeer()
    }
    
    @IBAction func rightSwipeDone() {
        guard Manager.shared.beerArray.count > 1 else {return}
        Manager.shared.currentBeerIndex -= 1
        secondView.frame.origin.x = -view.frame.width
        UIView.animate(withDuration: 0.3) {
            self.firstView.frame.origin.x = self.firstView.frame.width
            self.secondView.frame.origin.x = 0
        } completion: { _ in
            self.view.sendSubviewToBack(self.secondView)
            self.firstView.frame.origin.x = 0
        }
        Manager.shared.currentBeerIndex = beerIndex()
        setCurrentBeer()
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
    
    private func changeCountOfSelected(_ shift: Int) {
        Manager.shared.beerArray[Manager.shared.currentBeerIndex].countOfSelected += shift
        setCurrentBeer()
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
        secondViewNameLabel = secondView.subviews[0] as? UILabel
        secondViewCountOfSelectedTF = secondView.subviews[1] as? UITextField
        secondViewCountOfRemLabel = secondView.subviews[2] as? UILabel
        secondViewCurentPriceLabel = secondView.subviews[3] as? UILabel
    }
    
    private func setCurrentBeer() {
        let currentBeer = Manager.shared.beerArray[Manager.shared.currentBeerIndex]
        firstViewNameLabel.text = currentBeer.name
        firstViewCountOfSelectedTF.text = "\(currentBeer.countOfSelected)"
        firstViewCountOfRemLabel.text = "\(currentBeer.countPerDay - currentBeer.countOfSelled)"
        firstViewCurentPriceLabel.text = "\(currentBeer.price)$"
    }
    
    private func createViewRecognizers() {
        let leftSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(leftSwipeDone))
        leftSwipeRecognizer.direction = .left
        view.addGestureRecognizer(leftSwipeRecognizer)
        
        let rightSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(rightSwipeDone))
        rightSwipeRecognizer.direction = .right
        view.addGestureRecognizer(rightSwipeRecognizer)
    }
}
