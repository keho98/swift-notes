// Any is essentially void *

let thing1: Any = 1
let thing2: AnyObject = [Int] // Will not work, AnyObject references classes

class TestClass {

}

let thing3: AnyObject = TestClass()

let x = 1
