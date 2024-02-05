import Foundation
import SwiftData

final class DataSource {
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext

    @MainActor
    static let shared = DataSource()

    @MainActor
    private init() {
        modelContainer = try! ModelContainer(for: Door.self)
        modelContext = modelContainer.mainContext
    }

    func appendDoor(_ door: Door) {
        modelContext.insert(door)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func fetchDoors() -> [Door] {
        do {
            return try modelContext.fetch(FetchDescriptor<Door>())
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func removeDoor(_ door: Door) {
        modelContext.delete(door)
    }
}
