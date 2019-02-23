import UIKit

/// Helper UIImage extension.
extension UIImage {
  /// Checks if image has alpha component
  var hasAlpha: Bool {
    let result: Bool

    guard let alpha = cgImage?.alphaInfo else {
      return false
    }

    switch alpha {
    case .none, .noneSkipFirst, .noneSkipLast:
      result = false
    default:
      result = true
    }

    return result
  }

  /// Convert to data
  func cache_toData() -> Data? {
    if hasAlpha {
        return self.pngData()
    } else {
        return self.jpegData(compressionQuality: 1)
    }
  }
}
