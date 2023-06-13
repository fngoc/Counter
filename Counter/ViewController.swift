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
    
    private var counterNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Button's
        plusButton.layer.cornerRadius = plusButton.frame.width / 2
        plusButton.layer.masksToBounds = true
        plusButton.titleLabel?.font = .systemFont(ofSize: 50)
        
        minusButton.layer.cornerRadius = minusButton.frame.width / 2
        minusButton.layer.masksToBounds = true
        minusButton.titleLabel?.font = .systemFont(ofSize: 50)
    }
    
    @IBAction func plusActionButton(_ sender: Any) {
        counterNumber += 1
        counterLabel.text = counterNumber.description
    }
    
    @IBAction func minusActionButton(_ sender: Any) {
        counterNumber -= 1
        counterLabel.text = counterNumber.description
    }
    
}

