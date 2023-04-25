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
    
    static func getPortion(_ ingredient:Ingredient,_ recipeServings:Int,_ targetServings:Int) -> String {
        
        var portion:String = ""
        // ?? operator is used for optionals. If the optional is nil, then it assigns it to the number you want. If it isn't nil, then it assigns it to the variable
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions:Int = 0
        
        if ingredient.num != nil {
            
            // Get a single serving size by multiplying the denominator by the servings
            denominator *= recipeServings
            
            // Get target portion by multiplying numerator by target servings
            numerator *= targetServings
            
            // Reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            // Get the whole portion if numerator > denominator
            if numerator >= denominator {
                
                // Calculated whole portions
                wholePortions = numerator/denominator
                
                // Calculated the remainder
                numerator %= denominator
                
                // Assign to portion string
                portion += String(wholePortions)
            }
            
            // Express the remainder as a fraction
            if numerator > 0 {
                
                // Assign remainder as fraction to the portion string
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
            
        }

        if var unit = ingredient.unit {
            
            // If we need to pluralize
            if wholePortions > 1 {
                // Calculate appropriate suffix
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
            }
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            return portion + unit
        }
        
        return portion
    }
}
