//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        setupViews()
    }

    private func setupViews() {
        self.view = getRootView()
        
        let redView = getRedView()
        let greenView = getGreenView()
        let whiteView = getWhiteView()
        let pinkView = getPinkView()
        
        redView.transform = CGAffineTransform(rotationAngle: .pi/4)
        
        self.view.addSubview(redView)
        self.view.addSubview(pinkView)
        betterSet(view: greenView, toCenterOfView: redView)
        //set(view: whiteView, toCenterOfView: redView)
        whiteView.center = greenView.center
        redView.addSubview(greenView)
        redView.addSubview(whiteView)
    }
    
    private func getRootView() -> UIView {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }
    
    private func getRedView() -> UIView {
        let view = UIView()
        view.backgroundColor = .red
        view.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
        view.clipsToBounds = true
        return view
    }
    
    private func getGreenView() -> UIView {
        let view = UIView()
        view.frame = CGRect(x: 100, y: 100, width: 180, height: 180)
        view.backgroundColor = .green
        return view
    }
    
    private func getWhiteView() -> UIView {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        view.backgroundColor = .white
        return view
    }
    
    private func getPinkView() -> UIView {
        let view = UIView()
        view.backgroundColor = .systemPink
        view.frame = CGRect(x: 50, y: 300, width: 100, height: 100)
        
        view.layer.borderWidth = 5
        view.layer.borderColor = UIColor.yellow.cgColor
        view.layer.cornerRadius = 10
        
        view.layer.shadowOpacity = 0.95
        view.layer.shadowRadius = 20
        view.layer.shadowOffset = CGSize(width: 10, height: 20)
        view.layer.shadowColor = UIColor.white.cgColor
        
        view.layer.opacity = 0.7
        
        view.layer.backgroundColor = UIColor.systemPink.cgColor
        
        let layer = CALayer()
        layer.backgroundColor = UIColor.black.cgColor
        layer.frame = CGRect(x: 10, y: 10, width: 20, height: 20)
        layer.cornerRadius = 10
        view.layer.addSublayer(layer)
        
        // layer rotation angle
//        print(view.frame)
//        view.transform = CGAffineTransform(rotationAngle: .pi/4)
//        print(view.frame)
        
        // layer stretching
//        view.transform = CGAffineTransform(scaleX: 1.5, y: 0.7)
        
        // layer offset
//        view.transform = CGAffineTransform(translationX: 100, y: 40)
        
        // layer chained transform calls
        view.transform = CGAffineTransform(rotationAngle: .pi/6).scaledBy(x: 1.5, y: 2).translatedBy(x: 50, y: 35)
        
        // layer transformations rollback
//        view.transform = CGAffineTransform.identity
        
        // inverted layer transformations
//        view.transform = CGAffineTransform(rotationAngle: .pi/6).scaledBy(x: 1.5, y: 2).translatedBy(x: 50, y: 35).inverted()
        
        return view
    }
    
    private func set(view moveView: UIView, toCenterOfView baseView: UIView) {
        let moveViewWidth = moveView.frame.width
        let moveViewHeight = moveView.frame.height
        
        let baseViewWidth = baseView.bounds.width
        let baseViewHeight = baseView.bounds.height
        
        let newXCoordinate = (baseViewWidth - moveViewWidth) / 2
        let newYCoordinate = (baseViewHeight - moveViewHeight) / 2
        
        moveView.frame.origin = CGPoint(x: newXCoordinate, y: newYCoordinate)
    }
    
    private func betterSet(view moveView: UIView, toCenterOfView baseView: UIView) {
        moveView.center = CGPoint(x: baseView.bounds.midX, y: baseView.bounds.midY)
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
