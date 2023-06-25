//
//  ViewController.swift
//  UIKitColourApp
//
//  Created by Ivan on 15.01.2023.
//

import UIKit

protocol ColorViewControllerDelegate {
    func setColor(_ color: UIColor)
}

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var viewColor: UIView!
    
    @IBOutlet var labelRed: UILabel!
    @IBOutlet var labelGreen: UILabel!
    @IBOutlet var labelBlue: UILabel!
    
    @IBOutlet var sliderRed: UISlider!
    @IBOutlet var sliderGreen: UISlider!
    @IBOutlet var sliderBlue: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    //MARK: - Public Properties
    var delegate: ColorViewControllerDelegate!
    var mainViewColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewColor.layer.cornerRadius = 15
        
        sliderRed.tintColor = .red
        sliderGreen.tintColor = .green
        sliderBlue.tintColor = .blue
        
        viewColor.backgroundColor = mainViewColor
        
        setSliders()
        setValue(for: labelRed, labelGreen, labelBlue)
        setValue(for: redTextField, greenTextField, blueTextField)
        addDoneButton(to: redTextField, greenTextField, blueTextField)
        
//        // MARK: - Minimum Track Tint Color
//        sliderRed.minimumTrackTintColor = .red
//        sliderGreen.minimumTrackTintColor = .green
//        sliderBlue.minimumTrackTintColor = .blue
//
//        // MARK: - label Сhange
//        labelRed.text = String("Red: \(sliderRed.value)")
//        labelGreen.text = String("Green: \(sliderGreen.value)")
//        labelBlue.text = String("Blue: \(sliderBlue.value)")
    }
    
        // MARK: - label Change With Value Translation
//    func changeColorView() {
//        viewColor.backgroundColor = UIColor(red: CGFloat(sliderRed.value) / 255, green: CGFloat(sliderGreen.value) / 255, blue: CGFloat(sliderBlue.value) / 255, alpha: 1)
//    }
    
    // MARK: - IB Actions
    
    @IBAction func colorSlider(_ sender: UISlider) {
        
        switch sender.tag {
        case 0:
            setValue(for: labelRed)
            setValue(for: redTextField)
        case 1:
            setValue(for: labelGreen)
            setValue(for: greenTextField)
        case 2:
            setValue(for: labelBlue)
            setValue(for: blueTextField)
        default:
            break
        }
        
        setColor()
    }
    
    
    @IBAction func doneButtonPressed() {
        delegate?.setColor(viewColor.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    
//    @IBAction func sliderRedAction(_ sender: Any) {
//        labelRed.text = String("Red: \(Int(sliderRed.value))")
//        changeColorView()
//    }
//    @IBAction func sliderGreenAcion(_ sender: Any) {
//        labelGreen.text = String("Green: \(Int(sliderGreen.value))")
//        changeColorView()
//    }
//    @IBAction func sliderBlueAction(_ sender: Any) {
//        labelBlue.text = String("Blue: \(Int(sliderBlue.value))")
//        changeColorView()
//    }
}

// MARK: - Private Methods
extension ViewController {
    
    private func setColor() {
        viewColor.backgroundColor = UIColor(
            red: CGFloat(sliderRed.value),
            green: CGFloat(sliderGreen.value),
            blue: CGFloat(sliderBlue.value),
            alpha: 1)
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: labelRed.text = string(from: sliderRed)
            case 1: labelGreen.text = string(from: sliderGreen)
            case 2: labelBlue.text = string(from: sliderBlue)
            default: break
            }
        }
    }
    
    private func setValue(for textFields: UITextField...) {
        textFields.forEach {
            textField in
            switch textField.tag {
            case 0: redTextField.text = string(from: sliderRed)
            case 1: greenTextField.text = string(from: sliderGreen)
            case 2: blueTextField.text = string(from: sliderBlue)
            default: break
            }
        }
    }
    
    private func setSliders() {
        let ciColor = CIColor(color: mainViewColor)
        sliderRed.value = Float(ciColor.red)
        sliderGreen.value = Float(ciColor.green)
        sliderBlue.value = Float(ciColor.blue)
    }
    
    // MARK: - Meaning sliders
    private func string(from slider: UISlider) -> String {
        return String(format: "%.2f", slider.value)
    }
    
    private func addDoneButton(to textFields: UITextField...) {
        
        textFields.forEach { textField in
            let keyboardToolbar = UIToolbar()
            textField.inputAccessoryView = keyboardToolbar
            keyboardToolbar.sizeToFit()
            
            let doneButton = UIBarButtonItem(
                title: "Done",
                style: .done,
                target: self,
                action: #selector(didTapDone)
            )
            
            let flexBarButton = UIBarButtonItem(
                barButtonSystemItem: .flexibleSpace, target: nil, action: nil
            )
            
            keyboardToolbar.items = [flexBarButton, doneButton]
        }
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    
    private func showAlert(titel: String, messege: String) {
        let alert = UIAlertController(title: titel, message: messege, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextViewDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    private func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text else {
            return
        }
        
        if let currentValue = Float(text), currentValue <= 1 {
            switch textField.tag {
            case 0:
                sliderRed.setValue(currentValue, animated: true)
                setValue(for: labelRed)
            case 1:
                sliderGreen.setValue (currentValue, animated: true)
                setValue(for: labelGreen)
            case 2:
                sliderBlue.setValue(currentValue, animated: true)
                setValue(for: labelBlue)
            default:
                break
            }
            
            setColor()
            return
        }
        
        showAlert(titel: "Wrong format!", messege: "Please enter correct value")
    }
}
