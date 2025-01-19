//
//  ViewController.swift
//  Calculator
//
//  Created by Volodymyr Semenyug on 18.01.2025.
//

import UIKit

class ViewController: UIViewController {

    var input: String = ""
    
    @IBOutlet weak var calculatorInput: UILabel!
    @IBOutlet weak var calculatorResult: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        clearAll()
    }
    
    
    func clearAll() {
        input = ""
        calculatorInput.text = ""
        calculatorResult.text = ""
    }
    
    func setInput(value: String) {
        input =  input + value
        calculatorInput.text = input
    }
    
    @IBAction func allClearTap(_ sender: Any) {
        clearAll()
    }
    

    @IBAction func removeTap(_ sender: Any) {
        if (!input.isEmpty) {
            input.removeLast()
            calculatorInput.text = input
        }
    }
    
    @IBAction func percentTap(_ sender: Any) {
        setInput(value: "%")
    }
    
    @IBAction func divideTap(_ sender: Any) {
        setInput(value: "/")
    }
    
    @IBAction func multiplyTap(_ sender: Any) {
        setInput(value: "*")
    }
    @IBAction func substractTap(_ sender: Any) {
        setInput(value: "-")
    }
    
    @IBAction func addtionTap(_ sender: Any) {
        setInput(value: "+")
    }
    
    @IBAction func equalsTap(_ sender: Any) {
        if (isValidInput()) {
            let checkedInputForPercent = input.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedInputForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calculatorResult.text = resultString
        } else {
            let alert = UIAlertController(title: "InvalidInput",
          message: "Unable to calculate based on given input",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func formatResult(result: Double) -> String {
        if (result.truncatingRemainder(dividingBy: 1) == 0) {
            return String(format: "%.0f", result)
        } else {
            return String(format: "%.2f", result)
        }
    }
    
    func isValidInput() -> Bool {
        var count = 0
        var funcCharIndexes = [Int] ()
        for char in input {
            if (isSpecialCharacter(char: char)) {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        var previous : Int = -1
        var arrSize = funcCharIndexes.count
        for index in funcCharIndexes {
            if (index == 0) {
                return false
            }
            if (index == input.count - 1) {
                return false
            }
            if (previous != -1) {
                if (index - previous == 1) {
                    return false
                }
            }
            previous = index
        }
        return true;
    }
    
    func isSpecialCharacter(char: Character) -> Bool {
        return switch char {
        case "*", "/", "+", "-", "%": true
        default: false
        }
    }
    
    
    @IBAction func periodTap(_ sender: Any) {
        setInput(value: ".")
    }
    
    @IBAction func zeroTap(_ sender: Any) {
        setInput(value: "0")
    }
    
    
    @IBAction func oneTap(_ sender: Any) {
        setInput(value: "1")
    }
    
    @IBAction func twoTap(_ sender: Any) {
        setInput(value: "2")
    }
    
    @IBAction func threeTap(_ sender: Any) {
        setInput(value: "3")
    }
    
    @IBAction func fourTap(_ sender: Any) {
        setInput(value: "4")
    }
    @IBAction func fiveTap(_ sender: Any) {
        setInput(value: "5")
    }
    @IBAction func sixTap(_ sender: Any) {
        setInput(value: "6")
    }
    @IBAction func sevenTap(_ sender: Any) {
        setInput(value: "7")
    }
    @IBAction func eightTap(_ sender: Any) {
        setInput(value: "8")
    }
    @IBAction func nineTap(_ sender: Any) {
        setInput(value: "9")
    }
}

