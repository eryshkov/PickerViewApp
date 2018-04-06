//
//  IntExt.swift
//  PickerViewApp
//
//  Created by Evgeniy Ryshkov on 07.04.2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import Foundation

extension Int{
    func addZero() -> String{
        return (self >= 0)&&(self < 10) ? "0\(self)" : "\(self)"
    }
}
