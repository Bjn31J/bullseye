//
//  ViewController.swift
//  bullseye
//
//  Created by Benjamin Jaramillo on 23/01/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func showAlert(){
        let alert =  UIAlertController(
            title: "! Puro XCode alv !",
            message: " Mi primera aplicación amonosssss",
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: " Salu2 ",
            style: .default,
            handler: nil)
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }

}

