//
//  StoryCell.swift
//  testApp
//
//  Created by Anton Agafonov on 21.12.2021.
//

import UIKit

class StoryCell: UICollectionViewCell {
    static let identifier = "storyCell"
    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContent(with story: StoryModel) {
        imageView.image = UIImage(named: story.image)
        label.text = story.label
    }
    
    private func setupViews() {
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 15
        contentView.backgroundColor = .white
        
        contentView.addSubview(imageView)
        contentView.addSubview(label)
    }
    
    private func setupLayout() {
        let paddind: CGFloat = 8
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: paddind),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: paddind),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: paddind)
        ])
    }
}
