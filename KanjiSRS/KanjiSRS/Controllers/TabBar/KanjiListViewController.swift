//
//  KanjiListViewController.swift
//  KanjiSRS
//
//  Created by Scott Enriquez on 8/14/20.
//  Copyright © 2020 Scott Enriquez. All rights reserved.
//

import UIKit

class KanjiListViewController: UIViewController, UICollectionViewDelegate {

    enum Section {
        case main
    }
    
    var kanjiList: [Kanji] = []
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Kanji>!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureCollectionView()
        configureUICollectionViewDataSource()
        kanjiList = readKanjiListDataAsset()
        kanjiList.sort { (this, other) -> Bool in
            return this.strokeCount < other.strokeCount
        }
        updateData(with: kanjiList)
    }
    
    func readKanjiListDataAsset() -> [Kanji] {
        guard let asset = NSDataAsset(name: Asset.KanjiData.rawValue) else {
            fatalError("Missing data asset: \(Asset.KanjiData.rawValue)")
        }
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Kanji].self, from: asset.data)
        }
        catch {
            fatalError("Unable to parse kanji list from JSON: \(error.localizedDescription)")
        }
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: FlowLayoutHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(KanjiCell.self, forCellWithReuseIdentifier: KanjiCell.Configuration.reuseID.rawValue)
    }
    
    func configureUICollectionViewDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Kanji>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, kanji) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KanjiCell.Configuration.reuseID.rawValue, for: indexPath) as! KanjiCell
            cell.mapKanjiData(for: kanji)
            return cell
        })
    }
    
    func updateData(with kanjiList: [Kanji]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Kanji>()
        snapshot.appendSections([.main])
        snapshot.appendItems(kanjiList)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
    
}
