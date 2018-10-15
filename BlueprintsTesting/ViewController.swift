//
//  ViewController.swift
//  BlueprintsTesting
//
//  Created by Chris on 15/10/2018.
//  Copyright © 2018 EMIS Health. All rights reserved.
//

import Blueprints
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    let useBlueprintLayout = true

    override func viewDidLoad() {
        super.viewDidLoad()

        configureCollectionView()
    }
}

extension ViewController {

    func configureCollectionView() {
        if useBlueprintLayout {
            configureBlueprintLayout()
        } else {
            configureStandardLayout()
        }
        collectionView.dataSource = self
    }

    func configureBlueprintLayout() {
        let blueprintLayout = VerticalBlueprintLayout(
            itemsPerRow: 1.0,
            itemSize: CGSize(width: 200, height: 60),
            minimumInteritemSpacing: 10,
            minimumLineSpacing: 10,
            sectionInset: EdgeInsets(top: 10, left: 10, bottom: 10, right: 10),
            stickyHeaders: true,
            stickyFooters: false
        )
        blueprintLayout.headerReferenceSize = CGSize(width: 200, height: 60)
        blueprintLayout.sectionHeadersPinToVisibleBounds = true
        collectionView.collectionViewLayout = blueprintLayout
    }

    func configureStandardLayout() {
        let layout = collectionView.collectionViewLayout as? CollectionViewFlowLayout
        layout?.sectionHeadersPinToVisibleBounds = true
        layout?.estimatedItemSize = CGSize(width: 200, height: 60)
    }
}

extension ViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testCell",
                                                      for: indexPath)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                     withReuseIdentifier: "testHeader",
                                                                     for: indexPath)
        return header
    }
}
