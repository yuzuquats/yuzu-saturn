import SwiftUI

import YZDesignSystem
import YZDesignSystemMacOS
import YZMarkdown

@main
struct YZMarkDownExampleApp: App {

  @ObservedObject private var openedFileStore: OpenedFileStore = OpenedFileStore()
  @State private var rightSidebarOpen = false
  
  var body: some Scene {
    WindowGroup {
      Page(
        navigationContent: HStack {
          Text("Saturn Notebook")
            .frame(maxHeight: .infinity)
          Spacer()
          YZDesignSystem.Button {
            self.rightSidebarOpen = !rightSidebarOpen
          }
        }) {
        // TODO: fix the layout
        HStack {
          Spacer()
          // TODO: error handling
          ContentView(uri: openedFileStore.uri!)
            .frame(
              minWidth: 480,
              idealWidth: 720,
              maxWidth: 720,
              maxHeight: .infinity)
          Spacer()
          Spacer()
          Spacer()
          Spacer()
        }
      }
      .frame(
        minWidth: 640,
        idealWidth: 960,
        maxWidth: .infinity,
        minHeight: 320,
        idealHeight: 720,
        maxHeight: .infinity,
        alignment: .center)
      .if(rightSidebarOpen) {
        $0.overlay(
          HStack(alignment: .top) {
            Spacer()
            VStack(alignment: .leading) {
              Text("Right Sidebar")
            }
            .padding(16)
            .frame(minWidth: 300,
                   idealWidth: 300,
                   maxWidth: 300,
                   minHeight: nil,
                   idealHeight: .infinity,
                   maxHeight: .infinity,
                   alignment: .topLeading)
            .background(
              RoundedRectangle(cornerRadius: 16)
                .stroke(Color.init(white: 0.8))
            )
            .background(
              RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
            )
          }
          .padding(.top, 40)
          .padding(12)
        )
      }
      .background(Rectangle().fill(Color.white))
      .edgesIgnoringSafeArea(.top)
    }
    .windowStyle(HiddenTitleBarWindowStyle())
    .clearCommands()
    .commands {
      FileCommands(store: self.openedFileStore)
    }
  }
}

final class OpenedFileStore: ObservableObject {
  // TODO: generate a default
//  @Published var uri: URL? = URL(string: "file:///Users/jameskao/personal/yuzu-saturn/examples/markdown_full.md")
//  @Published var uri: URL? = URL(string: "file:///Users/jameskao/personal/yuzu-design-system/getting_started.md")
  @Published var uri: URL? = URL(string: "file:///Users/jameskao/personal/yuzu-saturn/examples/test.md")
}

struct FileCommands : Commands {
  
  let store: OpenedFileStore
  
  init(store: OpenedFileStore) {
    self.store = store
  }
  
  var body: some Commands {
    CommandGroup(replacing: .newItem) {
      Button("Open File", action: {
        let openPanel: NSOpenPanel = NSOpenPanel()
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseDirectories = false
        openPanel.canCreateDirectories = false
        openPanel.canChooseFiles = true
        openPanel.begin { (result) -> Void in
          // TODO: clean this up with proper error handling
          if result == .OK {
            print("Got a file \(String(describing: openPanel.url))")
            self.store.uri = openPanel.url
          } else {
          }
        }
      })
      .keyboardShortcut("o")
    }
  }
}
