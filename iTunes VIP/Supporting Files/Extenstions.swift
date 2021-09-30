//
//  Extenstions.swift
//  iTunes VIP
//
//  Created by hashem on 25/09/2021.
//

import UIKit
import Kingfisher

//MARK:- uiviewController ex
extension UIViewController {
    /// this function showing alert with message
    /// - Parameter message: the message body
    func showError(with message: String) {
        let alert = UIAlertController(
            title: "Error",
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil
        )
        alert.addAction(okAction)
        
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}


//MARK:- UIImageView exs -----
extension UIImageView{
    /// this function loads the image from url udimg kingfiher pod
    /// - Parameter url: the image url to convret to image
  func loadImage(_ url : URL?) {
    self.kf.setImage(
      with: url,
      options: [
        .scaleFactor(UIScreen.main.scale),
        .transition(.fade(1)),
        .cacheOriginalImage
      ])
    self.kf.indicatorType = .activity
  }
}

//MARK:- UiView ex ------
extension UIView{
    /// this function shakes the view
func shake() {
    let animation = CABasicAnimation(keyPath: "position")
    animation.duration = 0.07
    animation.repeatCount = 4
    animation.autoreverses = true
    animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
    animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
    
    self.layer.add(animation, forKey: "position")
}
}
