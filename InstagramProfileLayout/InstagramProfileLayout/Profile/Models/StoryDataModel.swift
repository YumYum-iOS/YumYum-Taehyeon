//
//  StoryDataModel.swift
//  InstagramProfileLayout
//
//  Created by taehy.k on 2021/06/15.
//

import Foundation

struct StoryDataModel {
    let storyImage: String
    let storyName: String
    
    init(storyImage: String, storyName: String) {
        self.storyImage = storyImage
        self.storyName = storyName
    }
}
