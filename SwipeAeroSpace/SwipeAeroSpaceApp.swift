import SwiftUI

@main
struct SwipeAeroSpaceApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @AppStorage("menuBarExtraIsInserted") var menuBarExtraIsInserted = true
    @Environment(\.openSettings) private var openSettings
    @Environment(\.openWindow) private var openWindow

    var body: some Scene {
        MenuBarExtra("Swipe AeroSpace",
                     image: "MenubarIcon",
                     isInserted: $menuBarExtraIsInserted) {
            Button("Settings") {
                openSettings()
            }
            Button("About") {
                openWindow(id: "about")
            }
            Divider()
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }
            .keyboardShortcut("q")
        }
        
        Settings {
            SettingsView(settings: appDelegate.settings)
        }.windowResizability(.contentSize)
        
        WindowGroup(id: "about") {
            AboutView()
        }.windowResizability(.contentSize)
    }
}
