//
//  ViewController.swift
//  Counter
//
//  Created by Виталий Хайдаров on 12.06.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var logText: UITextView!
    
    private let dateFormatter: DateFormatter = DateFormatter()
    
    private var counterNumber: Int = 0 {
        willSet {
            counterLabel.text = newValue.description
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Button's config
        plusButton.layer.cornerRadius = plusButton.frame.width / 2
        plusButton.layer.masksToBounds = true
        plusButton.titleLabel?.font = .systemFont(ofSize: 50)
        
        minusButton.layer.cornerRadius = minusButton.frame.width / 2
        minusButton.layer.masksToBounds = true
        minusButton.titleLabel?.font = .systemFont(ofSize: 50)
        
        resetButton.layer.cornerRadius = minusButton.frame.width / 2
        resetButton.layer.masksToBounds = true
        resetButton.titleLabel?.font = .systemFont(ofSize: 50)
        
        //Text config
        logText.text = "История изменений:\n"
        logText.isEditable = false
        
        //Time config
        dateFormatter.timeStyle = .medium
        dateFormatter.dateStyle = .medium
    }
    
    @IBAction func plusActionButton(_ sender: Any) {
        counterNumber += 1
        logText.text.append("[\(getCurrentTime())]: значение изменено на +1\n")
    }
    
    @IBAction func minusActionButton(_ sender: Any) {
        if (counterNumber > 0) {
            counterNumber -= 1
            logText.text.append("[\(getCurrentTime())]: значение изменено на -1\n")
        } else {
            logText.text.append("[\(getCurrentTime())]: попытка уменьшить значение счётчика ниже 0\n")
        }
    }
    
    @IBAction func resetActionButton(_ sender: Any) {
        counterNumber = 0
        logText.text.append("[\(getCurrentTime())]: значение сброшено\n")
    }
    
    private func getCurrentTime() -> String {
        let currentDateTime = Date()
        return self.dateFormatter.string(from: currentDateTime)
    }
}
