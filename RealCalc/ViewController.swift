//
//  ViewController.swift
//  RealCalc
//
//  Created by Anappindi, Pranav on 7/26/17.
//  Copyright © 2017 Anappindi, Pranav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    var hasOperation = false
    var operation = 0
    var number1 = 0.0
    var number2 = 0.0
    var nan = false
    @IBAction func SignChange(_ sender: UIButton) {
        if(display.text == "Error" || display.text == "NaN" ) {
            return
        }
        let index = (display.text!).index((display.text!).startIndex, offsetBy: 0)
        let sign = (display.text!)[index]
        if(sign == "-") {
            display.text = (display.text!).substring(from: (display.text!).index((display.text!).startIndex, offsetBy: 1))
        } else {
            display.text = "-" + (display.text!)
        }
    }
    
    @IBAction func Percentage(_ sender: UIButton) {
        if(display.text == "Error" || display.text == "NaN" ) {
            return
        }
        
        
    }
    
    
    @IBAction func Equals(_ sender: UIButton)
    {
        if(nan) {
            display.text = String("Error")
            return
        }
        if(hasOperation) {
            number2 = Double(display.text!)!
        }
        var result = number1
        if(operation == 11) {
            if(number2 == 0) {
                display.text = String("NaN")
                nan = true
                return
            }
            result = result/number2
            
        } else if(operation == 12) {
            result = result * number2
        } else if(operation == 13) {
            result = result - number2
        } else if (operation == 14) {
            result = result + number2
        }
        if(result == 0 || result/Double(Int(result)) == 1) {
            display.text = String(Int(result))
        } else {
            display.text = String(result)
        }
    }
    @IBAction func Number(_ sender: UIButton)
    {
        if((display.text!).characters.count >= 9) {
            return
        }
        if(hasOperation) {
            display.text = String(sender.tag - 1)
        }
        else {
            display.text = display.text! + String(sender.tag - 1)
        }
    }
    @IBAction func Operation(_ sender: UIButton) {
        if((display.text!).characters.count <= 0) {
            return
        }
        operation = sender.tag
        hasOperation = true
        number1 = Double(display.text!)!
        nan = false
    }
    
    @IBAction func clearOperation(_ sender: Any) {
        hasOperation = false
        display.text = ""
    }
    @IBAction func clear(_ sender: UIButton) {
        display.text = ""
        nan = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

