//
//  CollectionViewCell.swift
//  The Calculator
//
//  Created by  Alexander on 30.11.2019.
//  Copyright © 2019  Alexander. All rights reserved.
//

import UIKit

struct CollectionViewCellModel {
    let titleText: String
    let backgroundColor: UIColor
}

class RoundView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.size.height / 2
    }
}

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var containerView: UIView!
    
    var viewModel: CollectionViewCellModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            
            titleLabel.text = viewModel.titleText
            containerView.backgroundColor = viewModel.backgroundColor
        }
    }
    
        
    override func awakeFromNib() {
        super.awakeFromNib()
        //        когда аутлеты наполнены
        // Initialization code
    }
    
}
