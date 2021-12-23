//
//  UIKitiOS13ViewController.swift
//  testApp
//
//  Created by Anton Agafonov on 20.12.2021.
//

import UIKit
import GXUtilz

struct StoryModel {
    var image: String
    var label: String
}

class ViewController: UIViewController {
    //MARK: - UIViews
    var mainScrollView: UIScrollView!
    var contentView: UIView!
    var searchBar: UISearchBar!
    var divider: UIView!
    var storiesCollectionView: UICollectionView!
    var storiesScrollView: UIScrollView!
    var mastersCollectionView: UICollectionView!
    var mastersScrollView: UIScrollView!
    var categoriesList: UITableView!
    var usefulMaterials: UICollectionView!
    
    //MARK: - content for views
    private let storiesContent: [StoryModel] = [
        StoryModel(image: Asset.findContractor.name, label: "Найти подрядчика легко"),
        StoryModel(image: Asset.hoseAndKey.name, label: "Ремонт под ключ"),
        StoryModel(image: Asset._289.name, label: "Смотри, как женщина делает ремонт вместо тебя"),
        StoryModel(image: Asset.fuckaaaa.name, label: "Сделай ремонт и не умри!")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupMainScrollView()
        setupSearchBar()
        
    }
    
    func setupMainScrollView() {
        mainScrollView = UIScrollView(frame: .zero)
        view.addSubview(mainScrollView)
        contentView = UIView(frame: .zero)
        mainScrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
    
    func setupSearchBar() {
        searchBar = UISearchBar(frame: .zero)
        contentView.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Layouts.padding),
            searchBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Layouts.padding),
            searchBar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Layouts.padding),
            searchBar.heightAnchor.constraint(equalToConstant: Layouts.height)
        ])
    }
    
    func setupDivider() {
        
    }
    
    func setupStoriesCollectionView() {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .white
        mainScrollView.addSubview(storiesCollectionView)
    }
    
    
//    func setupViews() {
//
//        view.addSubview(storiesCollectionView)
//
//        storiesCollectionView.delegate = self
//        storiesCollectionView.dataSource = self
//        storiesCollectionView.register(StoryCell.self, forCellWithReuseIdentifier: StoryCell.identifier)
//    }
//
//    private func setupLayout() {
//        storiesCollectionView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            storiesCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            storiesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            storiesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            storiesCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
//        ])
//    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storiesContent.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCell.identifier, for: indexPath) as! StoryCell
        let story = storiesContent[indexPath.item]
        cell.setContent(with: story)
        cell.contentView.backgroundColor = .green
        debugPrint(cell)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Display.width * 0.26, height: Display.width * 0.33)
    }
}

//MARK: - Constants:
enum Layouts {
    static let padding: CGFloat = 16
    static let height: CGFloat = 46
}
