//
//  AlertDialogView.swift
//  CCF
//
//  Created by Reynald Marquez-Gragasin on 3/26/25.
//

import SwiftUI

struct AlertDialog: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Text("             Alert Message").font(.system(size: 20)).foregroundColor(.white)
                    .frame(width: 295, height: 50, alignment: .center)
                    .background(Color.gray)
                VStack {
                Image(systemName: "xmark.square")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                        print("close dialog box.")
                    }
                }
                .frame(width: 60, height: 50, alignment: .center)
                .background(Color.gray)
            }
            Spacer()
            VStack {
                Text("Please create you account, then signIn.").foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .padding(.top, -30)
            }
            .frame(width: 300, height: 110, alignment: .center)
            Spacer()
        }
        .frame(width: 350, height: 200, alignment: .center)
        .background(Color.blue.opacity(0.50))
        .cornerRadius(30)
    }
}

struct AlertDialogView_Previews: PreviewProvider {
    static var previews: some View {
        AlertDialog()
            .previewLayout(.fixed(width: 350, height: 200))
            .padding()
    }
}

