import Cocoa
import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    @ObservedObject var settings = AppSettings()

    func applicationDidFinishLaunching(_ notification: Notification) {
        if !requestAccessibilityPermission() {
            NSApplication.shared.terminate(nil)
        } else {
            SwipeManager.start(with: settings)
        }
    }

    private func requestAccessibilityPermission() -> Bool {
        let options = [kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String: true] as CFDictionary
        return AXIsProcessTrusted() || AXIsProcessTrustedWithOptions(options)
    }
}
