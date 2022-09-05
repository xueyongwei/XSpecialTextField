//
//  ViewController.swift
//  XSpecialTextField
//
//  Created by Ray on 09/05/2022.
//  Copyright (c) 2022 Ray. All rights reserved.
//

import UIKit
import XSpecialTextField

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textField = XSpecialTextField.init(frame: CGRect.init(x: 20, y: 100, width: 200, height: 40))
        textField.borderStyle = .roundedRect
        textField.placeholder = "锁定大写"
        textField.specialType = XSpecialTypeCapsLook.init(type: .uppercased)
        view.addSubview(textField)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

