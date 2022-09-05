//
//  XSpecialTypeLimit.swift
//  XSpecialTextField
//
//  Created by Ray on 2022/9/2.
//

import Foundation
/// 限制字数
public struct XSpecialTypeCountLimit: XSpecialType {
    /// 限制的字数
    public let count: Int
    
    /// count：限制的字数
    public init(count: Int){
        self.count = count
    }
    
    public func editingChanged(_ textField: UITextField){
        guard let txt = textField.text else { return }
        let textRange: UITextRange? = textField.selectedTextRange
        textField.text = String(txt.prefix(count))
        textField.selectedTextRange = textRange
    }
}
