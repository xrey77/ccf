//
//  SigninView.swift
//  CCF
//
//  Created by Reynald Marquez-Gragasin on 3/19/25.
//
import SwiftUI


extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct SigninView: View {
    @State var messageOpt = ["             Alert Message", "         Confirmation Message"]
    @State var alertTitle = ""
    @State var isLoading = false
    @State var textFieldIsDisabled = false
    @StateObject private var loginVM = LoginViewModel()
    @State private var showModal = false
    @State private var scale = 7.95
    @State private var username = ""
    @State private var password = ""
    @State private var usernameEmpty = 0
    @State private var passwordEmpty = 0
    @State private var showingLoginScreen = false
    @State private var selectedTab = 0
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
        
    var body: some View {
        NavigationView {
            ZStack {
//                Color.purple.opacity(0.70).ignoresSafeArea()
                Circle().scale(1.7).foregroundColor(Color.white.opacity(0.15))
                Circle().scale(1.35).foregroundColor(.white)
                if (Vars.isLoggedin == true) {
                    VStack {
                        
                        Image(uiImage: UIImage(data: Data(base64Encoded: Vars.userpicture)!)!)
                            .resizable()
                            .frame(width: 150, height: 150)
                            .cornerRadius(50)

                        Text("\(Vars.fullname)").font(.title)
                        Text("... follower of Jesus Christ").padding().padding(.top, -20)

                        HStack {
                            
                            Button(action: {
                                clearGlovars()
                                mode.wrappedValue.dismiss()
                            }, label: {
                                HStack(spacing: 5) {
                                    Image(systemName: "person.crop.circle.badge.minus")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(Color.white)
                                        .aspectRatio(contentMode: .fit)
                                        .layoutPriority(1)
                                    Text("Signout").foregroundColor(Color.white)
                                }
                            })
                            .foregroundColor(.white)
                            .frame(width: 100, height: 40)
                            .background(Color.blue)
                            .cornerRadius(20)

                            Text("|").font(.title3).foregroundColor(.blue)

                            Button(action: {
                                mode.wrappedValue.dismiss()
                            }, label: {
                                HStack(spacing: 5) {
                                    Image(systemName: "backward.fill")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(Color.white)
                                        .aspectRatio(contentMode: .fit)
                                        .layoutPriority(1)

                                    Text("Goback").foregroundColor(Color.white)
                                }
                            })
                            .foregroundColor(.white)
                            .frame(width: 100, height: 40)
                            .background(Color.blue)
                            .cornerRadius(20)

                        }
                    }

                } else {
                        VStack {
                            Image(systemName: "lock.rotation.open")
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .center)
                            Text("SignIn to your account").font(.title).bold().padding()
                            
                            TextField("Username", text: $loginVM.username)
                                .autocapitalization(.none)
                                .padding()
                                .frame(width: 300, height: 50)
                                .foregroundColor(.black)
                                .background(Color.black.opacity(0.05))
                                .cornerRadius(10)
                                .border(Color.red, width: CGFloat(self.usernameEmpty))
                                .disabled(textFieldIsDisabled)
                            
                            SecureField("Password", text: $loginVM.password)
                                .autocapitalization(.none)
                                .padding()
                                .frame(width: 300, height: 50)
                                .foregroundColor(.black)
                                .background(Color.black.opacity(0.05))
                                .cornerRadius(10)
                                .border(Color.red, width: CGFloat(passwordEmpty))
                                .disabled(textFieldIsDisabled)
                            
                            ///SIGNIN BUTTON
                            Button(action: {
                                self.textFieldIsDisabled = true
                                AuthenticateUser(username: username, password: password)
                            }, label: {
                                VStack {
                                    NavigationLink(destination: ContentView(), isActive: $showingLoginScreen) {
                                            EmptyView()
                                        }
                                }
                                HStack(spacing: 10) {
                                    Image(systemName: "hand.draw")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(Color.white)
                                        .aspectRatio(contentMode: .fit)
                                        .layoutPriority(1)
                                Text("SignIn Now").foregroundColor(Color.white)
                                }
                            })
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Color.blue)
                            .cornerRadius(25)
                            .padding(.top, 2)

                            HStack(spacing: 50) {
                                ///FORGOT PASSWORD BUTTON

                                VStack {
                                    Image("forgot")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.black)
                                    .onTapGesture {
                                        self.showModal = true
                                    }
                                    Text("Forgot")
                                }
                                ///GOBACK BUTTON
                                VStack {
                                Image(systemName: "backward.fill")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                    .foregroundColor(.black)
                                    .onTapGesture {
                                        mode.wrappedValue.dismiss()
                                    }
                                    Text("Goback")
                                }

                            }
                            .padding(.top, 20)
                            
                            //PROGRESS VIEW
                            if isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .red))
                                .scaleEffect(8).padding(.top, -250)
                            }

                            
                        } ///VStack end
                        
                }

                if (self.showModal) {
                    
                    ///ALERT DIAGLOG
                    VStack {
                        HStack(spacing: 0) {
                            Text(self.alertTitle).font(.system(size: 20)).foregroundColor(.white)
                                .frame(width: 295, height: 50, alignment: .center)
                                .background(Color.gray)
                            VStack {
                            Image(systemName: "xmark.square")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .onTapGesture {
                                    showModal = false
                                    textFieldIsDisabled = false
                                    if loginVM.statusCode == "200" {
                                        mode.wrappedValue.dismiss()
                                    }
                                }
                            }
                            .frame(width: 60, height: 50, alignment: .center)
                            .background(Color.gray)
                        }
                        Spacer()
                        VStack {
                            Text(loginVM.messageInfo).foregroundColor(.white)
                                .multilineTextAlignment(.center).font(.system(size: 23))
                                .padding(.top, -30)
                        }
                        .frame(width: 300, height: 110, alignment: .center)
                        Spacer()
                    }
                    .background(Color.red)
                    .cornerRadius(30)
                    .frame(maxWidth: 350, maxHeight: 250, alignment: .topTrailing)
                    .animation(.easeInOut(duration: 1.9), value: self.scale)
                /// END-ALERT DIALOG
                    
                    ///PROGRESS INDICATOR

                }
            } ///ZStack end
            .navigationBarHidden(true)
            .frame(height: 1200)
            .background(Color("CCF-color")).ignoresSafeArea()
///            .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)

        } ///NavigationView end
    }
    
    func AuthenticateUser(username: String, password: String) {
        
        if (loginVM.username.isEmpty) {
            usernameEmpty = 3
            return
        } else if (loginVM.password.isEmpty) {
            passwordEmpty = 3
            return
        } else {
            usernameEmpty = 0
            passwordEmpty = 0
        }
        
        isLoading = true
        loginVM.login()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            if (loginVM.statusCode == "200") {
                self.alertTitle = messageOpt[0]
            } else {
                self.alertTitle = messageOpt[1]
            }
            isLoading = false
            self.showModal = true
        }
        
    }
    
    func clearGlovars() {
        Vars.userid = ""
        Vars.username = ""
        Vars.isLoggedin = false
        Vars.fullname = ""
        Vars.token = ""
        Vars.openState = false
        Vars.userpicture = ""
        loginVM.username = ""
        loginVM.password = ""
        loginVM.statusCode = ""
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}

/**

struct AlertDialogView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
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
        .frame(maxWidth: 350, maxHeight: 200, alignment: .topTrailing)
        .background(Color.blue.opacity(0.50))
        .cornerRadius(30)
        
        }
        .background(Color.red)
            
        
    }

}
*/
