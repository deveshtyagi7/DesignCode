//
//  DataStore.swift
//  DesignCode
//
//  Created by Devesh Tyagi on 30/11/21.
//

import Combine

class DataStore : ObservableObject {
    @Published var posts : [Post] = []
    
    
    init(){
        getPosts()
    }
    func getPosts() {
        Api().getPosts { posts in
            self.posts = posts
        }
    }
}
