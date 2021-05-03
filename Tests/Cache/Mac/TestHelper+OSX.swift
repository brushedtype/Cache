#if canImport(Cocoa)
import XCTest
import Cocoa
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
  static func image(color: NSColor = .red, size: NSSize = .init(width: 1, height: 1)) -> NSImage {
    let image = NSImage(size: size)
    image.lockFocus()
    color.drawSwatch(in: NSMakeRect(0, 0, size.width, size.height))
    image.unlockFocus()
    return image
  }
}
#endif
