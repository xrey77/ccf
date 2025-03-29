//
//  ContentView.swift
//  CCF
//
//  Created by Reynald Marquez-Gragasin on 3/18/25.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @State var clickUser: Int? = nil
    @State public var pastorsData: [Pastors] = []
    @State private var isLoading = true
    @State var showTop = true
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    @State var showDrawer: Bool = false
    
    func fetchPastorsData() {
        self.showDrawer = false
        let apiService = APIService()
        apiService.fetchPastors { fetchedData in
            DispatchQueue.main.async {
                self.pastorsData = fetchedData ?? []
                self.isLoading = false
            }
        }
    }
        
    let xcaptions = [
        "Pastor Ardy Ocaya and Wife",
        "Pastor Edrick Mendoza and Wife Joy",
        "Pastor Peter Tan Chi and Wife",
        "Pastor Ricky Sartou",
        "Pastor Bong Saquing and Wife",
        "Pastor Peter Tan Chi Jr.",
        "Pastor Paul Tan Chi Preaching",
        "CCF Alabang",
        "CCF Commonwealth",
    ]
    
    
    var body: some View {
        NavigationView {
          ZStack {
            Color.black.opacity(0.04).ignoresSafeArea()
//            Image("splash")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .edgesIgnoringSafeArea(.all)

            ScrollView(.vertical, showsIndicators: false) {
             VStack(spacing: 15) {
                
/// MANUALLY DISPLAY IMAGES
///                ForEach(0..<9,id: \.self) { img in
///                    Image("p\(img)").resizable().frame(height: 250).cornerRadius(15)
///                    Text(xcaptions[img])
///                }
                
                ForEach(pastorsData) { item in
                    KFImage(URL(string: "http://127.0.0.1:9000/assets/ccf/\(item.urlimages)")).resizable().frame(height: 240).cornerRadius(15)
                    Text(item.name).foregroundColor(.black)
                }

///  DISPLAY IMAGES USING LIST
///                List(pastorsData) { xpastor in
///                        VStack(alignment: .leading) {
///                            Text(xpastor.name).font(.title) .foregroundColor(.black)
///                        }
///                        .padding(.vertical, 5)
///                }
///                .frame(minHeight: minRowHeight * 3).border(Color.red)
///                .overlay(isLoading ? ProgressView() : nil)
             }
             .padding()
             .padding(.top, -50)

            ///VSTack
            } ///ScrollView

                    GeometryReader {_ in
                        HStack {
                            if (self.showDrawer) {
                              MenuLeft()
                                .offset(x: self.showDrawer ? 0 : -UIScreen.main.bounds.width)
                                .animation(.default)
                            
///                                .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6))
                            
                              MenuRight()
                                .offset(x: self.showDrawer ? 0 : +UIScreen.main.bounds.width)
                                .animation(.default)
                            }
                            Spacer()
                        }
                        
                    }
                    .background(Color.black.opacity(self.showDrawer ? 0.5 : 0))
            
            } ///ZStack
          .onAppear(perform: {
            fetchPastorsData()
          })
          .navigationBarItems(leading:
                                Button(action: {
                                }, label: {
                                    ///Haburger Icon
                                    if (self.showDrawer) {
                                        HStack(spacing: 300) {
                                            Image(systemName: "xmark.square")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(Color("CCF-color"))
                                                .onTapGesture {
                                                    self.showDrawer.toggle()
                                                }
                                            if (Vars.username == "") {

//                                             Image(systemName: "person.circle")
//                                                .resizable()
//                                                .frame(width: 35, height: 35)

                                            } else {
                                                Image(uiImage: UIImage(data: Data(base64Encoded: Vars.userpicture)!)!)
                                                    .resizable()
                                                    .frame(width: 50, height: 50)
                                                    .cornerRadius(50)
                                            }


                                        }
                                        .aspectRatio(contentMode: .fit)
                                        .layoutPriority(1)
                                    } else {
                                        HStack(spacing: 300) {
                                            VStack {
                                            Image(systemName: "text.justify")
                                                .resizable()
                                                .frame(width: 25, height: 25)
                                                .foregroundColor(.black)
                                                .onTapGesture {
                                                    self.showDrawer.toggle()
                                                }
                                            }
                                            
                                            if (Vars.username == "") {
//                                                VStack {
//                                                Image(systemName: "person.circle")
//                                                    .resizable()
//                                                    .frame(width: 35, height: 35)
//                                                    .foregroundColor(.black)
//                                                    .onTapGesture {
//                                                        print("tap  1")
//                                                    }
//                                                }
                                                //
                                            } else {
                                                Button(action: {
                                                    self.clickUser = 10
                                                }, label: {
                                                    NavigationLink(destination: SigninView().navigationBarBackButtonHidden(true), tag: 10, selection: $clickUser) {
                                                        EmptyView()
                                                    }
                                                    Image(uiImage: UIImage(data: Data(base64Encoded: Vars.userpicture)!)!)
                                                        .resizable()
                                                        .frame(width: 50, height: 50)
                                                        .cornerRadius(50)
                                                })
                                            }
                                            
                                        }
                                        .aspectRatio(contentMode: .fit)
                                        .layoutPriority(1)
                                    }
                                }) ///END-Button
          )
        }
        .background(Color("Color"))
//        .padding(.top, -30)
        /// NavigationView
    }
}

    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MenuLeft : View {
    @State private var current: Int? = nil
    
    var body : some View {
        ScrollViewReader { reader in
        ScrollView(showsIndicators: false) {
        Group {
        VStack(spacing: 30) {
            
            Button(action: {
            }, label: {

                VStack {
//                    HStack(spacing: 50) {
//                            Image(systemName: "xmark.square")
//                                .resizable()
//                                .frame(width: 30, height: 30)
//                                .foregroundColor(.black)
//                                .accessibility(hidden: true)
//                    }
//                    .frame(width: 220, height: 50, alignment: .trailing)
//                    .padding(.top, 20)
                    
                    HStack {
                        Image("ccf")
                            .resizable()
                            .frame(width: 220, height: 100, alignment: .leading)
                            .padding(.bottom, 15)
                    }
                }
                .overlay(
                    Rectangle()
                        .frame(width: 350, height: 0.8, alignment: .leading)
                        .foregroundColor(.gray),
                        alignment: .bottom)
            })
            .frame(width: 270, alignment: .leading)
            .padding(.top, -40)
            
            
            ///About Us
            Button(action: {
                current = 0
            }, label: {
                VStack {
                    NavigationLink(
                        destination: AboutusView(),tag: 0,selection: $current) {
                        EmptyView()
                    }
                }

                VStack {
                    HStack(spacing: 8) {
                        Image(systemName: "text.bubble")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.blue)
                            .padding(.bottom, 15)
                        
                        Text("About Us").padding(.bottom, 10).foregroundColor(Color("CCF-color"))
                    }
                }
                .overlay(
                    Rectangle()
                        .frame(width: 350, height: 0.8, alignment: .center)
                        .foregroundColor(.gray),
                        alignment: .bottom)
            })
            .buttonStyle(BorderlessButtonStyle())
            .frame(width: 270,  alignment: .leading)
            
            ///Give
            Button(action: {
                current = 1
            }, label: {
                VStack {
                    NavigationLink(destination: GiveView(), tag: 1, selection: $current) {
                        EmptyView()
                    }
                }

               VStack {
                 HStack(spacing: 8) {
                    Image(systemName: "suit.heart")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.red)
                        .padding(.bottom, 15)
                    Text("Give").padding(.bottom, 10).foregroundColor(Color("CCF-color"))
                 }
               }
               .overlay(
                   Rectangle()
                       .frame(width: 350, height: 0.8, alignment: .center)
                       .foregroundColor(.gray),
                       alignment: .bottom)
            })
            .buttonStyle(BorderlessButtonStyle())
            .frame(width: 270,  alignment: .leading)

            
            ///Watch
            Button(action: {
                current = 2
            }, label: {
                VStack {
                    NavigationLink(destination: WatchView(), tag: 2, selection: $current) {
                        EmptyView()
                    }
                }

              VStack {
                HStack(spacing: 8) {
                    Image(systemName: "camera")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.bottom, 15)
                    Text("Watch").padding(.bottom, 15).foregroundColor(Color("CCF-color"))
                }
              }
              .overlay(
                  Rectangle()
                      .frame(width: 350, height: 0.8, alignment: .center)
                      .foregroundColor(.gray),
                      alignment: .bottom)

            })
            .buttonStyle(BorderlessButtonStyle())
            .frame(width: 270,  alignment: .leading)
            
            ///Missions
            Button(action: {
                current = 3
            }, label: {
                VStack {
                    NavigationLink(destination: MIssionsView(), tag: 3, selection: $current) {
                        EmptyView()
                    }
                }

              VStack {
                HStack(spacing: 8) {
                    Image(systemName: "repeat")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.pink)
                        .padding(.bottom, 15)
                    Text("Missions").padding(.bottom, 15).foregroundColor(Color("CCF-color"))
                }
              }
              .overlay(
                  Rectangle()
                      .frame(width: 350, height: 0.8, alignment: .center)
                      .foregroundColor(.gray),
                      alignment: .bottom)

            })
            .buttonStyle(BorderlessButtonStyle())
            .frame(width: 270,  alignment: .leading)

            ///Intercede
            Button(action: {
                current = 4
            }, label: {
                VStack {
                    NavigationLink(destination: IntercedeView(), tag: 4, selection: $current) {
                        EmptyView()
                    }
                }

              VStack {
                HStack(spacing: 8) {
                    Image(systemName: "checkmark.shield")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.orange)
                        .padding(.bottom, 15)
                    Text("Intercede").padding(.bottom, 15).foregroundColor(Color("CCF-color"))
                }
              }
              .overlay(
                  Rectangle()
                      .frame(width: 350, height: 0.8, alignment: .center)
                      .foregroundColor(.gray),
                      alignment: .bottom)

            })
            .buttonStyle(BorderlessButtonStyle())
            .frame(width: 270,  alignment: .leading)

            ///Youth
            Button(action: {
                current = 5
            }, label: {
                VStack {
                    NavigationLink(destination: YouthView(), tag: 5, selection: $current) {
                        EmptyView()
                    }
                }

              VStack {
                HStack(spacing: 8) {
                    Image(systemName: "studentdesk")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.green)
                        .padding(.bottom, 15)
                    Text("Youth").padding(.bottom, 15).foregroundColor(Color("CCF-color"))
                }
              }
              .overlay(
                  Rectangle()
                      .frame(width: 350, height: 0.8, alignment: .center)
                      .foregroundColor(.gray),
                      alignment: .bottom)

            })
            .buttonStyle(BorderlessButtonStyle())
            .frame(width: 270,  alignment: .leading)
            
            ///Events
            Button(action: {
                current = 6
            }, label: {
                VStack {
                    NavigationLink(destination: EventsView(), tag: 6, selection: $current) {
                        EmptyView()
                    }
                }
                
              VStack {
                HStack(spacing: 8) {
                    Image(systemName: "square.stack.3d.up.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.pink)
                        .padding(.bottom, 15)
                    Text("Events").padding(.bottom, 15).foregroundColor(Color("CCF-color"))
                }
              }
              .overlay(
                  Rectangle()
                      .frame(width: 350, height: 0.8, alignment: .center)
                      .foregroundColor(.gray),
                      alignment: .bottom)

            })
            .buttonStyle(BorderlessButtonStyle())
            .frame(width: 270,  alignment: .leading)
                        
            ///Resources
            Button(action: {
                current = 7
            }, label: {
                VStack {
                    NavigationLink(destination: ResourcesView(), tag: 7, selection: $current) {
                        EmptyView()
                    }
                }
              VStack {
                HStack(spacing: 8) {
                    Image(systemName: "arkit")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.purple)
                        .padding(.bottom, 15)
                    Text("Resources").padding(.bottom, 15).foregroundColor(Color("CCF-color"))
                }

              }
              .overlay(
                  Rectangle()
                      .frame(width: 350, height: 0.8, alignment: .center)
                      .foregroundColor(.gray),
                      alignment: .bottom)

            })
            .buttonStyle(BorderlessButtonStyle())
            .frame(width: 270,  alignment: .leading)

            ///Discipleship corner
            Button(action: {
                current = 8
            }, label: {
                VStack {
                    NavigationLink(destination: DiscipleshipView(), tag: 8, selection: $current) {
                        EmptyView()
                    }
                }
              VStack {
                HStack(spacing: 8) {
                    Image(systemName: "person.2.square.stack.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.yellow)
                        .padding(.bottom, 15)
                    Text("Discipleship corner").padding(.bottom, 15).foregroundColor(Color("CCF-color"))
                }
              }
              .overlay(
                  Rectangle()
                      .frame(width: 350, height: 0.8, alignment: .center)
                      .foregroundColor(.gray),
                      alignment: .bottom)

            })
            .buttonStyle(BorderlessButtonStyle())
            .frame(width: 270,  alignment: .leading)
            
        } ///END-Group 1

        Group {
            Button(action: {
            }, label: {
                VStack {
                    HStack {
                        Image("idc2026")
                            .resizable()
                            .frame(width: 190, height: 70, alignment: .leading)
                            .padding(.bottom, 15)
                    }
                }
            })
            .frame(width: 270, alignment: .leading)
            .padding(.top,20)
            
        } ///END-Group 2
                    
        }///VStack
        .padding(25)
        .foregroundColor(.black)
        .frame(width: 250, height: 980,  alignment: .leading)
        .background(Color("Color")).edgesIgnoringSafeArea(.bottom)
        .padding(.top, -33)

            
        } ///END-ScrollView
        } //END-ScrollViewReader
    }
} ///END-BODY

