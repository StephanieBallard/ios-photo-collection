//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Stephanie Ballard on 1/30/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

//You will now make a helper class that will contain functionality related to the user's theme preference and give access to that theme information throughout the application. It will use UserDefaults to save and load this preference.
//
//Create a "ThemeHelper.swift" file. Add a ThemeHelper class inside of it. 2. Create a string constant called themePreferenceKey. This will be used whenever you need to save the user's theme preference or get it from UserDefaults.
//Create a function called setThemePreferenceToDark(). Using the set method of UserDefaults (remember that in order to access set, you have to use the standard property on UserDefaults), set the string "Dark" as the value, and the themePreferenceKey as the key.
//Create another function that does the same thing, but with a different color. Call the function setThemePreferenceToYourColorHere.
//Finally, create a computed property called themePreference of type String?. This should simply return the string value that you stored from either of the two methods you wrote above. Use the UserDefaults string(forKey: ...) method to get that value. The method should return an optional string because if the user's theme preference hasn't been saved, the value returned from UserDefaults will be nil.
//In the initializer for this class (you will have to call it), check if the themePreference value is nil. If it is, then call one of the setThemePreference functions you just created. This will make it so the first time the user opens the app a preference will be set for them until they choose to change it.

import Foundation

extension String {
    static var themePreferenceKey = ""
}

class ThemeHelper {
    
    let themePreferenceKey: String
    
    func setThemePreferenceToDark() {
        let themePreference =
        UserDefaults.standard.set(themePreference, forKey: "" )
    }
    
    func setThemePreferenceToYourColorHere() {
        
    }
    
    
}
