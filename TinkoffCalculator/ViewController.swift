//
//  ViewController.swift
//  TinkoffCalculator
//
//  Created by Anton Charnykh on 2.04.24.
//

import UIKit

enum CalculationError: Error {
    case dividedByZero
}

enum Operation: String {
    case add = "+"
    case substract = "-"
    case multiply = "x"
    case divide = "/"
    
    func calculate(_ number1: Double, _ number2: Double) throws -> Double {
        switch self {
        case .add:
            return number1 + number2
        case .substract:
            return number1 - number2
        case .multiply:
            return number1 * number2
        case .divide:
            if number2 == 0 {
                throw CalculationError.dividedByZero
            }
            return number1 / number2
        }
    }
}

enum CalculationHistoryItem {
    case number(Double)
    case operation(Operation)
}

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let buttonText  = sender.titleLabel?.text else { return }
              
              if buttonText == "," && label.text?.contains(",") == true {
                  return
              }

              if label.text == "0" && buttonText != "," {
                  label.text = buttonText
    }
    
    print(buttonText)
    }
    
    
    lazy var numberFormatter: NumberFormatter = {
         let numberFormatter = NumberFormatter()
          
          numberFormatter.usesGroupingSeparator = false
          numberFormatter.locale = Locale(identifier: "ru_RU")
          numberFormatter.numberStyle = .decimal
          
          return numberFormatter
      }()
      
    override func viewDidLoad() {
        super.viewDidLoad()
        
    print("Loading")
    }

}

