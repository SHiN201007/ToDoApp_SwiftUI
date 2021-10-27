//
//  DeleteButton.swift
//  ToDoApp
//
//  Created by 松丸真 on 2021/10/27.
//

import SwiftUI
import KRProgressHUD

struct DeleteButton: View {
    
    var documentID: String
    
    var body: some View {
        Button(action: {
            let model = TodoModel()
            KRProgressHUD.show()
            model.deleteItem(docID: documentID) {
                KRProgressHUD.showMessage("削除しました")
            }
        }) {
            Image(systemName: "trash.fill")
                .renderingMode(.template)
                .frame(width: 50, height: 50)
                .foregroundColor(.gray)
        }
        .buttonStyle(PlainButtonStyle())
        
        
    }
}

struct DeleteButton_Previews: PreviewProvider {
    static var previews: some View {
        DeleteButton(documentID: "aa")
    }
}
