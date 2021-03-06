//
//  String + Extension.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/27/22.
//

import Foundation
extension String
{
    func removeEmptySpace()-> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    func compareWithCaseSensitive(_ anotherSrting: String) -> Bool {
        return self.caseInsensitiveCompare(anotherSrting) == .orderedSame
    }
}
