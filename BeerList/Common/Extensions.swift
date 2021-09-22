//
//  Extensions.swift
//  BeerList
//
//  Created by Roberto Herranz on 21/9/21.
//

import UIKit

extension UIView {
    static let identifier = description()
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
