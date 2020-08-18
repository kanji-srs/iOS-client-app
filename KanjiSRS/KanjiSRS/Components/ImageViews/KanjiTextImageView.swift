//
//  KanjiTextImageView.swift
//  KanjiSRS
//
//  Created by Scott Enriquez on 8/17/20.
//  Copyright © 2020 Scott Enriquez. All rights reserved.
//

import UIKit

class KanjiTextImageView: UIImageView {

    let imageSize = CGSize(width: 0, height: 0)
    let placeholderImage = UIImage(named: "sato")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func generateUIImageFromString(for kanjiCharacter: String) {
        self.image = kanjiCharacter.image(withAttributes: [.foregroundColor: UIColor.systemIndigo, .font: UIFont.systemFont(ofSize: 80.0)])
    }

}
