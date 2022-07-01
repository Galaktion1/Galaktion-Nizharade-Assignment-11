//
//  ViewController.swift
//  Assignment #11
//
//  Created by Gaga Nizharadze on 30.06.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstLabel: UILabel!
    
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var thirdLabel: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var sliderValueLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        sliderValueLabel.text = "\(Int(sender.value))"
        configureUIElements(sliderMaximum: sender.value)
        
        print(sender.value)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        textField.returnKeyType = UIReturnKeyType.done
        configureUIElements(sliderMaximum: 100)
        slider.value = divided
        sliderValueLabel.text = "\(Int(divided))"
        
        // Do any additional setup after loading the view.
    }
    
    var randomFloatsArray = [Float]()
    var maximum = Float()
    var minimum = Float()
    var divided = Float()
    
    private func configureUIElements(sliderMaximum: Float) {
        
        for _ in 0 ..< 3 {
            randomFloatsArray = [(Float.random(in: 0 ..< sliderMaximum)),
                               (Float.random(in: 0 ..< sliderMaximum)),
                               (Float.random(in: 0 ..< sliderMaximum))]
        }
        

        firstLabel.text  = "\(randomFloatsArray[0])"
        secondLabel.text = "\(randomFloatsArray[1])"
        thirdLabel.text  = "\(randomFloatsArray[2])"
        
        maximum = randomFloatsArray.max()!
        minimum = randomFloatsArray.min()!
        divided = (maximum + minimum) / 2
        
        slider.minimumValue = 0.1
        slider.maximumValue = 100
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        textField.resignFirstResponder()  //if desired
        performAction()
        return true
    }
    
    func setCorrcetValueOnResultLabel(value: Float) {
        resultLabel.text = "\(value)"
        resultLabel.font = resultLabel.font.withSize(30)
    }

    func performAction() {
        
        switch textField.text?.lowercased() {
        case "maximum":
            setCorrcetValueOnResultLabel(value: maximum)
        case "minimum":
            setCorrcetValueOnResultLabel(value: minimum)
        case "average":
            setCorrcetValueOnResultLabel(value: randomFloatsArray.reduce(0, +) / Float(randomFloatsArray.count))

        default:
            resultLabel.font = resultLabel.font.withSize(UIScreen.main.bounds.width / 3)
            resultLabel.text = "👻"
            
        //action events
    }


    }
}
