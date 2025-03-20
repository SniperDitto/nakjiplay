//
//  NakjiWidgetBundle.swift
//  NakjiWidget
//
//  Created by Seunghwa Yu on 3/21/25.
//

import WidgetKit
import SwiftUI

@main
struct NakjiWidgetBundle: WidgetBundle {
    var body: some Widget {
        NakjiWidget()
        NakjiWidgetControl()
        NakjiWidgetLiveActivity()
    }
}
