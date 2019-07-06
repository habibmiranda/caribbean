//
//  UIGlobal.swift
//  Caribbean
//
//  Created by Habib Miranda-Garcia on 7/5/19.
//  Copyright © 2019 Habib Miranda-Garcia. All rights reserved.
//

import Foundation
import UIKit

public enum rgbas {
    static let a = UIColor(red: 0.7216, green: 0.7804, blue: 0.749, alpha: 0.8)
    static let b = UIColor(red: 0.8078, green: 0.7098, blue: 0.6549, alpha: 0.8)
    static let c = UIColor(red: 0.6314, green: 0.4863, blue: 0.4196, alpha: 0.8)
    static let d = UIColor(red: 0.3569, green: 0.4824, blue: 0.4784, alpha: 0.8)
    static let e = UIColor(red: 0.2353, green: 0.5333, blue: 0.4941, alpha: 0.8)
    static let white = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0)
}

public let colors: [UIColor] = [rgbas.a, rgbas.b, rgbas.c, rgbas.d, rgbas.e]

// TODO: Create Animation Class
public func countryTableViewAnimation(_ alpha: Double, _ cell: UITableViewCell, _ indexPath: IndexPath){
    UIView.animate(
        withDuration: 0.2,
        delay: 0.05 * Double(indexPath.row),
        animations: {
            cell.alpha = 1
    })
}
