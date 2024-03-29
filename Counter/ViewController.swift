//
//  ViewController.swift
//  Counter
//
//  Created by Виталий Хайдаров on 12.06.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var counterLabel: UILabel!
    
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    
    @IBOutlet private weak var logTextView: UITextView!

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
        logTextView.text = "История изменений:\n"
        logTextView.isEditable = false
        
        //Time config
        dateFormatter.timeStyle = .medium
        dateFormatter.dateStyle = .medium
    }
    
    private func getCurrentTime() -> String {
        let currentDateTime = Date()
        return self.dateFormatter.string(from: currentDateTime)
    }
    
    private func setScrollRangeToVisible() {
        let range = NSMakeRange(logTextView.text.count - 1, 0)
        logTextView.scrollRangeToVisible(range)
    }
    
    private func log(_ message: String) {
        logTextView.text.append("[\(getCurrentTime())]: \(message)\n")
        setScrollRangeToVisible()
    }

    @IBAction private func plusActionButton(_ sender: Any) {
        counterNumber += 1
        log("значение изменено на +1")
    }

    @IBAction private func minusActionButton(_ sender: Any) {
        if (counterNumber > 0) {
            counterNumber -= 1
            log("значение изменено на -1")
        } else {
            log("попытка уменьшить значение счётчика ниже 0")
        }
    }

    @IBAction private func resetActionButton(_ sender: Any) {
        counterNumber = 0
        log("значение сброшено")
    }
}
