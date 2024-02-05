import Foundation
import SwiftData
import SwiftUI

extension AppMenuView {
    @Observable
    class ViewModel {
        @ObservationIgnored
        private let dataSource: DataSource

        var doorsCount = 0

        init(dataSource: DataSource = DataSource.shared) {
            self.dataSource = dataSource
            Doors = dataSource.fetchDoors()
            doorsCount = Doors.count
        }

        func removeDoor(_ index: Int) {
            dataSource.removeDoor(Doors[index])
        }

        func circleColor(doorStatus: String) -> Color? {
            switch doorStatus {
            case "on":
                return .green
            case "off":
                return .red
            case "notFound":
                return .gray
            default:
                return .purple
            }
        }
    }
}
