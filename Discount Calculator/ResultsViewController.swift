//
//  ResultsViewController.swift
//  Discount Calculator
//
//  Created by Yui Tamaki on 3/13/17.
//  Copyright © 2017 Yui Tamaki. All rights reserved.
//

import UIKit

extension CGContext {
    func setFillColor(_ hex: Int) {
        let redColor: CGFloat = CGFloat((hex >> 16) & 0xFF) / 255.0
        let greenColor: CGFloat = CGFloat((hex >> 8) & 0xFF) / 255.0
        let blueColor: CGFloat = CGFloat(hex & 0xFF) / 255.0
        
        setFillColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1.0)
    }
}

class GraphView: UIView {
    override func draw(_ rect: CGRect) {
        // Original Price Rectangle
        let original: CGContext = UIGraphicsGetCurrentContext()!
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        let leftGuide:CGFloat = 16.0
        let topGuide:CGFloat = 56.0 + 16.0
        
        original.setFillColor(0xf97d43)
        original.fill(CGRect(x: leftGuide, y: topGuide, width: screenWidth - 205.0, height: screenHeight - 88.0))
        
        let originalPriceText = "Original Price"
        let originalAmount = String(format: "$%0.2f")
        
        let textAttributes = [
            NSFontAttributeName: UIFont(name: "Helvetica Bold", size: 16.0)!,
            NSForegroundColorAttributeName: UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        ]
        
        let originalPricePos:CGPoint = CGPoint(x: leftGuide + 16.0, y: topGuide + 16.0)
        
        originalPriceText.draw(at: originalPricePos, withAttributes: textAttributes)
        originalAmount.draw(at: CGPoint(x: leftGuide + 16.0, y: topGuide + 32.0), withAttributes: textAttributes)
        
        // Savings Price Rectangle
        let savings: CGContext = UIGraphicsGetCurrentContext()!
        let rightGuide: CGFloat = leftGuide + 170.0
        
        savings.setFillColor(0x5dfcdc)
        savings.fill(CGRect(x: rightGuide, y: topGuide, width: screenWidth - 202.0, height: screenHeight - 192.0))
        
        let savingsPriceText = "You Saved"
        let savingsAmount = String(format: "$%0.2f")
        let savingsAmountPercentage = String(format: "%0.2f%%")
        
        let savingsPricePos: CGPoint = CGPoint(x: rightGuide + 16.0, y: topGuide + 16.0)
        
        savingsPriceText.draw(at: savingsPricePos, withAttributes: textAttributes)
        savingsAmount.draw(at: CGPoint(x: rightGuide + 16.0, y: topGuide + 32.0), withAttributes: textAttributes)
        savingsAmountPercentage.draw(at: CGPoint(x: rightGuide + 16.0, y: topGuide + 48.0), withAttributes: textAttributes)
        
        // Amount Due Rectangle
        let amountOwed: CGContext = UIGraphicsGetCurrentContext()!
        let bottomGuide: CGFloat = topGuide + 168.0
        
        amountOwed.setFillColor(0x243e93)
        amountOwed.fill(CGRect(x: rightGuide, y: bottomGuide, width: screenWidth - 202.0, height: screenHeight - 256.0))
        
        let amountOwedPriceText = "You Pay"
        let amountOwedAmount = String(format: "$%0.2f")
        let amountOwedPercentage = String(format: "%0.2f%%")
        
        let amountOwedPricePos: CGPoint = CGPoint(x: rightGuide + 16.0, y: bottomGuide + 32.0)
        
        amountOwedPriceText.draw(at: amountOwedPricePos, withAttributes: textAttributes)
        amountOwedAmount.draw(at: CGPoint(x: rightGuide + 16.0, y: bottomGuide + 50.0), withAttributes: textAttributes)
        amountOwedPercentage.draw(at: CGPoint(x: rightGuide + 16.0, y: bottomGuide + 68.0), withAttributes: textAttributes)
    }
}

class ResultsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Add Swipe Right Gesture
        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
    }
    
    // Swipe Function
    func handleSwipe(_ sender:UIGestureRecognizer) {
        self.performSegue(withIdentifier: "unwindToCalculator", sender: self)
    }
    
    // Enable unwinding other views
    @IBAction func unwindToCalculatorViewConroller(segue: UIStoryboardSegue) {
        self.performSegue(withIdentifier: "unwindToCalculator", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
