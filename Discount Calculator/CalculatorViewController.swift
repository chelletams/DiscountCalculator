//
//  CalculatorViewController.swift
//  Discount Calculator
//
//  Created by Yui Tamaki on 3/13/17.
//  Copyright © 2017 Yui Tamaki. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtDollarsOff: UITextField!
    @IBOutlet weak var txtDiscount: UITextField!
    @IBOutlet weak var txtOtherDiscount: UITextField!
    @IBOutlet weak var lblOriginalPrice: UILabel!
    @IBOutlet weak var lblDiscountPrice: UILabel!
    @IBOutlet weak var txtTax: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtPrice.delegate = self

        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
    }
    
    func handleSwipe(_ sender: UIGestureRecognizer) {
        self.performSegue(withIdentifier: "showResults", sender: self)
    }
    
    @IBAction func unwindToCalculatorViewController(segue: UIStoryboardSegue) {
        //self.performSegue(withIdentifier: "unwindToCalculator", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func priceDidChange(_ sender: Any) {
        //calcOriginal()
    }
    
    @IBAction func taxPriceChanged(_ sender: Any) {
        calcOriginal()
        calcDiscount()
    }
    
    func calcOriginal() {
        let amountBeforeTax = Double(txtPrice.text!)
        let taxPercent = Double(txtTax.text!)
        let originalAmount = discountCalc(forOriginalPrice: amountBeforeTax!, taxPercent:taxPercent!)
        
        lblOriginalPrice.text = String(format: "$%0.2f", originalAmount.calculateOriginal())
    }
    
    func calcDiscount() {
        let amountBeforeTax = Double(txtPrice.text!)
        let taxPercent = Double(txtTax.text!)
        let dollarsOff = Double(txtDollarsOff.text!)
        let discountPercent = Double(txtDiscount.text!)
        let otherDiscountPercent = Double(txtOtherDiscount.text!)
        let discountAmount = discountCalc(forDiscountPrice: amountBeforeTax!,  dollarsOff: dollarsOff!, discountPercent: discountPercent!, otherDiscountPercent: otherDiscountPercent!, taxPercent: taxPercent!)
        
        lblDiscountPrice.text = String(format: "$%0.2f", discountAmount.calculateDiscount())
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if(segue.identifier == "showResults") {
            if let origPrice = segue.destination as! ResultsViewController {
                origPrice.price = txtPrice.text
            }
        }
    }*/
}
