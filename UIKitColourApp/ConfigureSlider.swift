//
//  ConfigureSlider.swift
//  UIKitColourApp
//
//  Created by Ivan on 23.05.2023.
//

import UIKit

class ConfigureSlider: UISlider {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        value = 1
        minimumValue = 0
        maximumValue = 255
        maximumTrackTintColor = .systemBackground
    }
}
