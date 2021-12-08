//
//  Data.swift
//  DesignCode
//
//  Created by Devesh Tyagi on 30/11/21.
//

import Foundation
import SwiftUI

struct Post: Codable , Identifiable {
    
    let id = UUID()
    var title: String
    var body: String
    
}


class Api {
    func getPosts(completion : @escaping ([Post]) -> ()){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
      
        URLSession.shared.dataTask(with: url) { data, _ , err in
            guard let data = data else { return }
            let posts = try! JSONDecoder().decode([Post].self, from: data)
            DispatchQueue.main.async {
                completion(posts)
            }
            
        }
        .resume()
    }
}



