//
//  StackViewViewController.swift
//  Advance UI 1
//
//  Created by Oscar Yuandinata on 01/11/18.
//

import UIKit

class StackViewViewController: UIViewController {
    @IBOutlet weak var whatContent: UILabel!
    @IBOutlet weak var whenContent: UILabel!
    @IBOutlet weak var whereContent: UILabel!
    @IBOutlet weak var btnWhat: UIButton!
    @IBOutlet weak var btnWhen: UIButton!
    @IBOutlet weak var btnWhere: UIButton!
    
//    @IBOutlet weak var whenToWhatContent: NSLayoutConstraint!
//    @IBOutlet weak var whenToWhat: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for subview in view.subviews {
            subview.backgroundColor = .clear
        }
    }

    @IBAction func hideWhat(_ sender: Any) {
        whatContent.isHidden = !whatContent.isHidden
        btnWhat.setTitle(whatContent.isHidden ? "Show" : "Hide", for: .normal)
        
        /* This constant is used to make UI responsive */
        /* The number should be between 750 - 1000, because default priority is 1000 */
        /* However this code is boilerplate in big projects. Solution: StackView */
//        whenToWhat.priority = UILayoutPriority(rawValue: whatContent.isHidden ? 950 : 900)
//        whenToWhatContent.priority = UILayoutPriority(rawValue: whatContent.isHidden ? 900 : 950)
    }
    
    @IBAction func hideWhen(_ sender: Any) {
        whenContent.isHidden = !whenContent.isHidden
        btnWhen.setTitle(whenContent.isHidden ? "Show" : "Hide", for: .normal)
    }
    
    @IBAction func hideWhere(_ sender: Any) {
        whereContent.isHidden = !whereContent.isHidden
        btnWhere.setTitle(whereContent.isHidden ? "Show" : "Hide", for: .normal)
    }
}

