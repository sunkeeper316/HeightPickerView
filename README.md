# HeightPickerView

* ImperialPicker
--------

![Logo](https://raw.githubusercontent.com/sunkeeper316/HeightPickerView/master/Screenshots/Screenshots_I.JPG)
* MetricPicker
--------

![Logo](https://github.com/sunkeeper316/HeightPickerView/blob/master/Screenshots/Screenshots_M.JPG?raw=true)

## Installation

### Swift Package Manager

[Swift Package Manager](https://swift.org/package-manager) is a dependency manager built into Xcode.
If you are using Xcode 10 or higher, go to `File / Swift Packages / Add Package Dependency…` and enter package repository URL `https://github.com/sunkeeper316/HeightPickerView.git` then follow the instructions.

### Cocoapods

HeightPickerView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'HeightPickerView'
```

## Usage

If you're using Storyboards/Interface Builder you can create a HeightPickerView instance by adding a UITextField to your Storyboard, and then manually changing the view's class to HeightPickerView in the "Custom Class" field of the Identity Inspector tab on the Utilities panel (the right-side panel)

![IBAction](https://github.com/sunkeeper316/HeightPickerView/blob/master/Screenshots/usage.png?raw=true)

You can also create an instance of CountryPickerView programmatically:

```swift
import HeightPickerView

let hptf = HeightPickerTextField()
```

### Customization

```swift
import HeightPickerView

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfHeight: HeightPickerTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfHeight.decimalDigits = 1
        tfHeight.unitSystem = .Imperial
        tfHeight.showUnit = true
        tfHeight.value = 13.1
    }

}
```
