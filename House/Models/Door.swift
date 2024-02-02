import Foundation

enum StatusDoor: String {
    case on, off, notFound
}

struct Door: Identifiable {
    var id = UUID()
    var name: String
    var status: StatusDoor?
    var url: String

    init(id: UUID = UUID(), name: String, status: StatusDoor, url: String) {
        self.id = id
        self.name = name
        self.status = status
        self.url = url
    }

    static func example() -> Door {
        Door(name: "door", status: .on, url: "www.door.com")
    }

    static func examples() -> [Door] {
        [
            Door(name: "door on", status: .on, url: "www.doorOn.com"),
            Door(name: "door off", status: .off, url: "www.doorOff.com"),
            Door(name: "door not found", status: .notFound, url: "www.doorNotFound.com")]
    }
}
