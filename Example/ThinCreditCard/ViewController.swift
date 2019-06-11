//
//  ViewController.swift
//  ThinCreditCard
//
//  Created by tsarikovskiy on 12/14/2017.
//  Copyright (c) 2017 tsarikovskiy. All rights reserved.
//

import UIKit
import ThinCreditCard

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var cardNumberLabel: UILabel!
    @IBOutlet weak var cardExpirationLabel: UILabel!
    @IBOutlet weak var cardCvcLabel: UILabel!
    @IBOutlet weak var cardNumberView: CreditCardValidatorView!
    
    var cardNumber : String?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        cardNumberView.delegate = self
        cardNumberView.setFont(font: UIFont(name: "HelveticaNeue-Bold", size: 20.0)!)
        cardNumberView.setTextColor(textColor: UIColor.blue)
        cardNumberView.backgroundColor = UIColor.gray
    }
}

// MARK: - CreditCardValidatorViewDelegate
extension ViewController: CreditCardValidatorViewDelegate {
    func didEdit(number: String) {
        cardNumber = number
        cardNumberLabel.text = "Number: " + number
    }
    
    func didEdit(expiryDate: String) {
        cardExpirationLabel.text = "Expiry Date: " + expiryDate
    }
    
    func didEdit(cvc: String) {
        cardCvcLabel.text = "CVC: " + cvc
    }
    
    func willStartEdit() -> String? {
        return cardNumber
    }
}

