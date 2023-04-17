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

extension UIButton {
    func beautifullButton() {
        self.layer.cornerRadius = self.frame.height / 3
        self.dropShadow()
    }
}

extension UIView {
    func copyView<T: UIView>() -> T? {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: false)
            return try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? T
        } catch {
            return nil
        }
    }
}
