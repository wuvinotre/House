import SwiftUI

struct AppMenuView: View {
    @State private var vm = ViewModel()
    @Environment(\.openWindow) private var openWindow

    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Label("House", systemImage: "house.lodge")
                    .labelStyle(.iconOnly)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
                    .padding(1)
                HStack {
                    Spacer()
                    Button(action: {
                        openWindow(id: "form")
                    }) {
                        Image(systemName: "plus")
                    }.buttonStyle(PlainButtonStyle())
                }
            }
            Text("Doors - \(vm.doorsCount)")
                .font(.headline)
                .fontWeight(.light)
                .foregroundStyle(.gray)
            ForEach(vm.doorList) { door in

                Label {
                    Text(door.name).fontWeight(.thin).lineLimit(1).padding(1.5)
                } icon: {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(vm.circleColor(doorStatus: door.status!))
                        .frame(width: 20, height: 20)
                }
            }.onDelete(perform: vm.deleteDoor)
            Divider()
            HStack {
                Spacer()
                Button(action: {
                    openWindow(id: "preferences")
                }, label: {
                    Text("Preferences")
                        .fontWeight(.thin)
                }).buttonStyle(PlainButtonStyle())
                Spacer()
                Divider()
                Spacer()
                Button(action: {
                    NSApplication.shared.terminate(nil)
                }, label: {
                    Text("Quit")
                        .fontWeight(.thin)
                }).buttonStyle(PlainButtonStyle())
                Spacer()
            }
            .frame(height: 15)
        }.padding()
    }
}
