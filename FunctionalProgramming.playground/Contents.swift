import UIKit

// For example:
// Function type is (String) -> String
func greeting(name: String = "friend") -> String {
    return ""
}

// Higher order functions
// For example, sorted

var numbers = [2,5,216,23,64,7]

func sortAscending(i: Int, _ j: Int) -> Bool {
    return i < j
}

let sortedNumber = numbers.sort(sortAscending)

/* 
 Expression syntax
 { (parameters) -> ReturnType in

 }

*/

numbers = [4,2,6,7,10,2]

numbers.sort {
    (i, j) -> Bool in
    return i < j
}
