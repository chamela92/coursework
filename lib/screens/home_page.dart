import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/services/data.dart';
import '../models/article_model.dart';
import '../models/category_model.dart';
import 'package:newsapp/screens/category_news.dart';
import '../services/news.dart';
import 'all_news.dart';
import 'article_view.dart';


class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage>createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomePage>{
  List<CategoryModel>categories =[];
  List<ArticleModel> articles = [];
  bool _loading = true, loading2=true;


  int activeIndex = 0;
  @override
  void initState(){
    categories =getCategories();
    getNews();
    super.initState();
  }

  getNews() async {
    News newsclass = News();
    await newsclass.getNews();
    articles = newsclass.news;
    setState(() {
      _loading = false;
    });
  }


  @override
  Widget build(BuildContext context) {

    int maxBlogTileCount = 3;
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Center(
              child: Text("News Waves",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
            )

          ],
        ),
        centerTitle: true,
        elevation: 0.0,

      ),
      body: Container(
        child: Column(
          children: [
          Container(
            margin: const EdgeInsets.only(left: 10.0),
            height: 70,
            child: ListView.builder(
              shrinkWrap: true,
                scrollDirection:Axis .horizontal,
                itemCount: categories.length,
                itemBuilder: (context,index){
                return CategoryTile (
                  image:categories [index].image,
                  categoryName: categories [index].categoryName,
                );

          }),
          ),
        const SizedBox(
          height: 30.0,
        ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Trending News!",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                  GestureDetector(

                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> AllNews(news: "Trending")));
                    },
                    child: const Text(
                      "View All",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 10.0,
            ),
            Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: min(articles.length, maxBlogTileCount),
                  //itemCount: articles.length,
                  itemBuilder: (context, index) {
                    return BlogTile(
                        url:  articles[index].url!,
                        desc: articles[index].description!,
                        imageUrl: articles[index].urlToImage!,
                        title: articles[index].title!);
                  }),
            )

      ],),
      ),
    );
  }

}

//display category template
class CategoryTile extends StatelessWidget {
  final image, categoryName;

  CategoryTile({this.categoryName, this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryNews(name: categoryName)));
        },
        child:Container(
         margin: const EdgeInsets.only(right: 16),
         child:Stack(
         children: [
          ClipRRect(
           borderRadius: BorderRadius.circular(8),
           child:Image.asset(image,
          width: 120,
          height: 70,fit :BoxFit.cover,
        )
          ),
          Container(
            width: 120,
            height: 70,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.black38,
    ),
            child:Center(
              child: Text(
                  categoryName,
                  style:const TextStyle (
                      color:Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  )
              ),
            ),
          )
      ],
      ),
    ),
    );



  }
}
class BlogTile extends StatelessWidget {
  String imageUrl, title, desc, url;
  BlogTile({required this.desc, required this.imageUrl, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ArticleView(blogUrl:url )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Material(
            elevation: 3.0,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: imageUrl,
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ))),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: Text(
                          title,
                          maxLines: 2,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 17.0),
                        ),
                      ),
                      const SizedBox(
                        height: 7.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: Text(
                          desc,
                          maxLines: 3,
                          style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}




