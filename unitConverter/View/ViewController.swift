//
//  ViewController.swift
//  unitConverter
//
//  Created by devOne on 30/01/19.
//  Copyright © 2019 yoozz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var tempInputbox: UITextField!
    @IBOutlet weak var tempOutputbox: UITextField!
    @IBOutlet weak var tempUnitPicker: UIPickerView!
    @IBOutlet weak var tempResultbox: UITextField!
    
    @IBOutlet weak var volInputbox: UITextField!
    @IBOutlet weak var volOutputbox: UITextField!
    @IBOutlet weak var volUnitPicker: UIPickerView!
    @IBOutlet weak var volResultbox: UITextField!
    
    var tempPickerData:[String] = [String]()
    var volPickerData:[String] = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        getPickerData()
        setPicker()
    }

    @IBAction func Trig_tempCalcBtn(_ sender: UIButton) {
        view.endEditing(true)
        let PickerUnitIn = tempPickerData[tempUnitPicker.selectedRow(inComponent: 0)]
        let PickerUnitOut = tempPickerData[tempUnitPicker.selectedRow(inComponent: 1)]
        let valueConv: Double? = Double(tempInputbox.text!)
        let calcInit = convertClass.init(type: "t", inputVal: valueConv ?? 0, inputUnit: PickerUnitIn, outputUnit: PickerUnitOut)
        let calcResult = calcInit?.convert()
        
        tempResultbox.text = calcResult
    }
    
    @IBAction func Tric_volBtn(_ sender: UIButton) {
        view.endEditing(true)
        let PickerUnitIn = volPickerData[volUnitPicker.selectedRow(inComponent: 0)]
        let PickerUnitOut = volPickerData[volUnitPicker.selectedRow(inComponent: 1)]
        let valueConv: Double? = Double(volInputbox.text!)
        let calcInit = convertClass.init(type: "v", inputVal: valueConv ?? 0, inputUnit: PickerUnitIn, outputUnit: PickerUnitOut)
        let calcResult = calcInit?.convert()
        
        volResultbox.text = calcResult
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        TODO
    }
    
    func getPickerData() {
        tempPickerData = ["Kelvin", "Celsius", "Fahrenheit"]
        volPickerData = ["liters", "milliliters", "gallons"]
    }
    
    func setPicker() {
        self.tempUnitPicker.delegate = self
        self.tempUnitPicker.dataSource = self
        
        self.volUnitPicker.delegate = self
        self.volUnitPicker.dataSource = self
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == tempUnitPicker {
            return tempPickerData[row]
        } else {
            return volPickerData[row]
        }
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == tempUnitPicker {
            return tempPickerData.count
        } else {
            return volPickerData.count
        }
    }

}

