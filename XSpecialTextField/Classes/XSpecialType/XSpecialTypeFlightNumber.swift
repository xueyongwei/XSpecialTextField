//
//  XSpecialTypeFlightNumber.swift
//  XSpecialTextField
//
//  Created by Ray on 2022/9/2.
//

import Foundation
/// 航班号
///
/// 格式：大写字母与数字，最多十位
public struct XSpecialTypeFlightNumber: XSpecialType {
    
    public init(){}
    
    public func editingChanged(_ textField: UITextField){
        guard let txt = textField.text else { return }
        guard let txtRange = textField.selectedTextRange else { return  }
        
        var targetCursorPostion: Int = textField.offset(from: textField.beginningOfDocument,
                                              to: txtRange.start)
        let flightNumber = getflightNumber(from: txt,
                                             preserve: &targetCursorPostion)
        textField.text = flightNumber
        if let targetPostion = textField.position(from: textField.beginningOfDocument,
                                        offset: targetCursorPostion){
            textField.selectedTextRange = textField.textRange(from: targetPostion, to: targetPostion)
        }
    }
    
    /// 获取航班号，格式：大写字母与数字，最多十位
    func getflightNumber(from string: String,
                         preserve cursorPosition: inout Int ) -> String {
        
        let originalCursorPosition: Int = cursorPosition
        var digitsOnlyString: String = ""
        
        let digits = CharacterSet.decimalDigits
        let letters = CharacterSet.letters
        let allowed = digits.union(letters)
        
        for (idx,uni) in string.unicodeScalars.enumerated() {
            if allowed.contains(uni) {
                digitsOnlyString.append(String(uni).uppercased())
            }else{
                if idx < originalCursorPosition {
                    cursorPosition -= 1
                }
            }
        }
        return String(digitsOnlyString.prefix(10))
    }
}
