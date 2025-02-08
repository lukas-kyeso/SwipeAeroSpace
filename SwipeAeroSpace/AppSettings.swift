import Cocoa
import Foundation
import SwiftUI

class AppSettings: ObservableObject {
    @Published var aerospace: String = UserDefaults.standard.string(forKey: "aerospace") ?? "/opt/homebrew/bin/aerospace"
    @Published var swipeThreshold: Double = UserDefaults.standard.double(forKey: "threshold")

    func save() {
        UserDefaults.standard.set(aerospace, forKey: "aerospace")
        UserDefaults.standard.set(swipeThreshold, forKey: "threshold")
    }
}
