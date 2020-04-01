//
//  StrippedView.swift
//  Stripped View
//
//  Created by Currie on 3/31/20.
//  Copyright © 2020 Currie. All rights reserved.
//

import UIKit

@IBDesignable class StrippedView: UIView {
    
    var stackView: UIStackView!
    
    @IBInspectable public var bgColor: UIColor? {
        didSet{
            self.backgroundColor = self.bgColor
        }
    }
    
    @IBInspectable public var stripColor: UIColor = .black {
        didSet{
            generateStrips(lineGap: lineGap, lineThinkness: lineThinkness, stripColor: stripColor, direction: direction)
        }
    }
    
    @IBInspectable public var lineGap: Int = 10 {
        didSet{
            generateStrips(lineGap: lineGap, lineThinkness: lineThinkness, stripColor: stripColor, direction: direction)
        }
    }
    
    @IBInspectable public var lineThinkness: Int = 10 {
       didSet {
            generateStrips(lineGap: lineGap, lineThinkness: lineThinkness, stripColor: stripColor, direction: direction)
        }
    }
    
    @IBInspectable public var direction: Int = 0 {
       didSet {
            generateStrips(lineGap: lineGap, lineThinkness: lineThinkness, stripColor: stripColor, direction: direction)
        }
    }
    
    @IBInspectable public var lineStyle: Bool {
        get {
            return true
        } set {
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func generateStrips(lineGap: Int, lineThinkness: Int, stripColor: UIColor, direction: Int){
        self.clipsToBounds = true
        stackView.removeAllArrangedSubviews()
        let width = self.frame.width
        
        let numberOfStrip = Int(width)/(lineGap+lineThinkness)
        
        for _ in 0...numberOfStrip {
            let view = UIView(frame: CGRect())
            view.backgroundColor = stripColor
            view.frame.size.height = 2000
            stackView.addArrangedSubview(view)
        }
        stackView.spacing = CGFloat(Float(lineGap))
        stackView.transform = CGAffineTransform(rotationAngle: CGFloat(Double(direction) * Double.pi/180))
    }
    
    
    func setUp(){
        stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        
        self.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
}

extension UIStackView {
    
    func removeAllArrangedSubviews() {
        
        let removedSubviews = arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
            self.removeArrangedSubview(subview)
            return allSubviews + [subview]
        }
        
        // Deactivate all constraints
        NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))
        
        // Remove the views from self
        removedSubviews.forEach({ $0.removeFromSuperview() })
    }
}
