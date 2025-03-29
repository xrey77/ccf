//
//  AboutUsView.swift
//  SideMenu
//
//  Created by Reynald Marquez-Gragasin on 3/11/25.
//

import SwiftUI

struct AboutusView: View {
    @State private var isExpanded = false
    
    var body: some View {
        ZStack {
            Color.purple.opacity(0.25).ignoresSafeArea()
            ScrollViewReader { scrollView in
            VStack {
                Text("Who are we?").bold().font(.title)
                TextView(text: "WE ARE A MOVEMENT OF MEN AND WOMEN WHO HAVE ENCOUNTERED GOD AND COMMITTED OUR LIVES TO THE LORD, FOCUSED ON MAKING AN IMPACT THROUGH THE WORK OF THE HOLY SPIRIT IN TRANSFORMING LIVES, FAMILIES, COMMUNITIES AND NATIONS, FOR THE GLORY OF GOD!").frame(width: 350, height: 200)
            }.padding(.top, -30)
            ScrollView(showsIndicators: false) {
            VStack {
                ///OUR MISSION
                DisclosureGroup("                         Our Mission") {
                        Text("\nTO HONOR GOD AND MAKE CHRIST-COMMITTED FOLLOWERS WHO WILL MAKE CHRIST-COMMITTED FOLLOWERS.\n \n 'Go and make disciples of all nations, baptizing them in the name of the Father and of the Son and of the Holy Spirit, and teaching them to obey everything I have commanded you'. Matthew 28:19-20").font(.system(size: 14)).multilineTextAlignment(.leading)
                }
                .font(.system(size: 20))
                .frame(width: 350, alignment: .center)
                ///END-OUR MISSION
                
                ///OUR VISION
                DisclosureGroup("                           Our Vision") {
                        Text("\nOUR VISION IS TO SEE A MOVEMENT OF MILLIONS OF COMMITTED FOLLOWERS OF THE LORD JESUS CHRIST MEETING IN SMALL GROUPS AND TRANSFORMING LIVES, FAMILIES, COMMUNITIES AND NATIONS, FOR THE GLORY OF GOD.\n ").font(.system(size: 14)).multilineTextAlignment(.leading)
                }
                .font(.system(size: 20))
                .frame(width: 350, alignment: .center)
                
                ///END-OUR VISION
                
                DisclosureGroup("                       Our Core Values") {
                        Text("\nEVERY CHURCH HAS ITS OWN SET OF VALUES. PART OF WHAT UNITES CCF IS OUR COMMON SET OF VALUES THAT HELP GUIDE US WITH OUR PRIORITIES IN OUR WALK WITH GOD.\n \nL ove God, Love Others\nConsistent personal devotions, prayer time, and personal study of God’s word Love displayed even for people who are difficult to love; seek to maintain good relationships\nNo critical spirit or participation in gossip Private life is in order (free from immorality and pornography, computer games, and other addictions) Consistent sharing of the gospel and discipleship of others Application\n\nO bey God’s Word and Authorities\nApplication of God’s word in everyday life Decisions made and priorities set based on Scripture Submission to God-given authorities with respect and a positive attitude Display of consistent humility; willing acceptance of criticism, correction, and suggestions\n\nV olunteer\nUse of God-given gifts and talents to serve others Encouraging (or creation of opportunities for) others to serve Consistent leadership of (and attendance in) a small group Serving others even when inconvenient Tithes / offerings consistently given Good stewardship of God’s resources (time, talents, and treasure)\n\nE ngage the family\nQuality time spent and good relationships maintained with wife, children, (parents and siblings, if single)\nTemper kept under control — no physical abuse, no verbal abuse (shouting, hurtful words)\nSet a Christ-like example for family members\nFamily members walk with and serve the Lord\nIntentional discipleship of family members by having regular family devotions"
                            ).font(.system(size: 14)).multilineTextAlignment(.leading)
                }
                .font(.system(size: 20))
                .frame(width: 350, alignment: .center)

                ///END-OUR CORE VALUES

                DisclosureGroup("                  Our Statement of Faith") {
                        Text("\nWHAT DOES CCF BELIEVE ABOUT THE BIBLE?\n\nWe believe that the Bible, composed of 39 Old Testament books and 27 New Testament books, is the Word of God, supernaturally inspired, inerrant in its original form, infallible, so that it is our supreme authority in all matters of faith, doctrine and conduct.\n\nWHAT DOES CCF BELIEVE ABOUT GOD?\nWe believe that there is only one GOD eternally existent in three persons – Father, Son and Holy Spirit. He is the Creator of Heaven and Earth.\n\nWHAT DOES CCF BELIEVE ABOUT JESUS CHRIST?\n\nWe believe that Jesus Christ in the flesh is both God and Man, that He was conceived by the Holy Spirit and born of a virgin. He lived a sinless life. He was crucified and He died to pay the penalty of death for our sins. By His shed blood, the Lord Jesus Christ made a perfect sacrifice for sin once and for all time and was raised from the dead on the third day. Later He ascended to the Father’s right hand where He is the Head of the Church and intercedes for believers. We believe He is coming again to the Earth bodily and visibly to set up His Kingdom.\n\nWHAT DOES CCF BELIEVE ABOUT THE HOLY SPIRIT?\n\nWe believe that the Holy Spirit is God and possesses all the Divine attributes. He indwells all believers, baptizes and seals all believers at the moment they trust in Jesus Christ to be their only Savior and Lord. He controls and empowers all true believers to live the Christian life in response to their obedience, confession of sin, and yieldedness to Him.\n\nWHAT DOES CCF BELIEVE ABOUT HOW A PERSON IS SAVED?\n\nWe believe that Salvation, with its forgiveness of sins, impartation of a new nature, and eternal life, is a free gift from God received when a person trusts in Jesus Christ to be their only Savior and Lord. Salvation is given by God’s grace and cannot be earned by man through good works, baptism, church membership or any other means (Ephesians 2: 8-9).\n\nWHAT DOES CCF TEACH ABOUT THE ROLE OF GOOD WORKS IN A CHRISTIAN’S LIFE?\n\nWe believe that good works are not the means of salvation but are the expected product in the life of a true believer in Christ. It is every believer’s responsibility to pursue a life of good works through the power of the indwelling Holy Spirit.\n\nWHAT DOES CCF TEACH ABOUT EVERY CHRISTIAN’S MISSION?\nWe believe that it is God’s will and command for every Christian to be actively engaged in telling others how to establish a personal relationship with God through faith in Jesus Christ and in discipling those who respond to this good news of salvation pursuant to Matthew 28: 18-20.\n\nWHAT DOES CCF TEACH ABOUT BAPTISM?\nWe believe that water baptism by immersion is an act of obedience to Christ’s command. It is a public confession of our personal faith in Jesus Christ. (Matthew 28:19).\n\nWHAT DOES CCF TEACH ABOUT WHAT THE CHURCH IS?\nThe universal church is composed of all true believers who have trusted in Christ as their Lord and Savior and are committed to follow Him. The local church is composed of believers in a specific locality who have chosen to abide by that local church’s Mission, Vision, Core Values and Statement of Faith.\n\nWHAT DOES CCF BELIEVE ABOUT MARRIAGE?\nWe believe that marriage is the uniting of one man and one woman as biologically determined at birth in a single, exclusive union. (Gen 2:18-25.) We believe that God intends sexual intimacy to occur only between a man and a woman who are married to each other. (1 Cor 6:18; 7:2-5; Heb 13:4.)\n\nBecause God has ordained marriage and defined it as the covenant relationship between a man, a woman, and Himself, CCF will only recognize and solemnize marriages between a biological man and a biological woman who are committed to follow Jesus Christ as their Lord and Savior.\n\nWHAT IS CCF’S VIEW REGARDING TODAY’S ISSUES ABOUT GENDER?\nWe believe that God wonderfully and immutably creates each person as biologically male or biologically female. These two distinct, complementary genders together reflect the image and nature of God. (Gen 1:26-27.) Rejection of one’s biological sex is a rejection of the image of God within that person.\n\nWHAT IS CCF’S VIEW ABOUT THE VALUE OF HUMAN LIFE?\nWe believe that all human life is sacred and created by God in His image. Human life is of inestimable worth in all its dimensions, including pre-born babies, the aged, the physically or mentally challenged, and every other stage or condition from conception through natural death.\n\nThis statement of faith does not exhaust the extent of our beliefs. We believe that the Bible itself, as the inspired and infallible Word of God that speaks with final authority concerning truth, morality, and the proper conduct of mankind, is the sole and final source of all that we believe. Questions regarding our position about doctrinal issues and church policies are resolved by the CCF Board of Elders, which has the final authority and oversight of the CCF Movement.  ")
                            .font(.system(size: 14))
                            .multilineTextAlignment(.leading)
                }
                .font(.system(size: 20))
                .frame(width: 350, alignment: .center)
                ///END-OUR STATEMENT OF FAITH

                DisclosureGroup("                          Our Position") {
                        Text("\nPosition on Healing \nPosition on Theological Systems\nPosition on SOGIE Bill and LGBTQ\nThe RAVI ZACHARIAS Case: 14 Foundational Lessons").font(.system(size: 14)).multilineTextAlignment(.leading)
                }
                .font(.system(size: 20))
                .frame(width: 350, alignment: .center)
                ///END-OUR POSITION
                
            }
            .frame(width: 350, alignment: .topTrailing)
            .padding(.top, 0)
            }///END-SCROLLVIEW
        }
      }

    }

}

struct AboutusView_Previews: PreviewProvider {
    static var previews: some View {
        AboutusView()
    }
}

struct TextView: UIViewRepresentable {
    var text: String
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        textView.textAlignment = .justified
        textView.backgroundColor = .clear
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}

