//
//  SignupView.swift
//  CCF
//
//  Created by Reynald Marquez-Gragasin on 3/19/25.
//

import SwiftUI

struct SignupView: View {
    @State var isLoading = false
    @State var textFieldIsDisabled = false

    @State private var scale = 7.95
    @State private var enabled = false
    @State private var isEmailValid = false
    @State private var showMessage = false
    @State private var message = ""
    @State private var confirmPassword = ""

    @State private var firstnameEmpty = 0
    @State private var lastnameEmpty = 0
    @State private var emailaddEmpty = 0
    @State private var mobilenoEmpty = 0

    @State private var usernameEmpty = 0
    @State private var passwordEmpty = 0
    @State private var confirmPasswordEmpty = 0

    @State private var passwordNotMatch = 0

    @State private var emailaddTaken = 0
    @State private var usernameTaken = 0
    @State private var showingSignupScreen = false
    @StateObject private var signinVM = SignupViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                Color.purple.opacity(0.70).ignoresSafeArea()
                VStack {
                    Group {
                    Image(systemName: "person.badge.plus").resizable().frame(width: 90, height: 90, alignment: .center).foregroundColor(Color.white)
                    Text("Create your account").font(.system(size: 24)).bold().padding().foregroundColor(.white)
                    TextField("First Name", text: $signinVM.firstname)
                        .autocapitalization(.none)
                        .disabled(textFieldIsDisabled)
                        .padding()
                        .frame(width: 300, height: 50)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(10).foregroundColor(.white)
                        .border(Color.red, width: CGFloat(firstnameEmpty))

                    TextField("Last Name", text: $signinVM.lastname)
                        .autocapitalization(.none)
                        .disabled(textFieldIsDisabled)
                        .padding()
                        .frame(width: 300, height: 50)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(10).foregroundColor(.white)
                        .border(Color.red, width: CGFloat(lastnameEmpty))

                    
                    TextField("Email Address", text: $signinVM.email)
                        .autocapitalization(.none)
                        .disabled(textFieldIsDisabled)
                        .padding()
                        .frame(width: 300, height: 50)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(10).foregroundColor(.white)
                        .border(Color.red, width: CGFloat(emailaddEmpty))
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                    
                    TextField("Mobile No.", text: $signinVM.mobile)
                        .autocapitalization(.none)
                        .disabled(textFieldIsDisabled)
                        .padding()
                        .frame(width: 300, height: 50)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(10).foregroundColor(.white)
                        .border(Color.red, width: CGFloat(mobilenoEmpty))

                    TextField("Username", text: $signinVM.username)
                        .autocapitalization(.none)
                        .disabled(textFieldIsDisabled)
                        .padding()
                        .frame(width: 300, height: 50)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(10).foregroundColor(.white)
                        .border(Color.red, width: CGFloat(usernameEmpty))


                    SecureField("Password", text: $signinVM.password)
                        .autocapitalization(.none)
                        .disabled(textFieldIsDisabled)
                        .padding()
                        .frame(width: 300, height: 50)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(10).foregroundColor(.white)
                        .border(Color.red, width: CGFloat(passwordEmpty))

                    SecureField("Confirm Password", text: $confirmPassword)
                        .autocapitalization(.none)
                        .disabled(textFieldIsDisabled)
                        .padding()
                        .frame(width: 300, height: 50)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(10).foregroundColor(.white)
                        .border(Color.red, width: CGFloat(confirmPasswordEmpty))
                    } /// END-GROUP 1
                    
                    HStack {
                        Button("signUp") {
                            
                            if (signinVM.firstname.isEmpty) {
                                firstnameEmpty = 3
                                return
                            } else if (signinVM.lastname.isEmpty) {
                                lastnameEmpty = 3
                                return
                            } else if (signinVM.email.isEmpty) {
                                emailaddEmpty = 3
                                return
                            } else if (signinVM.username.isEmpty) {
                                usernameEmpty = 3
                                return
                            } else if (signinVM.password.isEmpty) {
                                passwordEmpty = 3
                                return
                            } else if (confirmPassword.isEmpty) {
                                confirmPasswordEmpty = 2
                                return
                            }
                            if !self.textFieldValidatorEmail(signinVM.email) {
                                self.message = "Invalid Email Address."
                                showMessage.toggle()
                                enabled.toggle()
                                emailaddEmpty = 3
                                return
                            }

                            if (signinVM.password != confirmPassword) {
                                message = "Password did not matched."
                                showMessage.toggle()
                                enabled.toggle()
                                confirmPasswordEmpty = 3
                                return;
                            }

                            
                            
                            self.textFieldIsDisabled = true
                            self.isLoading = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                if (signinVM.messageInfo != "") {
                                    self.showMessage = true
                                    self.message = signinVM.messageInfo
                                    self.isLoading = false
                                    self.textFieldIsDisabled = false
                                } else {
                                    
                                    self.showMessage = true
                                    self.isLoading = false
                                    self.textFieldIsDisabled = false
                                }
                            }

                            emailaddEmpty = 0
                            
                            signinVM.signup()
                            
                        }
                        .foregroundColor(.white)
                        .frame(width: 150, height: 40)
                        .background(Color.green)
                        .cornerRadius(15)
                    
                        ///BUTTON CLEAR
                        Button("clear") {
                            signinVM.firstname = ""
                            signinVM.lastname = ""
                            signinVM.email = ""
                            signinVM.mobile = ""
                            signinVM.username = ""
                            signinVM.password = ""
                            signinVM.signup()
                            self.confirmPassword = ""
                        }
                        .foregroundColor(.white)
                        .frame(width: 150, height: 40)
                        .background(Color.orange)
                        .cornerRadius(15)
                    }
                    
                    
                } ///END-VStack
                .padding(.top, 25)

                ///PROGRESS INDICATOR
                if (self.isLoading) {
                  ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .orange))
                    .scaleEffect(8).padding(.top, -10)
                }
                
                ///ALERT MESSAGE
                if (self.showMessage) {
                        
                        ///ALERT DIAGLOG
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
                                        self.showMessage=false
                                        self.message = ""
                                        signinVM.statusCode = ""
                                        signinVM.messageInfo = ""
                                    }
                                }
                                .frame(width: 60, height: 50, alignment: .center)
                                .background(Color.gray)
                            }
                            Spacer()
                            VStack {
                                Text(self.message).foregroundColor(.white)
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
                        
                    
                }
                ///END-ALERT MESSAGE

            }
            .padding(.top, -180)
            ///END-ZStack

            
        } ///END-NavigationView

    }
    
    func textFieldValidatorEmail(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        ///let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
    }

    func clearSignupDetails() {
        signinVM.firstname = ""
        signinVM.lastname = ""
        signinVM.email = ""
        signinVM.mobile = ""
        signinVM .username = ""
        signinVM .password = ""
        self .confirmPassword = ""
        self .message = ""
        signinVM.statusCode = ""
    }

}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}


