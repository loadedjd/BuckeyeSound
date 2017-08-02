//
//  Constants.swift
//  SoundMap3
//
//  Created by Jared Williams on 7/29/17.
//  Copyright © 2017 Jared Williams. All rights reserved.
//

import Foundation
import UIKit

struct Colors {
    static var navigationBlue = UIColor(colorLiteralRed: 50/255, green: 204/255, blue: 255/255, alpha: 1)
    static var tacoPurple = UIColor(colorLiteralRed: 153/255, green: 0/255, blue: 204/255, alpha: 1)
    static var navigationWhite = UIColor.white
    static var textBlack = UIColor.black
}

enum Sides {
    case left
    case right
}

extension String {
    func truncate(length: Int) -> String {
        return String(self.characters.prefix(length))
    }
}
