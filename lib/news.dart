import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:html/parser.dart';
import 'wp-rest.dart';
import 'full-post.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'contact.dart';
import 'social.dart';

class NewsListPage extends StatefulWidget {
  NewsListPage({Key key}) : super(key: key);

  @override
  NewsListPageState createState() => NewsListPageState();
}

class NewsListPageState extends State<NewsListPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: FutureBuilder(
            future: fetchWpPosts(),
            builder: (context,snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index){
                    Map wppost = snapshot.data[index];
                    var imageUrl = (wppost['_embedded']['wp:featuredmedia'] != null) ? wppost['_embedded']['wp:featuredmedia'][0]['source_url'] : 'https://www.blog.ruvem.ru/noimage-420x273.jpg';
                    return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: InkWell(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 24),
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
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
                                SizedBox(height: 12,),
                                HtmlWidget(
                                  wppost['title']['rendered'],
                                  textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  parse((wppost['excerpt']['rendered']).toString()).documentElement.text,
                                  maxLines: 2,
                                  style: TextStyle(color: Colors.black54, fontSize: 14),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreenPost(wppost['title']['rendered'],wppost['content']['rendered'],imageUrl),
                              ),
                            );
                          },
                        )
                    );

                  },
                );
              }
              return Container(
                  child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      )
                  )
              );
            },
          ),
        )
    );
  }
}