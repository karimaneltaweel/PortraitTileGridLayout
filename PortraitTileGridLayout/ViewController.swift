//
//  ViewController.swift
//  PortraitTileGridLayout
//
//  Created by kariman eltawel on 22/05/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = createLayout()
    }

    func createLayout()->UICollectionViewCompositionalLayout{
        
        //item
        let smallItem = compoitionalLayout.createItem(itemWidth: .fractionalWidth(1), itemHeight: .fractionalHeight(1), itemSpacing:8)
        
        let smallItemForCenter = compoitionalLayout.createItem(itemWidth: .fractionalWidth(1), itemHeight: .fractionalHeight(0.33), itemSpacing: 8)
        
        let bigItem = compoitionalLayout.createItem(itemWidth: .fractionalWidth(1), itemHeight: .fractionalHeight(0.67), itemSpacing:8)
        
        let firstLastGroup = compoitionalLayout.createGroupWithItem(alignment: .vertical, groupWidth: .fractionalWidth(0.33), groupHeight: .fractionalHeight(1), item: smallItem, count: 3)
        
        let centerGroup = compoitionalLayout.createGroupWithItems(alignment: .vertical, groupWidth:.fractionalWidth(0.33), groupHeight: .fractionalHeight(1), items: [smallItemForCenter,bigItem])
        
        //group
        let group = compoitionalLayout.createGroupWithItems(alignment: .horizontal, groupWidth: .fractionalWidth(1), groupHeight: .fractionalHeight(0.57), items: [firstLastGroup,centerGroup,firstLastGroup])
        // section
        let section = NSCollectionLayoutSection(group: group)
        //return
        return UICollectionViewCompositionalLayout(section: section)
    }

}
extension ViewController: UICollectionViewDataSource , UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PortraitCell", for: indexPath) as! PortraitCell
        return cell
    }
    
    
}

