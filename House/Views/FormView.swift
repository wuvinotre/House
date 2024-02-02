import SwiftUI

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
            .background(.gray.opacity(0.5))
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct FormView: View {
    @Environment(\.dismiss) private var dismiss
    @State var name: String = ""
    @State var url: String = ""
    var disabled: Bool {
        return name.isEmpty || url.isEmpty
    }

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    if !url.isEmpty {
                        // test connection
                    }
                } label: {
                    HStack {
                        LabeledContent("Test") {
                            Image(systemName: "wifi")
                        }
                        .padding(EdgeInsets(top: 3, leading: 5, bottom: 3, trailing: 5))
                        .cornerRadius(10)
                    }
                }
                .padding(.bottom, -25)
            }
            VStack(alignment: .leading) {
                Spacer()
                Text("Door name")
                TextField("Door", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .padding(.bottom, 5)
                Text("Door URL")
                TextField("www.door.com", text: $url)
                    .textFieldStyle(.roundedBorder)
                Spacer()
            }
            HStack(alignment: .center) {
                Button {
                    if !name.isEmpty || !url.isEmpty {
                        // save connection
                        dismiss()
                        name = ""; url = ""
                    } else { return }
                } label: {
                    HStack {
                        LabeledContent("Create") {
                            Image(systemName: "door.left.hand.closed")
                        }
                    }
                    .padding(EdgeInsets(top: 3, leading: 5, bottom: 3, trailing: 5))
                    .cornerRadius(10)
                }
                .disabled(disabled)
            }
        }
        .padding()
    }
}
