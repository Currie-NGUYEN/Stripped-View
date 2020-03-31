//
//  StrippedView.swift
//  Stripped View
//
//  Created by Currie on 3/31/20.
//  Copyright © 2020 Currie. All rights reserved.
//

import UIKit

@IBDesignable class StrippedView: UIView {
    
    let backgroundDefault = UIColor.white
    
    var view: UIView?
    
    @IBInspectable public var stripColor: UIColor {
        get {
            return self.view!.backgroundColor!
        } set {
            self.view?.backgroundColor = newValue
        }
    }
    
    @IBInspectable public var lineGap: Int {
        get {
            return 38
        } set {
            //            self.view?.backgroundColor = newValue
        }
    }
    
    @IBInspectable public var lineThinkness: Int {
        get {
            return 38
        } set {
            //            self.view?.backgroundColor = newValue
        }
    }
    
    @IBInspectable public var lineStyle: Bool {
        get {
            return true
        } set {
            //            self.view?.backgroundColor = newValue
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        view = loadNib()
        view?.backgroundColor = backgroundDefault
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        view = loadNib()
    }
    
    func loadNib() -> UIView{
        let bundle = Bundle.init(for: type(of: self))
        let nib = UINib.init(nibName: "StrippedView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.center = CGPoint(x: frame.size.width  / 2,y: frame.size.height / 2);
        self.addSubview(view)
        return view
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
