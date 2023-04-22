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
//                return try NSKeyedUnarchiver.unarchivedObject(ofClass: T.self, from: data)

            } catch {
                return nil
            }
        }
}

extension ThirdViewController {
    func showSuccessfullAC(beerName : String){
        let alert = UIAlertController(title: "Successful", message: "\"\(beerName)\" added successfully", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func showFailAC(){
        let alert = UIAlertController(title: "Unsuccessful", message: "Invalid count per day or price", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
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
}
