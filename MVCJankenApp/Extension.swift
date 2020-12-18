//
//  Extension.swift
//  MVCJankenApp
//
//  Created by 大塚周 on 2020/12/18.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach(addSubview(_:))
    }
}
