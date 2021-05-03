import Foundation

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

struct TestHelper {

    static func data(_ length : Int) -> Data {
        let buffer = [UInt8](repeating: 0, count: length)
        return Data(buffer)
    }

    static func triggerApplicationEvents() {
        #if canImport(UIKit)
        NotificationCenter.default.post(name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.post(name: UIApplication.willTerminateNotification, object: nil)
        #elseif canImport(AppKit)
        NotificationCenter.default.post(name: NSApplication.willTerminateNotification, object: nil)
        NotificationCenter.default.post(name: NSApplication.didResignActiveNotification, object: nil)
        #endif
    }

}
