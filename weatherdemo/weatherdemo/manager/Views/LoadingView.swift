//
//  LoadingView.swift
//  weatherdemo
//
//  Created by Md Zaid Ansari on 4/13/25.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .red))

            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
} 

#Preview {
    LoadingView()
}
