//
//  StringExt.swift
//  PickerViewApp
//
//  Created by Evgeniy Ryshkov on 07.04.2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import Foundation

//Год високосный, если он делится на четыре без остатка, но если он делится на 100 без остатка, это не високосный год. Однако, если он делится без остатка на 400, это високосный год. Таким образом, 2000 г. является особым високосным годом, который бывает лишь раз в 400 лет.
extension String{
    func isLeapYear() -> Bool{
        let yearFromString = Int(self)
        guard let year = yearFromString else {return false}
        if year % 4 == 0 {
            if (year % 100 == 0) {
                if (year % 400 == 0) {
                    return true
                }else{
                    return false
                }
            }
        }
        return false
    }
}
