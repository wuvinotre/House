import Foundation
import SwiftUI

extension AppMenuView {
    class ViewModel: ObservableObject {
        @Published var doorList = [Door]()
        @Published var doorsCount = 0

        init() {
            loadDoors()
        }

        func loadDoors() {
            doorList = Door.examples()
            doorsCount = doorList.count
        }

        func deleteDoor(at offset: IndexSet) {
            withAnimation {
                doorList.remove(atOffsets: offset)
            }
        }

        func circleColor(doorStatus: StatusDoor) -> Color {
            switch doorStatus {
            case .on:
                return .green
            case .off:
                return .red
            case .notFound:
                return .gray
            }
        }
    }
}
