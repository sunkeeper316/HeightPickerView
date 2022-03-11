import UIKit
import Foundation

public class MetricHeightPickerView : UIPickerView , UIPickerViewDelegate , UIPickerViewDataSource{
    
    var _value : Double = 0.0
    
    public var integerDigits = 3
    public var decimalDigits = 1
    
    public var value : Double  {
        set {
            self.reloadAllComponents()
            for index in 0..<self.numberOfComponents {
                if (integerDigits - index - 1) >= 0 {
                    self.selectRow((Int(newValue) / Int(pow(10.0,Double(integerDigits - index - 1))) % 10 ), inComponent: index, animated: true)
                }else if index != integerDigits {
                    print(index)
                    self.selectRow((Int(newValue * pow(10.0,Double(index - integerDigits )))  % 10 ), inComponent: index, animated: true)
                }
            }
        }
        get {
            return _value
        }
    }
    
    weak public var metricHeightdelegate:MetricHeightPickerViewDelegate?
    
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
        return integerDigits + decimalDigits + 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == (integerDigits ) {
          return 1
        }
        return 10
    }
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == (integerDigits ) {
          return "."
        }
        return String(row)
    }
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        var stringValue = ""
        for index in 0..<pickerView.numberOfComponents {
            let selectedRow = pickerView.selectedRow(inComponent: index)
            let title = self.pickerView(pickerView, titleForRow: selectedRow, forComponent: index)
            stringValue += title!
        }
        self._value = Double(stringValue)!
        metricHeightdelegate?.metricHeightPickerView(metricHeightPickerView: self,value: self.value)
    }
    
    
    
}
