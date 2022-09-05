//
//  XSpecialTextField.swift
//  SpecialTextField
//
//  Created by Ray on 2021/9/15.
//

import UIKit

/// 特殊的输入框
open class XSpecialTextField: UITextField {
    
    /// 特殊类型
    public var specialType: XSpecialType = XSpecialTypeDefault() {
        didSet{
            format()
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubviews()
    }
    
    private func setupSubviews(){
        addTarget(self, action: #selector(format), for: .editingChanged)
    }
    
    @objc private func format() {
        self.specialType.editingChanged(self)
    }
}
