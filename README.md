# XSpecialTextField

[![CI Status](https://img.shields.io/travis/Ray/XSpecialTextField.svg?style=flat)](https://travis-ci.org/Ray/XSpecialTextField)
[![Version](https://img.shields.io/cocoapods/v/XSpecialTextField.svg?style=flat)](https://cocoapods.org/pods/XSpecialTextField)
[![License](https://img.shields.io/cocoapods/l/XSpecialTextField.svg?style=flat)](https://cocoapods.org/pods/XSpecialTextField)
[![Platform](https://img.shields.io/cocoapods/p/XSpecialTextField.svg?style=flat)](https://cocoapods.org/pods/XSpecialTextField)

特殊输入框。手机号、航班号、限制字数、大小写等。

## 使用方法

```
let textField = YRSpecialTextField.init()
textField.specialType = YRSpecialTypeCapsLook.init(type: .uppercased)
textField.placeholder = "锁定大写"
```


## Installation

XSpecialTextField is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'XSpecialTextField'
```

## Author

有其他类型处理，欢迎发起PR或issue

Ray, xueyongwei@foxmail.com

## License

XSpecialTextField is available under the MIT license. See the LICENSE file for more info.
