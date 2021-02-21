//
//  PersonFollowingTableViewCellViewModel.swift
//  MVVMexample
//
//  Created by 宇宣 Chen on 2021/2/21.
//

import UIKit

struct PersonFollowingTableViewCellViewModel {
    let name: String
    let username: String
    var currentlyFollowing: Bool
    let image: UIImage?
    
    init(with model: Person) {
        name = model.name
        username = model.username
        currentlyFollowing = false
        image = UIImage(systemName: "person")
    }
}
