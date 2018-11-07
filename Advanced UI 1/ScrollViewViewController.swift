//
//  ScrollViewViewController.swift
//  Advance UI 1
//
//  Created by Oscar Yuandinata on 01/11/18.
//

import UIKit

class ScrollViewViewController: UIViewController {
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var addressInput: UITextField!
    @IBOutlet weak var hobbiesInput: UITextField!
    @IBOutlet weak var favFoodInput: UITextField!
    @IBOutlet weak var favBeverageInput: UITextField!
    @IBOutlet weak var nicknameInput: UITextField!
    @IBOutlet weak var additionalInfoInput: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide(_:)), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    @IBAction func submit(_ sender: Any) {
        hideKeyboard()
        
        let alert = UIAlertController(title: "Submit", message: "Success", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func keyboardDidShow(_ notification: Notification) {
        adjustInsetForKeyboardShow(true, notification: notification)
    }
    
    @objc func keyboardDidHide(_ notification: Notification) {
        adjustInsetForKeyboardShow(false, notification: notification)
    }
    
    func adjustInsetForKeyboardShow(_ show: Bool, notification: Notification) {
        let userInfo = notification.userInfo ?? [:]
        let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let adjustmentHeight = (keyboardFrame.height + 20) * (show ? 1 : -1)
        scrollView.contentInset.bottom += adjustmentHeight
        scrollView.scrollIndicatorInsets.bottom += adjustmentHeight
    }
}

extension ScrollViewViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameInput:
            addressInput.becomeFirstResponder()
        case additionalInfoInput:
            hobbiesInput.becomeFirstResponder()
        case hobbiesInput:
            favFoodInput.becomeFirstResponder()
        case additionalInfoInput:
            hideKeyboard()
        default:
            return false
        }
        return true
    }
}
