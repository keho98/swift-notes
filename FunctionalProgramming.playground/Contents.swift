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
    CODE_HERE
 }

*/

numbers = [4,2,6,7,10,12]

numbers.sort {
    (i, j) -> Bool in
    return i < j
}

// A nice alternative

let result = numbers.sort { $0 > $1 }
result

// Also wtf
// '<' is actually just a function that returns a bool
let wtfResult = numbers.sort(<)

wtfResult

// Map, can work between types as well

let numbersAsStrings = numbers.map {
    (i) -> String in
    return i.description
}

numbersAsStrings

let mappedNumber = numbers.map {
    (i) -> Int in
    return i * 3
}.reduce(0, combine: +)

mappedNumber

// Functions can return other functions

func printLineMaker(times: Int) -> String -> () {
    func printer(text: String) {
        for _ in 1...times {
            print(text)
        }
    }
    return printer
}

let repeatPrintLn = printLineMaker(3)
repeatPrintLn("Yay!")

// Challenge - Implement Map and Filter using reduce

var inputArray: [Int] = []

numbers.reduce(inputArray) {
    (var array: [Int], i) -> [Int] in
    array.append(i * 3)
    return array
}

func map<T, U>(arr: [T], handler: T -> U) -> [U] {
    return arr.reduce([]) { (var tempArr, val) -> [U] in
        tempArr.append(handler(val))
        return tempArr
    }
}

map(numbers) { $0 * 3 }

