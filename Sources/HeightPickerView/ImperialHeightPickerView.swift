
import UIKit
import Foundation

public class ImperialHeightPickerView : UIPickerView , UIPickerViewDelegate , UIPickerViewDataSource{

    
    var _ftValue = 0
    var _inchValue : Double = 0.0
    var _value : Double = 0.0
    
    public var ftDigits = 1
    public var decimalDigits = 1
    public var ftValue : Int { return _ftValue }
    public var inchValue : Double { return _inchValue }
    
    public var value : Double  {
        set {
            self.reloadAllComponents()
            for index in 0..<self.numberOfComponents {
                if (ftDigits - index - 1) >= 0 {
                    let ft = Int(newValue / 12)
                    
                    self.selectRow((ft / Int(pow(10.0,Double(ftDigits - index - 1))) % 10 ), inComponent: index, animated: true)
                }else if index == (ftDigits + 1) {
                    let inchInt = Int(newValue) % 12
                    self.selectRow(inchInt, inComponent: index, animated: true)
                }else if index > (ftDigits + 2) && index < (self.numberOfComponents - 1 ){
                    self.selectRow((Int(newValue * pow(10.0,Double(index - ftDigits - 2 )))  % 10 ), inComponent: index, animated: true)
                }
            }
        }
        get {
            return _value
        }
    }
    
    weak public var imperialHeightdelegate:ImperialHeightPickerViewDelegate?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
        self.dataSource = self
        
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate = self
        self.dataSource = self
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return ftDigits + decimalDigits + 4
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == ftDigits  || component == (ftDigits + 2) || component == pickerView.numberOfComponents - 1{
          return 1
        }else if component == (ftDigits + 1) {
            return 12
        }
        return 10
    }
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == ftDigits {
          return "'"
        }else if component == (ftDigits + 2) {
            return "."
        }else if component == pickerView.numberOfComponents - 1 {
            return "\""
        }
        return String(row)
    }
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        var ftStringValue = ""
        var inchStringValue = ""
        for index in 0..<pickerView.numberOfComponents {
            if index < ftDigits {
                let selectedRow = pickerView.selectedRow(inComponent: index)
                let title = self.pickerView(pickerView, titleForRow: selectedRow, forComponent: index)
                ftStringValue += title!
                _ftValue = Int(ftStringValue)!
            }else if index < (ftDigits + decimalDigits + 3) &&  index > (ftDigits){
                let selectedRow = pickerView.selectedRow(inComponent: index)
                let title = self.pickerView(pickerView, titleForRow: selectedRow, forComponent: index)
                inchStringValue += title!
                if let v = Double(inchStringValue) {
                    _inchValue = v
                }
                
            }
            
        }
        
        self._value = Double(_ftValue * 12) + _inchValue

        imperialHeightdelegate?.imperialHeightPickerView(imperialHeightPickerView: self,value: self.value , ftValue : self._ftValue , inchValue : _inchValue)
    }
    
    
    
}
