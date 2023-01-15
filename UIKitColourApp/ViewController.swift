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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewColour.layer.cornerRadius = 10
        
        // MARC: Slider Scale
        sliderRed.value = 1
        sliderRed.minimumValue = 0
        sliderRed.maximumValue = 15
        sliderRed.minimumTrackTintColor = .red
        sliderRed.maximumTrackTintColor = .systemBackground
        
        sliderGreen.value = 1
        sliderGreen.minimumValue = 0
        sliderGreen.maximumValue = 5
        sliderGreen.minimumTrackTintColor = .green
        sliderGreen.maximumTrackTintColor = .systemBackground
        
        sliderBlue.value = 1
        sliderBlue.minimumValue = 0
        sliderBlue.maximumValue = 2
        sliderBlue.minimumTrackTintColor = .blue
        sliderBlue.maximumTrackTintColor = .systemBackground
        
        // MARC: label Сhange
        labelRed.text = String("Red: \(sliderRed.value)")
        labelGreen.text = String("Green: \(sliderGreen.value)")
        labelBlue.text = String("Blue: \(sliderBlue.value)")
        // Do any additional setup after loading the view.
    }
    
        // MARC: label Change With Value Translation
    
    func changeColourView() {
        viewColour.backgroundColor = UIColor(red: CGFloat(sliderRed.value), green: CGFloat(sliderGreen.value), blue: CGFloat(sliderBlue.value), alpha: 1)
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

