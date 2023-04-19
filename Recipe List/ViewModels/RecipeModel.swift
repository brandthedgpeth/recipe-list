//
//  RecipeModel.swift
//  Recipe List
//
//  Created by Brandt Hedgpeth on 4/17/23.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        // Call the DataService.getLocalData() method
        self.recipes = DataService.getLocalData()
    }
}
