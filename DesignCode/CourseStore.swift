//
//  CourseStore.swift
//  DesignCode
//
//  Created by Devesh Tyagi on 08/12/21.
//

import Combine
import Contentful
import SwiftUI

let client = Client(spaceId: "0ge8xzmnbp2c", accessToken: "03010b0d79abcb655ca3fda453f2f493b5472e0aaa53664bc7dea5ef4fce2676")


func getArray(id: String, completion: @escaping ([Entry]) -> ()){
    let query = Query.where(contentTypeId: "course")
    
    client.fetchArray(of: Entry.self, matching: query) { result in
        
        switch result {
            
        case .success(let array):
            DispatchQueue.main.async {
                completion(array.items)
            }
            
        case .failure(let error):
            print("\(error)")
        }
    }
}

class CourseStore : ObservableObject {
    @Published var courses: [Course] = courseData
    
    
    init() {
        let colours = [#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1), #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1), #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)]
        getArray(id: "course") { courses in
            courses.forEach { course in
                self.courses.append(Course(title: course.fields["title"] as! String,
                                           subtitle: course.fields["subtitle"] as! String,
                                           image: course.fields.linkedAsset(at: "image")?.url ?? URL(string: "https://dl.dropbox.com/s/pmggyp7j64nvvg8/Certificate%402x.png?dl=0")!,
                                           logo: #imageLiteral(resourceName: "Logo1"),
                                           color: colours.randomElement()!,
                                           show: false))
            }
        }
    }
    
    
}
