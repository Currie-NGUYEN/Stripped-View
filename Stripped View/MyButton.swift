//
//  MyButton.swift
//  Stripped View
//
//  Created by Currie on 3/31/20.
//  Copyright © 2020 Currie. All rights reserved.
//

import UIKit

@IBDesignable class MyButton: UIButton {

    public override init(frame: CGRect) {
            super.init(frame: frame)
            setTitle("MyTitle", for: .normal)
            setTitleColor(UIColor.blue, for: .normal)
        }
    public required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
    
    @IBInspectable
    public var cornerRadius: CGFloat = 2.0 {
        didSet {
              self.layer.cornerRadius = self.cornerRadius
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
