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
    
    @IBOutlet weak var stackView: UIStackView!
    //    @IBOutlet weak var whenToWhatContent: NSLayoutConstraint!
//    @IBOutlet weak var whenToWhat: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for subview in view.subviews {
            subview.backgroundColor = .clear
        }
        
        /* Add component to StackView programatically */
        let label = UILabel()
        label.text = "Stackview Tutorial"
        stackView.addArrangedSubview(label)
        
        /* Adding view to StackView programatically */
        /* NOTE: need to set height and width constraint */
        /* UIView doesn't have intrinsic size, not like label. Therefore we need to set width and height first */
        let newView = UIView(frame: CGRect(x: 0, y: 0, width: 128, height: 128))
        newView.backgroundColor = UIColor.red
        newView.translatesAutoresizingMaskIntoConstraints = false
        
        /* Adding constraint programatically */
        /* NOTE: Once isActive is true, we can never put it back to false */
        let heightConstraint = newView.heightAnchor.constraint(equalToConstant: 128)
//        newView.heightAnchor.constraint(equalToConstant: 128).isActive = true
//        newView.widthAnchor.constraint(equalToConstant: 128).isActive = true
        
        /* Batch constraint activation */
        NSLayoutConstraint.activate([
            heightConstraint,
            newView.widthAnchor.constraint(equalToConstant: 128)
        ])
        stackView.addArrangedSubview(newView)
        
        newView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 16).isActive = true
        
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

