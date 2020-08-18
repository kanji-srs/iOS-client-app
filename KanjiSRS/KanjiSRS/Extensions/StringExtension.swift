//
//  StringExtension.swift
//  KanjiSRS
//
//  Created by Scott Enriquez on 8/17/20.
//  Copyright © 2020 Scott Enriquez. All rights reserved.
//

import UIKit

extension String {

    func image(withAttributes attributes: [NSAttributedString.Key: Any]? = nil, size: CGSize? = nil) -> UIImage? {
        let size = size ?? (self as NSString).size(withAttributes: attributes)
        return UIGraphicsImageRenderer(size: size).image { _ in
            (self as NSString).draw(in: CGRect(origin: .zero, size: size),
                                    withAttributes: attributes)
        }
    }

}
