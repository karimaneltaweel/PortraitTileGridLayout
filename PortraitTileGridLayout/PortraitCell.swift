//
//  PortraitCell.swift
//  PortraitTileGridLayout
//
//  Created by kariman eltawel on 22/05/2023.
//

import UIKit

class PortraitCell: UICollectionViewCell {
    
    @IBOutlet weak var portraitView: UIView!
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.cornerRadius = 20
        
    }
}
