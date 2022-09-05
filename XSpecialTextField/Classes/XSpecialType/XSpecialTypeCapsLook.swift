//
//  XSpecialTypeCapsLook.swift
//  XSpecialTextField
//
//  Created by Ray on 2022/9/2.
//

import Foundation
/// 锁定大小写
public struct XSpecialTypeCapsLook: XSpecialType {
    
    public enum LookType {
        /// 字母大写
        case uppercased
        /// 字母小写
        case lowercased
    }
    
    /// 大小写锁定类型
    public let type: LookType
    
    /// type：大小写锁定类型
    public init(type: LookType){
        self.type = type
    }
    
    public func editingChanged(_ textField: UITextField){
        switch self.type {
        case .uppercased:
            let textRange: UITextRange? = textField.selectedTextRange
            textField.text = textField.text?.uppercased()
            textField.selectedTextRange = textRange
        case .lowercased:
            let textRange: UITextRange? = textField.selectedTextRange
            textField.text = textField.text?.lowercased()
            textField.selectedTextRange = textRange
        }
    }
}
