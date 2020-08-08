import SwiftUI

import YZMarkdown

struct ContentView: View {
  
  let uri: URL
  let text: String
  
  init(uri: URL) {
    self.uri = uri.deletingLastPathComponent()
    self.text = ContentView.getContentsOfFile(uri: uri) ?? ""
    YZMarkdownParser.debugParse(text: self.text)
  }
  
  var body: some View {
    ScrollView {
      YZMarkdownParser.debugParseAndRenderView(
        rootPath: self.uri,
        text: self.text)
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
    }
    .background(Rectangle().fill(Color.white))
  }

  static func getContentsOfFile(uri: URL?) -> String?
  {
    if let uri = uri {
      do {
        return try String(contentsOf: uri, encoding: .utf8)
      } catch {
        // TODO: error handling
      }
    }
    return nil
  }
}
