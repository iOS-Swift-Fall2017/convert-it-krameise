//
//  ViewController.swift
//  Convert It App
//
//  Created by Michelle Krameisen on 9/27/17.
//  Copyright © 2017 Krameisen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var fromUnitsLabel: UILabel!
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var formulaPicker: UIPickerView!
    
    var formulasArray = ["miles to kilometers",
                         "kilometers to miles",
                         "feet to meters",
                         "yards to meters",
                         "meters to feet",
                         "meters to yards"]
    
    var fromUnits = ""
    var toUnits = ""
    var conversionStrings = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formulaPicker.dataSource = self
        formulaPicker.delegate = self
    }
    
    func calculateConversion() {
        
        var outputValue = 0.0
        
        if let inputValue = Double(userInput.text!) {
            
            switch conversionStrings {
            case "miles to kilometers":
            outputValue = inputValue / 0.62137
            case "kilometers to miles":
            outputValue = inputValue * 0.62137
            case "feet to meters":
            outputValue = inputValue / 3.2808
            case "yards to meters":
            outputValue = inputValue / 1.0936
            case "meters to feet":
            outputValue = inputValue * 3.2808
            case "meters to yards":
            outputValue = inputValue * 1.0936
            default:
                print("show alert - for some reason we didn't have a ConverstionStrings")
            }
            resultsLabel.text = "\(inputValue) \(fromUnits) = \(outputValue) \(toUnits)"
            
        } else {
            print("show alert here to say the value entered was not a number")
        }
    }
    @IBAction func convertButtonPressed(_ sender: UIButton) {
    }

}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return formulasArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return formulasArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        conversionStrings = formulasArray[row]
        let unitsArray = formulasArray[row].components(separatedBy: " to ")
        fromUnits = unitsArray[0]
        toUnits = unitsArray[1]
        fromUnitsLabel.text = fromUnits
        calculateConversion()
    }
    
    
}

