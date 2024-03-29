//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import CoreGraphics

class MyViewController : UIViewController {
    
    override func loadView() {
        
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
        
        let firstCardView = CardView<CircleShape>(frame: CGRect(x: 0, y: 0, width: 120, height: 150), color: .red)
        self.view.addSubview(firstCardView)
        
        let secondCardView = CardView<CircleShape>(frame: CGRect(x: 200, y: 0, width: 120, height: 150), color: .red)
        self.view.addSubview(secondCardView)
        secondCardView.isFlipped = true
        
    }
    
}

class CardView<ShapeType: ShapeLayerProtocol>: UIView, FlippableView {
    
    // shape color
    var color: UIColor!
    var isFlipped: Bool = false {
        didSet {
            self.setNeedsDisplay()
        }
    }
    var cornerRadius = 20
    var flipCompletionHandler: ((FlippableView) -> Void)?
    func flip() {}
    // margin of the front view
    private let margin = 10
    // outer side view
    lazy var frontSideView: UIView = self.getFrontSideView()
    // inner side view
    lazy var backSideView: UIView = self.getBackSideView()
    
    // returns view for the outer side of the card
    private func getFrontSideView() -> UIView {
    
        let view = UIView(frame: self.bounds)
        view.backgroundColor = .white
        let shapeView = UIView(frame: CGRect(x: margin, y: margin, width: Int(self.bounds.width)-margin*2, height: Int(self.bounds.height)-margin*2))
        view.addSubview(shapeView)
        // creation of the layer with figure
        let shapeLayer = ShapeType(size: shapeView.frame.size, fillColor: color.cgColor)
        shapeView.layer.addSublayer(shapeLayer)
        return view
    
    }
    
    // returns inner side view of the card
    private func getBackSideView() -> UIView {

        let view = UIView(frame: self.bounds)
        view.backgroundColor = .white
        
        // random pattern choice
        switch ["circle", "line"].randomElement()! {

        case "circle":
            let layer = BackSideCircles(size: self.bounds.size, fillColor: UIColor.black.cgColor)
            view.layer.addSublayer(layer)
            
        case "line":
            let layer = BackSideLines(size: self.bounds.size, fillColor: UIColor.black.cgColor)
            view.layer.addSublayer(layer)
            
        default:
            break

        }

        return view

    }
    
    init(frame: CGRect, color: UIColor) {

        super.init(frame: frame)
        self.color = color
        
        if isFlipped {

            self.addSubview(backSideView)
            self.addSubview(frontSideView)

        } else {

            self.addSubview(frontSideView)
            self.addSubview(backSideView)

        }
        
        setupBorders()
        
    }
    
    override func draw(_ rect: CGRect) {
        // deleteing previously added child views
        backSideView.removeFromSuperview()
        frontSideView.removeFromSuperview()
        
        //adding new views
        if isFlipped {
            self.addSubview(backSideView)
            self.addSubview(frontSideView)
        } else {
            self.addSubview(frontSideView)
            self.addSubview(backSideView)
        }
    }
    
    private func setupBorders(){
        
        self.clipsToBounds = true
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
    
    }
    
    required init?(coder: NSCoder) {

        fatalError("init(coder:) has not been implemented")

    }

}

protocol FlippableView: UIView {
    
    var isFlipped: Bool { get set }
    var flipCompletionHandler: ((FlippableView) -> Void)? { get set }
    func flip()

}

class CircleShape: CAShapeLayer, ShapeLayerProtocol {
    
    required init(size: CGSize, fillColor: CGColor) {
       
        super.init()
        let radius = ([size.width, size.height].min() ?? 0) / 2
        let centerX = size.width / 2
        let centerY = size.height / 2
        let path = UIBezierPath(arcCenter: CGPoint(x: centerX, y: centerY), radius: radius, startAngle: 0, endAngle: .pi*2, clockwise: true)
        path.close()
        self.path = path.cgPath
        self.fillColor = fillColor
        
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    
    }
    
}

class SquareShape: CAShapeLayer, ShapeLayerProtocol {
    
    required init(size: CGSize, fillColor: CGColor) {
        
        super.init()
        let edgeSize = ([size.width, size.height].min() ?? 0)
        let rect = CGRect(x: 0, y: 0, width: edgeSize, height: edgeSize)
        let path = UIBezierPath(rect: rect)
        path.close()
        self.path = path.cgPath
        self.fillColor = fillColor
        
    }
     
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    
    }
    
}

class CrossShape: CAShapeLayer, ShapeLayerProtocol {
    
    required init(size: CGSize, fillColor: CGColor) {
        
        super.init()
        
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: size.width, y: size.height))
        path.move(to: CGPoint(x: size.width, y: 0))
        path.addLine(to: CGPoint(x: 0, y: size.height))
        self.path = path.cgPath
        self.strokeColor = fillColor
        self.lineWidth = 5
                  
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class FillShape: CAShapeLayer, ShapeLayerProtocol {
    
    required init(size: CGSize, fillColor: CGColor) {
        
        super.init()
        let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        self.path = path.cgPath
        self.fillColor = fillColor
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class BackSideCircles: CAShapeLayer, ShapeLayerProtocol {
    
    required init(size: CGSize, fillColor: CGColor) {
        
        super.init()
        let path = UIBezierPath()
        
        for _ in 1...15 {
            
            let randomX = Int.random(in: 0...Int(size.width))
            let randomY = Int.random(in: 0...Int(size.height))
            let center = CGPoint(x: randomX, y: randomY)
            path.move(to: center)
            let radius = Int.random(in: 5...15)
            path.addArc(withCenter: center, radius: CGFloat(radius), startAngle: 0, endAngle: .pi*2, clockwise: true)
        
        }
        
        self.path = path.cgPath
        self.strokeColor = fillColor
        self.fillColor = fillColor
        self.lineWidth = 1
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class BackSideLines: CAShapeLayer, ShapeLayerProtocol {
    
    required init(size: CGSize, fillColor: CGColor) {
        
        super.init()
        let path = UIBezierPath()
        
        for _ in 1...15 {
            
            let randomXStart = Int.random(in: 0...Int(size.width))
            let randomYStart = Int.random(in: 0...Int(size.height))
            let randomXEnd = Int.random(in: 0...Int(size.width))
            let randomYEnd = Int.random(in: 0...Int(size.height))
            let start = CGPoint(x: randomXStart, y: randomYStart)
            let end = CGPoint(x: randomXEnd, y: randomYEnd)
            path.move(to: start)
            path.addLine(to: end)
        
        }
        
        self.path = path.cgPath
        self.strokeColor = fillColor
        self.lineWidth = 3
        self.lineCap = .round
        
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")

    }
    
}

protocol ShapeLayerProtocol: CAShapeLayer {

    init(size: CGSize, fillColor: CGColor)
    
}

extension ShapeLayerProtocol {
    
    init() {
        
        fatalError("init() не может быть использован для создания экземпляра")
    
    }
    
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
