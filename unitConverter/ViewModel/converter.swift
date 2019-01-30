//
//  temperature.swift
//  unitConverter
//
//  Created by devOne on 30/01/19.
//  Copyright © 2019 yoozz. All rights reserved.
//

import Foundation
// Convert between the following temperature units: Kelvin (K), Celsius (°C) and Fahrenheit (°F)

class temperatureClass {
    var inputVal: Double
    var inputUnit: String
    var outputUnit: String

    let celsius = UnitTemperature.celsius
    let kelvin = UnitTemperature.kelvin
    let fahrenheit = UnitTemperature.fahrenheit
    
    init?(inputVal: Double, inputUnit: String, outputUnit: String) {
        self.inputVal = inputVal
        self.inputUnit = inputUnit
        self.outputUnit = outputUnit
    }
    
    func setinputVal() -> Measurement<UnitTemperature> {
        switch inputUnit {
        case "Kelvin":
            return Measurement(value: inputVal, unit: kelvin)
        case "Fahrenheit":
            return Measurement(value: inputVal, unit: fahrenheit)
        default: //"c"
            return Measurement(value: inputVal, unit: celsius)
        }
    }

    func getoutputTypeConveted() -> UnitTemperature {
        switch outputUnit {
        case "Kelvin":
            return kelvin
        case "Fahrenheit":
            return fahrenheit
        default: //"c"
            return celsius
        }
    }
    
    func convert() -> String {
        let inputValConverted: Measurement<UnitTemperature> = setinputVal()
        
        let OutputValueUnitConverted: UnitTemperature = getoutputTypeConveted()
        let converted = inputValConverted.converted(to: OutputValueUnitConverted)
        
        return MeasurementFormatter.string(converted)
        
        let measurementFormatter = MeasurementFormatter()
        measurementFormatter.locale = Locale(identifier: "en_US")
        measurementFormatter.unitOptions = .providedUnit
        measurementFormatter.numberFormatter.maximumFractionDigits = 0
        measurementFormatter.unitStyle = .long
        
        let meters: Double = 1839
        let localizedString = measurementFormatter.string(from: Measurement(value: meters.metersToFeet, unit: UnitLength.feet))
        
        localizedString //   // "6,033 feet"
    }

}

extension Double {
    var kelvintofahrenheit: Double {
        return Measurement(value: self, unit: UnitTemperature.kelvin).converted(to: UnitTemperature.fahrenheit).value
    }
    var metersToFeet: Double {
        return Measurement(value: self, unit: UnitLength.meters).converted(to: UnitLength.feet).value
    }
}
