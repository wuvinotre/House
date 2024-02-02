import SwiftUI

@main
struct HouseApp: App {
    var body: some Scene {
        MenuBarExtra("HouseApp", systemImage: "house.lodge.fill") {
            AppMenuView()
        }
        .menuBarExtraStyle(.window)

        Window("New Door", id: "form") {
            FormView()
                .frame(width: 350, height: 200, alignment: .center)
        }
        .windowResizability(.contentSize)

        Window("Preferences", id: "preferences") {
            PreferencesView()
                .frame(width: 350, height: 200, alignment: .center)
        }
        .windowResizability(.contentSize)
    }
}
