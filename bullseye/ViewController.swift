//
//  ViewController.swift
//  bullseye
//
//  Created by Benjamin Jaramillo on 23/01/23.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 50

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func showAlert(){
        let message = "The value of the slider is: \(currentValue)"
        
        let alert =  UIAlertController(
            title: "! Puro XCode alv !",
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: " OK",
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        
        present(alert,animated: true,completion: nil)
    }
    @IBAction func sliderMoved(_ slider: UISlider){
        currentValue = lroundf(slider.value)
        
    }

}