struct MenuRight : View {
    @State var selected: Int? = nil
    @State var showLeft = true
    @State var scrollToTopVar = false
    
    var body: some View {
        ScrollViewReader { reader in
        ScrollView(showsIndicators: false) {
        Group {
        VStack {
                        
            /// SIGNUP
            Button(action: {
                self.selected = 0
            }, label: {
                VStack {
                    NavigationLink(destination: SignupView(), tag: 0, selection: $selected) {
                        EmptyView()
                    }
                }
                
                VStack {
                    
                    VStack(spacing: 0) {
                        Image(systemName: "person.badge.plus.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(Color("CCF-color"))
                            .aspectRatio(contentMode: .fit)
                            .layoutPriority(1)
                        Text("SignUp").padding(.bottom, 15).foregroundColor(Color("CCF-color"))
                        
                    }.frame(width: 140, height: 135, alignment: .center)
                    .background(Color.clear)
              }
              .overlay(
                  Rectangle()
                      .frame(width: 180, height: 0.8, alignment: .leading)
                      .foregroundColor(.gray),
                      alignment: .bottom)

            })
            .frame(width: 250, alignment: .leading)
            .buttonStyle(BorderlessButtonStyle())
            
            if (Vars.isLoggedin == false) {
            ///SIGNIN
                Button(action: {
                    self.selected = 1
                }, label: {
                    VStack{
                        NavigationLink(destination: SigninView().navigationBarBackButtonHidden(true), tag: 1, selection: $selected) {
                            EmptyView()
                        }
                    }
                    
                    VStack {
                    VStack(spacing: 4) {
                        Image(systemName: "lock.rotation.open")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(Color.green)
                            .aspectRatio(contentMode: .fit)
                            .layoutPriority(1)

                        Text("SignIn").padding(.bottom, 15).foregroundColor(Color("CCF-color"))
                    }.frame(width: 140, height: 125, alignment: .center)
                    .background(Color(.clear))
                  }
                  .overlay(
                      Rectangle()
                          .frame(width: 180, height: 0.8, alignment: .center)
                          .foregroundColor(.gray),
                          alignment: .bottom)
                })
                .frame(width: 250, alignment: .leading)
                .background(Color(.clear))
                .buttonStyle(BorderlessButtonStyle())
            }
            
            ///PROFILE
            Button(action: {
                self.selected = 3
            }, label: {
              VStack {
                NavigationLink(destination: ProfileView(), tag: 3, selection: $selected) {
                    EmptyView()
                }
                VStack(spacing: 8) {
                    Image(systemName: "rectangle.stack.person.crop")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundColor(Color.purple)
                        .aspectRatio(contentMode: .fit)
                        .layoutPriority(1)

                    Text("Profile").padding(.bottom, 15).foregroundColor(Color("CCF-color"))
                }.frame(width: 140, height: 125, alignment: .center)
                .background(Color(.clear))
              }
              .overlay(
                  Rectangle()
                      .frame(width: 180, height: 0.8, alignment: .center)
                      .foregroundColor(.gray),
                      alignment: .bottom)

            })
            .frame(width: 250, alignment: .leading)
            .background(Color(.clear))
            .buttonStyle(BorderlessButtonStyle())
            
            ///SETTINGS
            Button(action: {
                self.selected = 2
            }, label: {
              VStack {
                NavigationLink(destination: SettingsView(), tag: 2, selection: $selected) {
                    EmptyView()
                }
                VStack(spacing: 8) {
                    Image(systemName: "gear")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundColor(Color.gray)
                        .aspectRatio(contentMode: .fit)
                        .layoutPriority(1)

                    Text("Settings").padding(.bottom, 15).foregroundColor(Color("CCF-color"))
                }.frame(width: 140, height: 125, alignment: .center)
                .background(Color(.clear))
              }
              .overlay(
                  Rectangle()
                      .frame(width: 180, height: 0.8, alignment: .center)
                      .foregroundColor(.gray),
                      alignment: .bottom)

            })
            .frame(width: 250, alignment: .leading)
            .background(Color(.clear))
            .buttonStyle(BorderlessButtonStyle())

            ///USER'S LOCATION
            Button(action: {
                selected = 4
            }, label: {
              VStack {
                NavigationLink(destination: LocationMapView(),tag: 4, selection: $selected) {
                    EmptyView()
                }
                VStack(spacing: 8) {
                    Image(systemName: "mappin.and.ellipse")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundColor(Color.orange)
                        .aspectRatio(contentMode: .fit)
                        .layoutPriority(1)

                    Text("Location").padding(.bottom, 15).foregroundColor(Color("CCF-color"))
                }.frame(width: 140, height: 125, alignment: .center)
                .background(Color(.clear))

              }
              .overlay(
                  Rectangle()
                      .frame(width: 180, height: 0.8, alignment: .center)
                      .foregroundColor(.gray),
                      alignment: .bottom)

            })
            .buttonStyle(BorderlessButtonStyle())
            .frame(width: 250 , alignment: .leading)
            .background(Color.clear)
            .buttonStyle(BorderlessButtonStyle())

            ///INSTAGRAM
            Button(action: {
                selected = 5
            }, label: {
              VStack {
                VStack(spacing: 8) {
                    Image("instagram")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundColor(Color.purple.opacity(0.25))
                        .aspectRatio(contentMode: .fit)
                        .layoutPriority(1)

                    Text("Instagram").padding(.bottom, 15).foregroundColor(Color("CCF-color"))
                }.frame(width: 140, height: 125, alignment: .center)
                .background(Color(.clear))

              }
              .overlay(
                  Rectangle()
                      .frame(width: 180, height: 0.8, alignment: .center)
                      .foregroundColor(.gray),
                      alignment: .bottom)

            })
            .buttonStyle(BorderlessButtonStyle())
            .frame(width: 250 , alignment: .leading)
            .background(Color.clear)
            .navigationBarBackButtonHidden(true)
            .buttonStyle(BorderlessButtonStyle())


            /// YOUTUBE
            Button(action: {
                selected = 6
            }, label: {
                VStack {
                  NavigationLink(destination: YoutubeView(),tag: 5, selection: $selected) {
                      EmptyView()
                  }
                }
              VStack {
                VStack(spacing: 8) {
                    Image("youtube")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundColor(Color.red)
                        .aspectRatio(contentMode: .fit)
                        .layoutPriority(1)

                    Text("Youtube").padding(.bottom, 15).foregroundColor(Color("CCF-color"))
                }.frame(width: 140, height: 125, alignment: .center)
                .background(Color("Color"))
              }
              .overlay(
                  Rectangle()
                      .frame(width: 180, height: 0.8, alignment: .center)
                      .foregroundColor(.gray),
                      alignment: .bottom)

            })
            .buttonStyle(BorderlessButtonStyle())
            .frame(width: 250 , alignment: .leading)
            .background(Color.clear)
            .buttonStyle(BorderlessButtonStyle())
             Spacer()
             
        } ///END-VStack
        .buttonStyle(BorderlessButtonStyle())
        .frame(width: 250, height: 980,  alignment: .trailing)
        .background(Color("Color")).edgesIgnoringSafeArea(.bottom)
        .padding(.top, -32)
        }  ///END-Group
        }  ///END-ScrollView

    } ///END-ScrollViewReader
  }
}



    


/**
 //                            .offset(x: self.showTop ? 300 : -UIScreen.main.bounds.width)
                             .animation(.default)

 */

/**
struct CustomImageView: View {
    var urlString: String
    @ObservedObject var imageLoader = ImageLoaderService()
    @State var image: UIImage = UIImage()
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width:100, height:100)
            .onReceive(imageLoader.$image) { image in
                self.image = image
            }
            .onAppear {
                imageLoader.loadImage(for: urlString)
            }
    }
}


class ImageLoaderService: ObservableObject {
    @Published var image: UIImage = UIImage()
    
    func loadImage(for urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data) ?? UIImage()
            }
        }
        task.resume()
    }
    
}
*/

/**
struct ImageView: View {
    @ObservedObject private var imageViewModel: ImageViewModel
    
    init(urlString: String?) {
        imageViewModel = ImageViewModel(urlString: urlString)
    }
    
    var body: some View {
        Image(uiImage: imageViewModel.image ?? UIImage())
            .resizable()
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(urlString: "https://developer.apple.com/news/images/og/swiftui-og.png")
    }
}
*/
