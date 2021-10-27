//
//  SelectButton.swift
//  ToDoApp
//
//  Created by 松丸真 on 2021/10/27.
//

import SwiftUI

struct SelectButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button(action: {
            isSet.toggle()
        }) {
            Image(isSet ? "checkbox_on" : "checkbox_on")
                .renderingMode(.template)
                .frame(width: 50, height: 50)
                .foregroundColor(isSet ? Color.yellow : Color.gray)
        }
    }
}

struct SelectButton_Previews: PreviewProvider {
    static var previews: some View {
        SelectButton(isSet: .constant(true))
    }
}
