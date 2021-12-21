//
//  StoryCell.swift
//  testApp
//
//  Created by Anton Agafonov on 21.12.2021.
//

import UIKit

class StoryCell: UICollectionViewCell {
    let avatarView = UIImageView(frame: .zero)
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContent(with story: StoryModel) {
        avatarView.image = UIImage(named: story.image)
        label.text = story.label
    }
    
    private func configure() {
        avatarView.layer.cornerRadius = 15
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        
        addSubview(avatarView)
        addSubview(label)
        
        let paddind: CGFloat = 8
        
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            avatarView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            avatarView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: paddind),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: paddind),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: paddind)
        ])
    }
}
