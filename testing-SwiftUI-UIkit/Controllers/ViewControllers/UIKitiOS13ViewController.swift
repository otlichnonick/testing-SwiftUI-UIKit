//
//  UIKitiOS13ViewController.swift
//  testApp
//
//  Created by Anton Agafonov on 20.12.2021.
//

import UIKit

struct StoryModel {
    var image: String
    var label: String
}

class UIKitiOS13ViewController: UIViewController {
    var storiesCollectionView: UICollectionView!
    let storiesContent: [StoryModel] = [
    StoryModel(image: "", label: "Найти подрядчика легко")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        configureStories()
    }
    
    private func configureStories() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        storiesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(storiesCollectionView)
        
        storiesCollectionView.delegate = self
        storiesCollectionView.dataSource = self
        
        storiesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        storiesCollectionView.register(StoryCell.self, forCellWithReuseIdentifier: "story")
        
        NSLayoutConstraint.activate([
            storiesCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            storiesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            storiesCollectionView.heightAnchor.constraint(equalToConstant: view.bounds.width * 0.3)
        ])
    }
}

extension UIKitiOS13ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storiesContent.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "story", for: indexPath) as! StoryCell
        let story = storiesContent[indexPath.item]
        cell.setContent(with: story)
        return cell
    }
    
    
}
