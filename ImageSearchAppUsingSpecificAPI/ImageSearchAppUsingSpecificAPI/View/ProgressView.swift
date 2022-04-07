//
//  ProgressView.swift
//  ImageSearchAppUsingSpecificAPI
//
//  Created by Theo on 2022/04/07.
//

import SwiftUI

struct CustomProgressView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(
                CircularProgressViewStyle(tint: Color.black)
            )
            .scaleEffect(2, anchor: .center)
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CustomProgressView()
    }
}
