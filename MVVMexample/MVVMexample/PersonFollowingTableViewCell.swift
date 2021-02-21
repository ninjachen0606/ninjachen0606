//
//  PersonFollowingTableViewCell.swift
//  MVVMexample
//
//  Created by 宇宣 Chen on 2021/2/21.
//

import UIKit

protocol PersonFollowingTableViewCellDelegate: AnyObject {
    func personFollwingTableViewCell(
        _ cell: PersonFollowingTableViewCell,
        didTapWith viewModel: PersonFollowingTableViewCellViewModel)
}


class PersonFollowingTableViewCell: UITableViewCell {
    
    static let identifier = "PersonFollowingTableViewCell"
    
    weak var delegate: PersonFollowingTableViewCellDelegate?
    
    private var viewModel: PersonFollowingTableViewCellViewModel?
    
    private let userImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.textColor = .label
        return label
    }()
    
    private let usernameLabel: UILabel = {
       let label = UILabel()
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let button: UIButton = {
       let button = UIButton()
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(userImageView)
        contentView.addSubview(button)
        contentView.clipsToBounds = true
        button.addTarget(self,
                         action: #selector(didTapButton), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc private func didTapButton() {
        guard let viewModel = viewModel else {
            return
        }
        
        var newViewModel = viewModel
        newViewModel.currentlyFollowing = !viewModel.currentlyFollowing
        
        delegate?.personFollwingTableViewCell(self, didTapWith: newViewModel)
        
        prepareForReuse()
        configure(with: newViewModel)
    }
    
    
    func configure(with viewModel: PersonFollowingTableViewCellViewModel) {
        
        
        nameLabel.text = viewModel.name
        usernameLabel.text = viewModel.username
        userImageView.image = viewModel.image
        
        if viewModel.currentlyFollowing {
            button.setTitle("Unfollow", for: .normal)
            button.setTitleColor(.blue, for: .normal)
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
        }
        else
        {
            button.setTitle("Follow", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .link
        }
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageWidth = contentView.frame.size.height-10
        
        userImageView.frame = CGRect(x: 5,
                                     y: 5,
                                     width: imageWidth,
                                     height: imageWidth)
        nameLabel.frame = CGRect(x: imageWidth+10,
                                 y: 0,
                                 width: contentView.frame.size.width-imageWidth, height: contentView.frame.size.height/2)
        usernameLabel.frame = CGRect(x: imageWidth+10,
                                     y: contentView.frame.size.height/2,
                                 width: contentView.frame.size.width-imageWidth, height: contentView.frame.size.height/2)
        button.frame = CGRect(x: contentView.frame.size.width-120, y: 10, width: 110, height: contentView.frame.size.height-20)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        usernameLabel.text = nil
        userImageView.image = nil
        button.backgroundColor = nil
        button.layer.borderWidth = 0
        button.setTitle(nil, for: .normal)
        
    }
}
