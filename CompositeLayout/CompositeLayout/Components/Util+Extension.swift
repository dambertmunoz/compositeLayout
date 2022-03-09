//
//  Util+Extension.swift
//  CompositeLayout
//
//  Created by Dambert Louis Munoz Santillana on 8/03/22.
//

import UIKit

extension UICollectionReusableView {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}

