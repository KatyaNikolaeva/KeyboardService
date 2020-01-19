//
//  KeyboardService.swift
//  KeyboardSevice
//
//  Created by Kateryna on 19.01.2020.
//  Copyright © 2020 Icecream. All rights reserved.
//

import UIKit

final class KeyboardService {
    
    private weak var delegate: KeyboardDelegate?
    
    init(delegate: KeyboardDelegate) {
        self.delegate = delegate
    }
}

// MARK: - Public
extension KeyboardService {
    
    func changeKeyboardObservers(active: Bool) {
        if active {
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardShown), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
        } else {
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    }
}

// MARK: - Private
@objc private extension KeyboardService {
    
    func keyboardShown(notification: NSNotification) {
        let keyboardFrame: CGRect = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        delegate?.showKeyboard(keyboardFrame: keyboardFrame)
        UIView.animate(withDuration: 0.3) {
            self.delegate?.view.layoutIfNeeded()
        }
    }
    
    func keyboardHidden(notification: NSNotification) {
        delegate?.hideKeyboard()
        UIView.animate(withDuration: 0.3) {
            self.delegate?.view.layoutIfNeeded()
        }
    }
}
