import Foundation

extension FormView {
    @Observable
    class ViewModel: ObservableObject {
        @ObservationIgnored
        private let dataSource: DataSource

        init(dataSource: DataSource = DataSource.shared) {
            self.dataSource = dataSource
        }

        func appendDoor(name: String, url: String) {
            dataSource.appendDoor(Door(name: name, status: nil, url: url))
        }
    }
}
