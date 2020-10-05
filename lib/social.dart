import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialPage extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
    builder: (context) => SocialPage(),
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "",
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2 ,
              children: <Widget>[
                InkWell(
                  child: Card(
                      child: Container(
                        color: Colors.blue,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                                "VK",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 83)
                            ),
                          ),
                        ),
                      ),
                    ),
                  onTap: () {
                    const url = 'https://vk.com/id244766661';
                    if (canLaunch(url) != null) {
                      launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                InkWell(
                 child: Card(
                   child: Container(
                     width: 150,
                     height: 50,
                     color: Colors.pink,
                     child: Center(
                       child: Padding(
                         padding: const EdgeInsets.all(12.0),
                         child: Text(
                             "Instagram",
                             style: TextStyle(
                                 color: Colors.white,
                                 fontWeight: FontWeight.bold,
                                 fontSize: 63)
                         ),
                       ),
                     ),
                   ),
                 ),
                  onTap: () {
                    const url = 'https://www.instagram.com/fred_astairee/';
                    if (canLaunch(url) != null) {
                      launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                InkWell(
                  child: Card(
                    child: Container(
                      width: 150,
                      height: 50,
                      color: Colors.lightBlueAccent,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(Entypo.twitter, size: 54,color: Colors.white,),
                                ),
                                TextSpan(
                                  text: "twitter ",
                                  style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    const url = 'https://twitter.com/malyshevdev';
                    if (canLaunch(url) != null) {
                      launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                InkWell(
                  child: Card(
                    child: Container(
                      color: Colors.indigo,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                              "facebook",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 73)
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    const url = 'https://www.facebook.com/profile.php?id=100011391153733';
                    if (canLaunch(url) != null) {
                      launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
            ]
          ),
          )
        ],
      ),
    );
  }
}