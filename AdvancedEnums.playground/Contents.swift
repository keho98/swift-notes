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

/* Convert to a sum type */
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
