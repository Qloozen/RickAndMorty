//
//  RowView.swift
//  RickAndMorty
//
//  Created by Qiang Loozen on 22/03/2023.
//

import SwiftUI

struct RowView: View {
    
    @State var title: String
    @State var subTitle: String?
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title).font(.system(
                    size: 18,
                    weight: .bold)
                )
                if let subTitle {
                    Text(subTitle).font(.system(
                        size: 14,
                        weight: .regular)
                    )
                }
            }
            .padding(15)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.green)
                .padding(20)
        }
        .tint(.primary)
        .background(Color(UIColor.secondarySystemBackground))
        .frame(maxWidth: .infinity)
        .cornerRadius(5)
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(title: "test", subTitle: "sub")
    }
}
