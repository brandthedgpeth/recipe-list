//
//  DataService.swift
//  Recipe List
//
//  Created by Brandt Hedgpeth on 4/17/23.
//

import Foundation

class DataService {
    // Use static because we are only using this class to call the getLocalData() method. Therefore we don't have to create instances of DataService, we can just call the method directly on the data type.
    static func getLocalData() -> [Recipe] {
        // Parse local json file
        
        // Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
       
        // Check if pathString is not nil, otherwise...
        guard pathString != nil else {
            // return empty array of Recipe if pathstring is nil
            return [Recipe]()
        }
        // Create a url object
        let url = URL(filePath: pathString!) // Can unwrap because we know it is not nil
        // Create a data object
        do {
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON Decoder
            let decoder = JSONDecoder()
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add the unique IDs
                for r in recipeData {
                    r.id = UUID()
                    
                    // Add the unique Ids to ingredients array
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                
                // Return the recipes
                return recipeData
            }
            catch {
                // error with parsing json
                print(error)
            }
        }
    
        catch {
            // error with getting data
            print(error)
        }
        // return empty array of Recipe if error happens
        return [Recipe]()
    }
}
