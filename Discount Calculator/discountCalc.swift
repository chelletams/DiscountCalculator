//
//  discountCalc.swift
//  Discount Calculator
//
//  Created by Yui Tamaki on 3/19/17.
//  Copyright © 2017 Yui Tamaki. All rights reserved.
//

import Foundation

class discountCalc {
    var amountBeforeTax: Double = 0
    var dollarsOff: Double = 0
    var discountPercent: Double = 0
    var otherDiscountPercent: Double = 0
    var taxPercent: Double = 0
    var salePrice: Double = 0
    var saleTaxPrice: Double = 0
    var tax: Double = 0
    var originalPrice: Double = 0
    var discountPrice: Double = 0
    
    init(forOriginalPrice amountBeforeTax: Double, taxPercent: Double) {
        self.amountBeforeTax = amountBeforeTax
        self.taxPercent = taxPercent
    }
    
    init(forDiscountPrice amountBeforeTax: Double, dollarsOff: Double, discountPercent: Double, otherDiscountPercent: Double, taxPercent: Double) {
        self.amountBeforeTax = amountBeforeTax
        self.dollarsOff = dollarsOff
        self.discountPercent = discountPercent
        self.otherDiscountPercent = otherDiscountPercent
        self.taxPercent = taxPercent
    }
    
    func calculateOriginal() -> Double {
        tax = amountBeforeTax * (taxPercent / 100)
        originalPrice = amountBeforeTax + tax
        return originalPrice
    }
    
    func calculateDiscount() -> Double {
        salePrice = (amountBeforeTax - dollarsOff) - (((discountPercent + otherDiscountPercent) / 100) * amountBeforeTax)
        saleTaxPrice = salePrice * (taxPercent / 100)
        discountPrice = salePrice + saleTaxPrice
        return discountPrice
    }
}
