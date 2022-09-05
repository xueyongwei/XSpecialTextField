//
//  XSpecialType.swift
//  XSpecialTextField
//
//  Created by Ray on 2022/9/2.
//

import Foundation

/// 特殊输入框类型
public protocol XSpecialType {
    /// 编辑状态改变了
    func editingChanged(_ textField: UITextField)
}

/// 默认的类型(无操作)
struct XSpecialTypeDefault: XSpecialType {
    public func editingChanged(_ textField: UITextField){}
}
