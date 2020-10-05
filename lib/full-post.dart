import 'package:flutter/material.dart';
//import 'wp-rest.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';


class DetailScreenPost extends StatefulWidget {
  final String title;
  final String text;
  final String imageUrl;
  DetailScreenPost(this.title,this.text,this.imageUrl);
  @override
  DetailScreen createState() => DetailScreen(title,text,imageUrl);
}


class DetailScreen extends State<DetailScreenPost> {
  String title;
  String text;
  String imageUrl;
  DetailScreen(this.title,this.text,this.imageUrl);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Новость',
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
              child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Center(
                            child: FadeInImage.assetNetwork(
                                placeholder: 'assets/images/loading.gif',
                                image: imageUrl,
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HtmlWidget(
                          title,
                          textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HtmlWidget(text),
                      ),
                    ],
                  )
              )
          ),
        )
    );
  }
}