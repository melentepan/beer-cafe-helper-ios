import Foundation
import UIKit

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
}


extension ViewController {
    func setUI() {
        setButton(startDayButton)
        setButton(endDayButton)
        setButton(setPricesButton)
    }
    
    func setButton(_ button: UIButton){
        button.layer.cornerRadius = button.frame.height / 3
        button.dropShadow()
    }
    
}

extension SecondViewController {
    func setUI() {
        setButton(addInDayButtonFW)
        setButton(addInDayButtonSW)
        setButton(clearButtonFW)
        setButton(clearButtonSW)
    }
    
    func setButton(_ button: UIButton){
        button.layer.cornerRadius = button.frame.height / 3
        button.dropShadow()
    }
    
}
