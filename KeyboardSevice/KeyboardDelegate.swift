//
//  KeyboardDelegate.swift
//  KeyboardSevice
//
//  Created by Kateryna on 19.01.2020.
//  Copyright © 2020 Icecream. All rights reserved.
//

import Foundation
import UIKit

protocol KeyboardDelegate: UIViewController {
    
    func showKeyboard(keyboardFrame: CGRect)
    func hideKeyboard()
}

