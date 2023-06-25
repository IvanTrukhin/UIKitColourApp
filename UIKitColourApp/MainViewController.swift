//
//  MainViewController.swift
//  UIKitColourApp
//
//  Created by Ivan on 04.06.2023.
//

import UIKit

class MainViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorVC = segue.destination as! ViewController
        colorVC.delegate = self
        colorVC.mainViewColor = view.backgroundColor
    }
}
// MARK: - ColorDelegate
extension MainViewController: ColorViewControllerDelegate {
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
