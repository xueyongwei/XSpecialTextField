//
//  XSpecialTypePhone.swift
//  XSpecialTextField
//
//  Created by Ray on 2022/9/2.
//

import Foundation
/// 手机号
///
/// spaceIdxs所在位置插入空格，限制11位数字
public struct XSpecialTypePhone: XSpecialType {
    
    /// spaceIdxs所在位置插入空格
    public let spaceIdx: [Int]
    
    /// spaceIdxs所在位置插入空格，限制11位数字
    public init(spaceIdx: [Int]){
        self.spaceIdx = spaceIdx
    }
    
    public func editingChanged(_ textField: UITextField){
        guard let txt = textField.text else { return }
        guard let txtRange = textField.selectedTextRange else { return  }
        
        var targetCursorPostion: Int = textField.offset(from: textField.beginningOfDocument,
                                                        to: txtRange.start)
        let legalPhoneNumber = getLegalPhone(from: txt,
                                             preserve: &targetCursorPostion)
        
        let phoneNumberWithSpaces = insertSpacesInto(string: legalPhoneNumber,
                                                     preserve: &targetCursorPostion)
        textField.text = phoneNumberWithSpaces
        if let targetPostion = textField.position(from: textField.beginningOfDocument,
                                                  offset: targetCursorPostion){
            textField.selectedTextRange = textField.textRange(from: targetPostion, to: targetPostion)
        }
    }
    
    /// 获取合法的手机号，无空白及字符字母等
    func getLegalPhone(from string: String,
                       preserve cursorPosition: inout Int ) -> String{
        
        let originalCursorPosition: Int = cursorPosition
        var digitsOnlyString: String = ""
        
        let digits = CharacterSet.decimalDigits
        
        for (idx,uni) in string.unicodeScalars.enumerated() {
            if digits.contains(uni) {
                digitsOnlyString.append(String(uni))
            }else{
                if idx < originalCursorPosition {
                    cursorPosition -= 1
                }
            }
        }
        return digitsOnlyString
    }
    
    /// 在spaceIdxs所在位置插入空格
    func insertSpacesInto(string: String,
                          preserve cursorPosition: inout Int) -> String{
        
        var stringWithAddedSpaces: String = ""
        let cursorPositionInSpacelessString: Int = cursorPosition
        
        for (idx,uni) in string.unicodeScalars.enumerated() {
            if idx > 0 {
                if spaceIdx.contains(idx) {
                    stringWithAddedSpaces.append(" ")
                    if idx < cursorPositionInSpacelessString {
                        cursorPosition += 1
                    }
                }
            }
            stringWithAddedSpaces.append(String(uni))
        }
        return String(stringWithAddedSpaces.prefix(13))
    }
    
}
