//
//  temperature.swift
//  unitConverter
//
//  Created by devOne on 30/01/19.
//  Copyright © 2019 yoozz. All rights reserved.
//

import Foundation
// Convert between the following temperature units: Kelvin (K), Celsius (°C) and Fahrenheit (°F)

class convertClass {
    var convtype: String
    var inputVal: Double
    var inputUnit: String
    var outputUnit: String

    init?(type: String, inputVal: Double, inputUnit: String, outputUnit: String) {
        self.convtype = type
        self.inputVal = inputVal
        self.inputUnit = inputUnit
        self.outputUnit = outputUnit
    }
    
    func setUnit(unit: String) -> AnyObject {
        if convtype == "t" {
            switch unit {
            case "Kelvin":
                return UnitTemperature.kelvin as UnitTemperature
            case "Fahrenheit":
                return UnitTemperature.fahrenheit as UnitTemperature
            default: //"c"
                return UnitTemperature.celsius as UnitTemperature
            }
        } else { //"v"
            switch unit {
            case "gallons":
                return UnitVolume.gallons as UnitVolume
            case "milliliters":
                return UnitVolume.milliliters as UnitVolume
            default: //"liters"
                return UnitVolume.liters as UnitVolume
            }
        }
    }
    
    func convert() -> String {
        let measurementFormat = MeasurementFormatter()
        measurementFormat.locale = Locale(identifier: "en_US")
        measurementFormat.unitOptions = .providedUnit
        measurementFormat.numberFormatter.maximumFractionDigits = 0
        measurementFormat.unitStyle = .long

        let convertedVal = Measurement(value: inputVal, unit: setUnit(unit: inputUnit) as! Dimension).converted(to: setUnit(unit: outputUnit) as! Dimension).value
        let localizedString = measurementFormat.string(from: Measurement(value: convertedVal, unit: setUnit(unit: outputUnit) as! Unit))
        return localizedString
    }

}
