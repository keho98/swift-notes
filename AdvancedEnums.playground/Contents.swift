import UIKit

class BadImageStore {
    /* Product types - the options for the type are the product of options for each variable, so in this case there are 4 options */
    func fetchImage(url: NSURL, queue: NSOperationQueue, completionHandler: (UIImage?, String?) -> ()) {
        if true {
            completionHandler(UIImage(), nil)
        } else {
            completionHandler(nil, "Error Message")
        }
    }
}

/* Convert to a sum type using associated value enums */
/* Sum types - the options for the type are the sum of options for each variable */

enum ImageFetchResult {
    case Success(UIImage)
    case Failure(String)
}

class GoodImageStore {
    func fetchImage(url: NSURL, queue: NSOperationQueue, completionHandler: (ImageFetchResult) -> ()) {
        if true {
            let result = ImageFetchResult.Success(UIImage())
            completionHandler(result)
        } else {
            completionHandler(ImageFetchResult.Failure("Error Message"))
        }
    }
}

//This gives you cleaner code!

let store = GoodImageStore()
store.fetchImage(NSURL(), queue: NSOperationQueue.mainQueue()) {
    (result) -> () in
    switch result {
    case let .Success(image):
        print("Success")
        break
    case let .Failure(error):
        print(error)
    }
}

// Can we make this generic?
// This is very similar to the implementation of throw

enum Result<SuccessType, MyErrorType> {
    case Success(SuccessType)
    case Failure(MyErrorType)
}

class GenericStore {
    func fetchImage(url: NSURL, queue: NSOperationQueue, completionHandler: (Result<UIImage , String>) -> ()) {
        if true {
            let result = Result<UIImage, String>.Success(UIImage())
            completionHandler(result)
        } else {
            let result = Result<UIImage, String>.Failure("Failure")
            completionHandler(result)
        }
    }
}

// Also, a either type, which Result is the same as.
// Same idea, but a bit more abstract in naming

enum Either<LeftValue, RightValue> {
    case Left(LeftValue)
    case Right(RightValue)
}


// Throws
// Shows the normal case, but also shows that it can throw an error

class ThrowsImageStore {
    func fetchImage(url: NSURL, queue: NSOperationQueue, completionHandler: (image: UIImage) -> Void) throws {
        let success = true
        let err = NSError(domain: "error", code: 1, userInfo: nil)
        if success {

        } else {

        }
    }
}

let throwsStore = ThrowsImageStore()

