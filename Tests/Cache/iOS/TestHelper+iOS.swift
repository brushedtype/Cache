#if canImport(UIKit)
import XCTest
import UIKit
@testable import Cache

final class ImageWrapperTests: XCTestCase {
  func testImage() {
    let image = TestHelper.image(size: CGSize(width: 100, height: 100))
    let wrapper = ImageWrapper(image: image)

    let data = try! JSONEncoder().encode(wrapper)
    let anotherWrapper = try! JSONDecoder().decode(ImageWrapper.self, from: data)

    XCTAssertTrue(image.isEqualToImage(anotherWrapper.image))
  }
}

extension TestHelper {
  static func image(_ color: UIColor = .red, size: CGSize = .init(width: 1, height: 1)) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(size, false, 0)

    let context = UIGraphicsGetCurrentContext()
    context?.setFillColor(color.cgColor)
    context?.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))

    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    return image!
  }
}
#endif
