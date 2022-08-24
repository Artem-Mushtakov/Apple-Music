//
//  AlbumsViewController.swift
//  Standard-App-Photo-IPhone
//
//  Created by Артем on 02.08.2021.
//

import UIKit
import SwiftUI

class AlbumsViewController: UIViewController {
    
    // MARK: - Properties

    @ObservedObject var dataModel = RadioModelStationsData()
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        collectionView.collectionViewLayout = createCompositionalLayout()
    }
    
    //MARK: - Setup
    
    private lazy var collectionView: UICollectionView = {
        
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        
        
        collectionView.register(CellMyAlbums.self, forCellWithReuseIdentifier: "CellMyAlbums")
        
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    //MARK: - Setup Layout
    
    private func setupLayout() {
        
        self.view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension AlbumsViewController {
    
    //MARK: - Settings Sections
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            
            return self.layoutSectionCellAlbumsViewCell()
        }
    }
    
    private func layoutSectionCellAlbumsViewCell() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(UIScreen.main.bounds.height * 0.25))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                      leading: 5,
                                                      bottom: 5,
                                                      trailing:0)
        
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
}

// MARK: - UICollectionViewDelegate & Data Source

extension AlbumsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataModel.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return setupCellMyAlbums(for: indexPath)
    }

    private  func setupCellMyAlbums(for indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellMyAlbums", for: indexPath) as? CellMyAlbums else { return UICollectionViewCell() }

        let image = UIImageView.init(image: UIImage(named: dataModel.data[indexPath.row].image))
        cell.titleLabel.text = dataModel.data[indexPath.row].title
        cell.titleImage = image
        return cell
    }
}
