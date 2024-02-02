import Foundation

extension FormView {
    class ViewModel: ObservableObject {
//        correction because the doorList must come from storage
        @Published var doorList = [Door]()

        func addDoor(name: String, url: String) {
            let newDoor = Door(name: name, status: .off, url: url)
            doorList.insert(newDoor, at: 0)
        }
    }
}
