//
//  TagView.swift
//  TaskManager
//
//  Created by user on 26/03/25.
//

import SwiftUI

struct TagView: View {
    var TextName:String
    var pallet: Color
    var Icon: String
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "\(Icon)")
                .dynamicTypeSize(.xSmall)
                .foregroundStyle(pallet)
                .padding(.trailing, -5)
            Text("\(TextName)")
                .font(.footnote)
                .fontWeight(.regular)
                .foregroundStyle(pallet)
        }.padding([.leading,.trailing],5)
            .padding([.top,.bottom],3)
        .background(
            RoundedRectangle(cornerRadius: 6)
                .fill(Color(UIColor.red))
                .opacity(0.15)
                .padding(.all, -3)
        )
    }
}

#Preview {
    var TextName:String = "Evento"
    var pallet = Color(UIColor.systemRed)
    var Icon: String = "tag.fill"
    TagView(TextName: TextName, pallet: pallet, Icon: Icon)
}
