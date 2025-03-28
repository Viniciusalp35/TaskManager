//
//  TagView.swift
//  TaskManager
//
//  Created by User on 27/03/25.
//

import SwiftUI

struct TagView: View {
    var body: some View {
        Label("Nome", systemImage: "tag.fill")
            .foregroundStyle(.white)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 4)
                    .fill(.red)
            }
    }
}

#Preview {
    TagView()
}
