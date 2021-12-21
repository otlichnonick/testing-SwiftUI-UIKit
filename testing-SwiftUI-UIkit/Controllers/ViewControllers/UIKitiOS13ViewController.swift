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

class UIKitiOS13ViewController: UIViewController {
    private var storiesCollectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private let storiesContent: [StoryModel] = [
        StoryModel(image: Asset.findContractor.name, label: "Найти подрядчика легко"),
        StoryModel(image: Asset.hoseAndKey.name, label: "Ремонт под ключ"),
        StoryModel(image: Asset._289.name, label: "Смотри, как женщина делает ремонт вместо тебя"),
        StoryModel(image: Asset.fuckaaaa.name, label: "Сделай ремонт и не умри!")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayout()
        storiesCollectionView.reloadData()
    }
    
    func setupViews() {
        view.backgroundColor = .red
        view.addSubview(storiesCollectionView)
        
        storiesCollectionView.delegate = self
        storiesCollectionView.dataSource = self
        storiesCollectionView.register(StoryCell.self, forCellWithReuseIdentifier: StoryCell.identifier)
    }
    
    private func setupLayout() {
        storiesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            storiesCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            storiesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            storiesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            storiesCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIKitiOS13ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
