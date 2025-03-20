//
//  ContentView.swift
//  nakjiplay
//
//  Created by Seunghwa Yu on 3/20/25.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
	
	@State private var showImage = false
	
    var body: some View {
        VStack {
            Text("Hello, Nakji!")
                .font(.largeTitle)
                .padding()
			if showImage {
				Image("nakji1024")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 300, height: 300)
					.padding()
			}
			Button(action: {
				showImage.toggle()
			}) {
				Text("Toggle Image")
			}
			Button("Dynamic Nakji") {
				let dynamicIslandWidgetAttributes = NakjiWidgetAttributes(
					name: "nakji"
				)
				let contentState = NakjiWidgetAttributes.ContentState(emoji: "")

				do {
					let activity = try Activity<NakjiWidgetAttributes>.request(
					attributes: dynamicIslandWidgetAttributes,
					contentState: contentState
				)
					print(activity)
				} catch {
					print(error)
				}
			}
        }
	
		
	}
}
	

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
