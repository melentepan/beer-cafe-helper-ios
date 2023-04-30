import Foundation
import UIKit



extension UIButton {
    func beautifullButton() {
        self.layer.cornerRadius = self.frame.height / 3
        self.dropShadow()
    }
}

extension UIView {
    func dropShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -5, height: 10)
        layer.shadowRadius = 10
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.frame.width/2).cgPath
        layer.shouldRasterize = true
    }
    
    func copyView<T: UIView>() -> T? {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: false)
            return try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? T
        } catch {
            return nil
        }
    }
}

extension UIViewController {
    func pushToViewController(withIdentifier identifier: String) {
        guard let controller = storyboard?.instantiateViewController(withIdentifier: identifier) else { return }
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func returnBack() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension ViewController {
    func setUI() {
        startDayButton.beautifullButton()
        endDayButton.beautifullButton()
        addBeerButton.beautifullButton()
    }
    
    func showTotalAC(){
        let soldBeers = Manager.shared.beerArray.filter { $0.countOfSelled != 0 }
        var result = soldBeers.map { "\"\($0.name)\":\n\($0.price)$ * \($0.countOfSelled) = \($0.price * Float($0.countOfSelled))$" }.joined(separator: "\n")
        if result.isEmpty {
            result = "No purchases"
        }
        for beer in soldBeers {
            beer.countOfRemaining = beer.countPerDay
            beer.countOfSelled = 0
            beer.countOfSelected = 0
        }
        showAlert(title: "Total", message: result)
    }
}

extension SecondViewController {
    func beerIndex(_ shift:Int) -> Int {
        Manager.shared.currentBeerIndex += shift
        if abs(Manager.shared.currentBeerIndex) == Manager.shared.beerArray.count {
            Manager.shared.currentBeerIndex = 0
        } else if Manager.shared.currentBeerIndex < 0 {
            return Manager.shared.beerArray.count - abs(Manager.shared.currentBeerIndex % Manager.shared.beerArray.count)
        }
        return Manager.shared.currentBeerIndex
    }
    
    func changeCountOfSelected(_ shift: Int) {
        let currentBeer = Manager.shared.beerArray[Manager.shared.currentBeerIndex]
        guard currentBeer.countOfSelected + shift >= 0 else {return}
        guard currentBeer.countOfSelected + shift <= currentBeer.countOfRemaining else {return}
        currentBeer.countOfSelected += shift
        setCurrentBeer()
    }
    
    func setUI() {
        addInDayButtonFW.beautifullButton()
        deleteButtonFW.beautifullButton()
        createSecondView()
        createViewRecognizers()
    }
    
    func createSecondView() {
        secondView = firstView.copyView()!
        view.addSubview(secondView)
        view.sendSubviewToBack(secondView)
        let secondViewBtnAddBeer = secondView.subviews[7] as? UIButton
        let secondViewBtnDelete = secondView.subviews[8] as? UIButton
        secondViewBtnAddBeer?.beautifullButton()
        secondViewBtnDelete?.beautifullButton()
        secondViewNameLabel = secondView.subviews[0] as? UILabel
        secondViewCountOfSelectedTF = secondView.subviews[1] as? UITextField
        secondViewCountOfRemLabel = secondView.subviews[2] as? UILabel
        secondViewCurentPriceLabel = secondView.subviews[3] as? UILabel
    }
    
    func animateTransition(to direction: CGFloat) {
        secondView.frame.origin.x = view.frame.width * direction
        UIView.animate(withDuration: 0.3) {
            self.firstView.frame.origin.x = -self.firstView.frame.width * direction
            self.secondView.frame.origin.x = 0
        } completion: { _ in
            self.setCurrentBeer()
            self.firstView.frame.origin.x = 0
            self.view.sendSubviewToBack(self.secondView)
        }
    }
    
    func updateBeerInfo(for view: UIView, with beer: Beer) {
        let nameLabel = view.subviews[0] as? UILabel
        let countOfSelectedTF = view.subviews[1] as? UITextField
        let countOfRemLabel = view.subviews[2] as? UILabel
        let curentPriceLabel = view.subviews[3] as? UILabel
        
        nameLabel?.text = beer.name
        countOfSelectedTF?.text = "\(beer.countOfSelected)"
        countOfRemLabel?.text = "\(beer.countPerDay - beer.countOfSelled)"
        curentPriceLabel?.text = "\(beer.price)$"
    }
    
    func setCurrentBeer() {
        let currentBeer = Manager.shared.beerArray[Manager.shared.currentBeerIndex]
        updateBeerInfo(for: firstView, with: currentBeer)
    }
    
    func updateCurrentBeer(with index: Int) {
        Manager.shared.currentBeerIndex = beerIndex(index)
        let currentBeer = Manager.shared.beerArray[Manager.shared.currentBeerIndex]
        updateBeerInfo(for: secondView, with: currentBeer)
    }
    
    func createViewRecognizers() {
        let leftSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(leftSwipeDone))
        leftSwipeRecognizer.direction = .left
        view.addGestureRecognizer(leftSwipeRecognizer)
        
        let rightSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(rightSwipeDone))
        rightSwipeRecognizer.direction = .right
        view.addGestureRecognizer(rightSwipeRecognizer)
    }
    
    func deleteBeer() {
        if Manager.shared.beerArray.count - 1 == 0 {
            Manager.shared.beerArray.remove(at: Manager.shared.currentBeerIndex)
            pushToViewController(withIdentifier: "ThirdViewController")
        } else {
            showAlert(title: "Successful", message: "\"\(Manager.shared.beerArray.remove(at: Manager.shared.currentBeerIndex).name)\" deleted successfully")
            updateCurrentBeer(with: -1)
            setCurrentBeer()
        }
        Manager.shared.saveBeer()
    }
    
    func addInTotal() {
        let currentBeer = Manager.shared.beerArray[Manager.shared.currentBeerIndex]
        guard currentBeer.countOfRemaining - currentBeer.countOfSelected >= 0 else {return}
        currentBeer.countOfSelled += currentBeer.countOfSelected
        currentBeer.countOfRemaining -= currentBeer.countOfSelected
        currentBeer.countOfSelected = 0
        setCurrentBeer()
    }
}

extension ThirdViewController {
    func showFailAC(){
        showAlert(title: "Unsuccessful", message: "Invalid count per day or price")
    }
    
    func addBeer() {
        guard let name = beerNameTextField.text else {return showFailAC()}
        guard let count = Int(countPerDayTextField.text!) else {return showFailAC()}
        guard let price = Float(PriceTextField.text!) else {return showFailAC()}
        showAlert(title: "Successful", message: "\"\(name)\" added successfully")
        Manager.shared.beerArray.append(Beer(name: name, price: price, countPerDay: count))
        Manager.shared.saveBeer()
        beerNameTextField.text = ""
        countPerDayTextField.text = ""
        PriceTextField.text = ""
    }
}

extension UserDefaults {
    
    func set<T: Encodable>(encodable: T, forKey key: String) {
        if let data = try? JSONEncoder().encode(encodable) {
            set(data, forKey: key)
        }
    }
    
    func value<T: Decodable>(_ type: T.Type, forKey key: String) -> T? {
        if let data = object(forKey: key) as? Data,
           let value = try? JSONDecoder().decode(type, from: data) {
            return value
        }
        return nil
    }
}
