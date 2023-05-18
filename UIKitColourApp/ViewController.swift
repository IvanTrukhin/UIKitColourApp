//
//  ViewController.swift
//  UIKitColourApp
//
//  Created by Ivan on 15.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var viewColour: UIView!
    
    @IBOutlet var labelRed: UILabel!
    @IBOutlet var labelGreen: UILabel!
    @IBOutlet var labelBlue: UILabel!
    
    
    @IBOutlet var sliderRed: UISlider!
    @IBOutlet var sliderGreen: UISlider!
    @IBOutlet var sliderBlue: UISlider!
    
    
    @IBOutlet var slidersCollection: [UISlider]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewColour.layer.cornerRadius = 10
        
        // MARK: - Minimum Track Tint Color
        sliderRed.minimumTrackTintColor = .red
        sliderGreen.minimumTrackTintColor = .green
        sliderBlue.minimumTrackTintColor = .blue
        
        // MARK: - Slider Scale
        
        for slider in slidersCollection {
            configureSlider(slider)
        }
        
        func configureSlider(_ slider: UISlider) {
            slider.value = 1
            slider.minimumValue = 0
            slider.maximumValue = 255
            slider.maximumTrackTintColor = .systemBackground
        }
        
        // MARK: - label Сhange
        labelRed.text = String("Red: \(sliderRed.value)")
        labelGreen.text = String("Green: \(sliderGreen.value)")
        labelBlue.text = String("Blue: \(sliderBlue.value)")
    }
    
        // MARK: - label Change With Value Translation
    
    func changeColourView() {
        viewColour.backgroundColor = UIColor(red: CGFloat(sliderRed.value) / 255, green: CGFloat(sliderGreen.value) / 255, blue: CGFloat(sliderBlue.value) / 255, alpha: 1)
    }
    
    @IBAction func sliderRedAction(_ sender: Any) {
        labelRed.text = String("Red: \(Int(sliderRed.value))")
        changeColourView()
    }
    @IBAction func sliderGreenAcion(_ sender: Any) {
        labelGreen.text = String("Green: \(Int(sliderGreen.value))")
        changeColourView()
    }
    @IBAction func sliderBlueAction(_ sender: Any) {
        labelBlue.text = String("Blue: \(Int(sliderBlue.value))")
        changeColourView()
    }
}

