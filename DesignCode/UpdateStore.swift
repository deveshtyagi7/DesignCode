//
//  UpdateStore.swift
//  DesignCode
//
//  Created by Devesh Tyagi on 01/11/21.
//

import SwiftUI
import Combine

class UpdateStore : ObservableObject {
    @Published var updates : [Update] = updateData
    
}
