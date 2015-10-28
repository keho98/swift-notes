// Generics
// - Allow you to use placeholder types
// - Type is determined when the generic is used
// - Placeholder is filled in when called
// - Allows for type-agnostic functions and data types

import UIKit

func makeIntPair(x: Int, y: Int) -> (Int, Int) {
    return (x,y)
}

func makeStringPair(s1: String, s2: String) -> (String, String) {
    return (s1, s2)
}

// Could make a dumb version of this using Any type, but you'd get any back
// func makePair(a1: Any, a2: Any)

func makePair<T>(x: T, y: T) -> (T, T) {
    return (x, y)
}

let firstPair = makePair(1, y:2)
let secondPair = makePair("Hello", y:"World")

// NOT ALLOWED:
// let backPair = makePair(1, "World")

// Multiple placeholder types

func makePairMixed<T,U>(x: T, _ y: U) -> (T, U) {
    return (x, y)
}

let mixedPair = makePairMixed(1, "World") //Valid
let intPair = makePairMixed(1, 2) //Valid

// Type Constraints

//
// Type needs to be equatable for this to be possible, incorrect!
// func checkIfEqualWrong<T>(x: T, y: T) -> Bool {
//     return x == y
// }

// Classes and Protocols ok, Enums and Stucts won't work

func checkIfEqual<T: /*Class or Protocol*/ Equatable>(x: T, _ y: T) -> Bool {
    return x == y
}

// Generics can use anything for placeholders to improve readability

func checkIfEqualPretty<Element: Equatable>(x: Element, _ y: Element) -> Bool {
    return x == y
}

checkIfEqual("hello", "Hiii")

// Generic Classes, use the same syntax

class LinkedList<NodeValue> {
    var value: NodeValue
    var nextElement: Optional<LinkedList<NodeValue>> // LinkedList<NodeValue>?

    init(value: NodeValue) {
        self.value = value
    }
}

let node1 = LinkedList(value: 1)
let node2 = LinkedList(value: 2)

node1.nextElement = node2

// Protocol Associated Types

// Protocols cannot be generic
// But they can have associatd types that are determined by the adopting class

protocol GeneratorType {
    // Associated type: typealias without a definition
    typealias Element
    mutating func next() -> Element?
}

struct MyIntGenerator: GeneratorType {
    typealias Element = Int // Swift infers this type, not necessary
    mutating func next() -> Int? {
        return nil
    }
}

// Type Constraints: "where" Clauses
// Allow constraints on associated types

func makeIntArray<T: GeneratorType where T.Element == Int>(var generator: T) -> [Int] {
    var results = [Int]()

    while let item = generator.next() {
        results.append(item)
    }

    return results
}


// How does optional work?

enum Maybe<Value> {
    case None
    case Some(Value)
}

let val = Maybe.Some(1)

switch val {
    case .None:
        print("No value")
    case let .Some(x):
        print("Value: \(x)")
}

//let val: String? = "Hello"
//if let actualVal = val {
//
//}

var someOptional: Int? = 5
switch someOptional {
    case .None:
        print("hello")
    case let .Some(x):
        print("Optional has value \(x)")
}

enum Deferred<T> {
    case Success(T)
    case Error(NSError)
}

let def = Deferred.Success(5)

switch def {
    case let .Success(x):
        print(x)
    case let .Error(err):
        print(err.description)
}



