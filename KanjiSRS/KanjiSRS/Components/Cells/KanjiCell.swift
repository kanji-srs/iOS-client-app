//
//  KanjiCell.swift
//  KanjiSRS
//
//  Created by Scott Enriquez on 8/17/20.
//  Copyright © 2020 Scott Enriquez. All rights reserved.
//

import UIKit

class KanjiCell: UICollectionViewCell {
    
    enum Configuration: String {
        case reuseID = "KanjiCell"
    }
    
    let defaultPadding: CGFloat = 8
    let kanjiImageView = KanjiTextImageView(frame: .zero)
    let kanjiLabel = KanjiTitleLabel(textAlignment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func mapKanjiData(for kanji: Kanji) {
        kanjiLabel.text = kanji.name
        kanjiImageView.generateUIImageFromString(for: kanji.character)
    }
    
    func configure() {
        addSubview(kanjiImageView)
        addSubview(kanjiLabel)
        NSLayoutConstraint.activate([
            kanjiImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: defaultPadding),
            kanjiImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: defaultPadding),
            kanjiImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -defaultPadding),
            kanjiImageView.heightAnchor.constraint(equalTo: kanjiImageView.widthAnchor),
            kanjiLabel.topAnchor.constraint(equalTo: kanjiImageView.bottomAnchor, constant: 12),
            kanjiLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: defaultPadding),
            kanjiLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -defaultPadding),
            kanjiLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
