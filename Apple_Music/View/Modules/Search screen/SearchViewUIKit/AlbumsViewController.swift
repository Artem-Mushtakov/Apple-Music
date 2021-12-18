//
//  AlbumsViewController.swift
//  Standard-App-Photo-IPhone
//
//  Created by Артем on 02.08.2021.
//

import UIKit

class AlbumsViewController: UIViewController {
    
    // MARK: - Properties
    
    var data = [ "Section0": [ModelCellMyAlbums(
        type: .cellMyAlbums,
        titleImage: UIImageView.init(image: UIImage(named: "imageMyAlbums1")!),
        titleLabel: "Недавние",
        titleCount: "9 259"),
                              ModelCellMyAlbums(
                                type: .cellMyAlbums,
                                titleImage: UIImageView.init(image: UIImage(named: "ImageMyAlbums2")!),
                                titleLabel: "Избранное",
                                titleCount: "123"),
                              ModelCellMyAlbums(
                                type: .cellMyAlbums,
                                titleImage: UIImageView.init(image: UIImage(named: "ImageMyAlbums3")!),
                                titleLabel: "Instagram",
                                titleCount: "654"),
                              ModelCellMyAlbums(
                                type: .cellMyAlbums,
                                titleImage: UIImageView.init(image: UIImage(named: "ImageMyAlbums4")!),
                                titleLabel: "WhatsApp",
                                titleCount: "14"),
                              ModelCellMyAlbums(
                                type: .cellMyAlbums,
                                titleImage: UIImageView.init(image: UIImage(named: "ImageMyAlbums5")!),
                                titleLabel: "FaceApp",
                                titleCount: "321"),
                              ModelCellMyAlbums(
                                type: .cellMyAlbums,
                                titleImage: UIImageView.init(image: UIImage(named: "ImageMyAlbums6")!),
                                titleLabel: "Gradient",
                                titleCount: "456"),
                              ModelCellMyAlbums(
                                type: .cellMyAlbums,
                                titleImage: UIImageView.init(image: UIImage(named: "ImageMyAlbums3")!),
                                titleLabel: "Movavi Clips",
                                titleCount: "321"),
                              ModelCellMyAlbums(
                                type: .cellMyAlbums,
                                titleImage: UIImageView.init(image: UIImage(named: "imageMyAlbums1")!),
                                titleLabel: "Недавние",
                                titleCount: "456")]
    ]
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupNavigationBar()
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
    
    private func setupNavigationBar() {
        
        navigationItem.title = "Альбомы"
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .clear
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTappedNavigationBar))
    }
    
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
    
    //MARK: - Actions
    
    @objc private func addTappedNavigationBar() {
        print("Press button NavigationBar: AddTapped")
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
            widthDimension: .absolute(UIScreen.main.bounds.width),
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
        return data["Section\(section)"]?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let data = data["Section\(indexPath.section)"]?[indexPath.row] else { return UICollectionViewCell() }
        return setupCellMyAlbums(for: indexPath, with: data)
    }
    
    private  func setupCellMyAlbums(for indexPath: IndexPath, with data: ModelCellMyAlbums) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellMyAlbums", for: indexPath) as? CellMyAlbums else { return UICollectionViewCell() }
        
        cell.titleLabel.text = data.titleLabel
        cell.titleImage = data.titleImage
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Press cell: \(String(describing: data["Section\(indexPath.section)"]?[indexPath.row].titleLabel))")
    }
}
