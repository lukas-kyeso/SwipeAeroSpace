import SwiftUI

struct SettingsView: View {
    @ObservedObject var settings: AppSettings
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Form {
                TextField("AeroSpace", text: $settings.aerospace)
                TextField("Swipe Threshold", value: $settings.swipeThreshold, format: .number)
                LaunchAtLogin.Toggle {
                    Text("Launch at login")
                }
                Button("Save Settings") {
                    settings.save()
                }
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 16)
        }
    }
    
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView(settings: AppSettings())  // Pass an instance of AppSettings
        }
    }
}
