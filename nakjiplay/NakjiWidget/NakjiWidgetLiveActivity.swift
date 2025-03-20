//
//  NakjiWidgetLiveActivity.swift
//  NakjiWidget
//
//  Created by Seunghwa Yu on 3/21/25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct NakjiWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct NakjiWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: NakjiWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            HStack {
                //Text("Hello \(context.state.emoji)")
				Image("nakji150")
				Image("nakji150")
            }
			//.activityBackgroundTint(Color.gray)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    //Text("Leading")
					Text("🐙낙지")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    //Text("Trailing")
					Text("🐙🐙🐙")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    //Text("Bottom \(context.state.emoji)")
                    // more content
					HStack{
						Image("nakji100")
					}
                }
            } compactLeading: {
				//Text("L")
				Image("nakji30")
            } compactTrailing: {
                //Text("T \(context.state.emoji)")
				Image("nakji30")
            } minimal: {
                //Text(context.state.emoji)
				Image("nakji30")
            }
            .widgetURL(URL(string: "http://www.apple.com"))
			.keylineTint(Color.blue)
        }
    }
}

extension NakjiWidgetAttributes {
    fileprivate static var preview: NakjiWidgetAttributes {
        NakjiWidgetAttributes(name: "World")
    }
}

extension NakjiWidgetAttributes.ContentState {
    fileprivate static var smiley: NakjiWidgetAttributes.ContentState {
        NakjiWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: NakjiWidgetAttributes.ContentState {
         NakjiWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: NakjiWidgetAttributes.preview) {
   NakjiWidgetLiveActivity()
} contentStates: {
    NakjiWidgetAttributes.ContentState.smiley
    NakjiWidgetAttributes.ContentState.starEyes
}
