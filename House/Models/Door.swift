import Foundation
import SwiftData

enum StatusDoor: String {
    case on, off, notFound
}

@Model
final class Door: Identifiable {
    var id = UUID()
    var name: String
    var status: String?
    var url: String

    init(id: UUID = UUID(), name: String, status: String?, url: String) {
        self.id = id
        self.name = name
        self.status = status
        self.url = url
    }
}

var Doors: [Door] = []
