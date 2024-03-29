//
//  ViewController.swift
//  bullseye
//
//  Created by Benjamin Jaramillo on 23/01/23.
//

import UIKit

class ViewController: UIViewController {
    var targetValue = 0
    var currentValue: Int = 25
    var score = 0
    var round = 0
    @IBOutlet  var slider: UISlider!
    @IBOutlet var targetLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        let thumbImageNormal = UIImage(named:  "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        let thumbImageHighlighted = UIImage(
            named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        let insets = UIEdgeInsets(
            top: 0,
            left: 14,
            bottom: 0,
            right: 14)
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        // Do any additional setup after loading the view.
    }
    @IBAction func showAlert(){
        let difference = abs(targetValue-currentValue)
        var points = 100 - difference
        
        
        let title: String
        if difference == 0 {
            title = " ¡Perro perfecto! "
            points += 100
        }else if difference < 5 {
            title = " ¡Casi prro! "
            if difference == 1 {
                points += 50
            }
        }else if difference < 10{
            title = " ¡ Estuvo 2,3..! "
        }else {
            title = " ¡ UYYYY no ,ni juegues ! "
        }
        score += points
        
        let message = "You scored \(points) points " +
        "\nThe value of the slider is: \(currentValue)" +
        "\nThe target value is: \(targetValue)"
       
        
        let alert =  UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: " OK",
            style: .default,
            handler: { _ in
                self.startNewRound()
            })
        
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
    @IBAction func sliderMoved(_ slider: UISlider){
        currentValue = lroundf(slider.value)
        
    }
    func startNewRound(){
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    @IBAction func startNewGame(){
        score = 0
        round = 0
        startNewRound()
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(
            name: CAMediaTimingFunctionName.easeOut)
        view.layer.add(transition, forKey: nil)
    
    }
    
}

