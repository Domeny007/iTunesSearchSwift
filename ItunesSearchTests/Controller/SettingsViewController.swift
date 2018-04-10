import UIKit
import Foundation

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var settingsPickerView: UIPickerView!
    
    @IBOutlet weak var numberOfRowsPickerView: UIPickerView!
    
    var rowsSetting:[String] = []
    
    
    @IBOutlet weak var settingsUILabel: UILabel!
    var selectedSetting: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doso()
    }
    
    //    MARK: - Passing data to Content View Controller
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let myVC = storyboard?.instantiateViewController(withIdentifier: "SearchVC") as? ContentViewController
        let defaults = UserDefaults.standard
        if pickerView == settingsPickerView {
            let settingsKey = String(row)
            defaults.set(settingsKey, forKey: mediaKey)
            defaults.set(mediaSettings[row], forKey: settingsKey)
            
            myVC?.mediaString = mediaSettings[row]
            
        } else if pickerView == numberOfRowsPickerView {
            let settingsKey = String(row) + "number"
            defaults.set(settingsKey, forKey: numberOfRowsKey)
            defaults.set(rowsSetting[row], forKey: settingsKey)
            myVC?.numberOfRowsString = rowsSetting[row]
        }
        
        }
    
    //    MARK: - Filling the Picker View Controller
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == settingsPickerView {
            return mediaSettings[row]
        } else if pickerView == numberOfRowsPickerView{

            return rowsSetting[row]
        } else {
            return ""
        }
    }
    
    
    //    MARK: - Picker View Data Source methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == settingsPickerView {
            return mediaSettings.count
        } else if pickerView == numberOfRowsPickerView{
            return rowsSetting.count
        } else {
            return 0
        }
        
    }
    func doso() {
        for i in 1..<201 {
            rowsSetting.append(String(i))
        }
    }
    
}
