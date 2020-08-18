//
//  KanjiListViewController.swift
//  KanjiSRS
//
//  Created by Scott Enriquez on 8/14/20.
//  Copyright © 2020 Scott Enriquez. All rights reserved.
//

import UIKit

class KanjiListViewController: UIViewController {

    var kanjiList: [Kanji] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        readKanjiListDataAsset()
    }
    
    func readKanjiListDataAsset() {
        guard let asset = NSDataAsset(name: Asset.KanjiData.rawValue) else {
            fatalError("Missing data asset: \(Asset.KanjiData.rawValue)")
        }
        do {
            let decoder = JSONDecoder()
            let kanjiList = try decoder.decode([Kanji].self, from: asset.data)
            print(kanjiList.count)
        }
        catch {
            fatalError("Unable to parse kanji list from JSON: \(error.localizedDescription)")
        }
    }
    
}
