// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import Foundation
import UIKit

extension UIImage {
    enum Asset : String {
        case Dot = "Dot"
        case Home = "Home"
        case More = "More"
        case Record = "Record"
        case Upload = "Upload"
        case SafecastLettersBig = "SafecastLettersBig"
        case SafecastLettersSmall = "SafecastLettersSmall"

        var image: UIImage {
            return UIImage(asset: self)
        }
    }

    convenience init(asset: Asset) {
        self.init(named: asset.rawValue)!
    }
}

