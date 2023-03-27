//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        createBezier(on: view)
        
        self.view = view
    }
    
    private func createBezier(on view: UIView) {
        
        let shapeLayer = CAShapeLayer()
        view.layer.addSublayer(shapeLayer)
        
        shapeLayer.strokeColor = UIColor.gray.cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.fillColor = UIColor.green.cgColor
//        shapeLayer.lineCap = .round
//        shapeLayer.lineDashPattern = [5, 7, 1, 3]
//        shapeLayer.lineDashPhase = 3
//        shapeLayer.strokeStart = 0.3
//        shapeLayer.strokeEnd = 0.8
        
        shapeLayer.lineJoin = .bevel
        
        shapeLayer.path = getPath().cgPath
    }
    
    private func getPath() -> UIBezierPath {
        
        let path = UIBezierPath()
        
        // triangle
        path.move(to: CGPoint(x: 10, y: 290))
        path.addLine(to: CGPoint(x: 150, y: 290))
        path.addLine(to: CGPoint(x: 150, y: 390))
        path.close()
        
        // rectangle
        let rect = CGRect(x: 10, y: 400, width: 200, height: 100)
        path.append(UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomRight, .topLeft], cornerRadii: CGSize(width: 30, height: 0)))
        
        // curve
        path.append(UIBezierPath(arcCenter: CGPoint(x: 160, y: 510), radius: 150, startAngle: .pi/5, endAngle: .pi, clockwise: true))
        path.close()
        
        // oval
        path.append(UIBezierPath(ovalIn: CGRect(x: 10, y: 100, width: 50, height: 150)))
        path.close()
        
        // variable curve
        path.move(to: CGPoint(x: 100, y: 10))
        path.addCurve(to: CGPoint(x: 290, y: 200), controlPoint1: CGPoint(x: 290, y: 20), controlPoint2: CGPoint(x: 110, y: 200))
        path.close()
        
        // cook's hat
        path.move(to: CGPoint(x: 100, y: 100))
        path.addArc(withCenter: CGPoint(x: 150, y: 100), radius: 50, startAngle: .pi, endAngle: 0, clockwise: true)
        path.addLine(to: CGPoint(x: 220, y: 100))
        path.addArc(withCenter: CGPoint(x: 220, y: 150), radius: 50, startAngle: .pi*3/2, endAngle: .pi/2, clockwise: true)
        path.addLine(to: CGPoint(x: 200, y: 200))
        path.addLine(to: CGPoint(x: 200, y: 260))
        path.addLine(to: CGPoint(x: 100, y: 260))
        path.addLine(to: CGPoint(x: 100, y: 200))
        path.addLine(to: CGPoint(x: 80, y: 200))
        path.addArc(withCenter: CGPoint(x: 80, y: 150), radius: 50, startAngle: .pi/2, endAngle: .pi*3/2, clockwise: true)
        path.addLine(to: CGPoint(x: 100, y: 100))
        path.close()
        
        return path
    }
    
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
