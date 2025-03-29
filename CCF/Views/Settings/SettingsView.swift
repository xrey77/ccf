
//
//  SettingsView.swift
//  SideMenu
//
//  Created by Reynald Marquez-Gragasin on 3/12/25.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack {
            Image(systemName: "gear")
                .resizable()
                .background(Color.clear)
                .foregroundColor(Color.black)
                .frame(width: 60, height: 60)
                .cornerRadius(4)
        }.padding(.top, -60)
        NavigationView {
            VStack {
                
                Form {
                    
                    // SECTION 3
                    
                    Section(header: Text("Follow us on Social Media")) {

                        FormRowLinkView(icon: "globe", color: Color.pink, text: "Website", link: "www.ccf.org.ph")

                        FormRowLinkView(icon: "link", color: Color.blue, text: "X (Twitter)", link: "www.twitter.com")

                        FormRowLinkView(icon: "play.rectangle", color: Color.pink, text: "Youtube", link: "www.youtube.com")

                        
                        
                    }
                    .padding(.vertical, 3)
                    
                    // SECTION 4
                    Section(header: Text("About the application")) {
                        FormRowStaticView(icon: "gear", firstText: "Appliacation", secondText: "ToDo")

                        FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "iPhone, iPad")

                        FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "Reynald M. Gragasin")

                        FormRowStaticView(icon: "paintbrush", firstText: "Designer", secondText: "CCF Designer")

                        FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.0.0")

                        
                    }
                    .padding(.vertical, 3)
                    
                    
                }
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                
                Text("Copyright 2025, all rights reserved. CCF Main")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(.top, 6)
                    .padding(.bottom, 8)
                    .foregroundColor(.secondary)
                    .background(Color("ColorBackground")).edgesIgnoringSafeArea(.all)
            }
            .navigationBarItems(trailing:
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                }
            )
            .navigationBarTitle("Settings", displayMode: .inline)
            Spacer()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}


