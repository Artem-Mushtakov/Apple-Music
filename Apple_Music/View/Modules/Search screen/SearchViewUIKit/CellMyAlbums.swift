//
//  CellMyAlbums.swift
//  Standard-App-Photo-IPhone
//
//  Created by Артем on 02.08.2021.
//

import UIKit

class CellMyAlbums: UICollectionViewCell {
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupUI()
    }
    
    // MARK: - Properties
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = MetricCellMyAlbums.labelFont
        label.textColor = .black
        return label
    }()
    
    lazy var titleImage: UIImageView = {
        let titleImage = UIImageView()
        return titleImage
    } ()
}

// MARK: - Setup Layout

extension CellMyAlbums {
    
    private func setupUI() {
        
        falseTranslatesAutoresizingMaskIntoConstraints()
        
        contentView.addSubview(titleImage)
        contentView.addSubview(titleLabel)

        titleImage.clipsToBounds = true
        titleImage.layer.masksToBounds = true
        titleImage.layer.cornerRadius = 5
        titleImage.contentMode = UIView.ContentMode.scaleAspectFill
        
        NSLayoutConstraint.activate([
            
            titleImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: MetricCellMyAlbums.titleImageTopAnchorConstant),
            titleImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: MetricCellMyAlbums.titleImageLeadingAnchorConstant),
            titleImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: MetricCellMyAlbums.titleImageTrailingAnchorConstant),
            
            titleLabel.topAnchor.constraint(equalTo: titleImage.bottomAnchor, constant: MetricCellMyAlbums.titleLabelTopAnchorConstant),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: MetricCellMyAlbums.titleLabelLeadingAnchorConstant),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: MetricCellMyAlbums.titleLabelTrailingAnchorConstant),
        ])
    }
    
    private func falseTranslatesAutoresizingMaskIntoConstraints() {
        titleImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Metric

struct MetricCellMyAlbums {
    
    static let labelFont = UIFont.boldSystemFont(ofSize: 16.0)
    
    static let titleImageTopAnchorConstant: CGFloat = 5
    static let titleImageLeadingAnchorConstant: CGFloat = 5
    static let titleImageTrailingAnchorConstant: CGFloat = -5
    
    static let titleLabelTopAnchorConstant: CGFloat = -25
    static let titleLabelLeadingAnchorConstant: CGFloat = 10
    static let titleLabelTrailingAnchorConstant: CGFloat = 5
}
