// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const InstagramHomePage());
}

class InstagramHomePage extends StatelessWidget {
  const InstagramHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      theme: ThemeData(
        primaryColor: const Color(0xFF262626),
        canvasColor: Colors.black,
        fontFamily: 'SF Pro Display',
      ),
      home: const StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isAppBarVisible = true;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      _isAppBarVisible = _scrollController.position.userScrollDirection ==
          ScrollDirection.reverse;
    });
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
              toolbarHeight: _isAppBarVisible ? 5 : 35,
              elevation: 0,
              backgroundColor: Colors.black,
              actions: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(children: [
                    Icon(Icons.favorite_border, color: Colors.white),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(Icons.send, color: Colors.white),
                  ]),
                )
              ],
              title: _isAppBarVisible
                  ? null
                  : Row(
                      children: [
                        Image.asset(
                          "lib/instalogo.png",
                          width: 140,
                        )
                      ],
                    ),
              floating: true,
              snap: true,
              pinned: true),
          SliverList.list(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            foregroundImage: AssetImage("lib/images.jpeg"),
                          ),
                          const SizedBox(width: 8),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Muhammed_Els",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              Text("My City",
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          SizedBox(width: deviceWidth * 0.45),
                          const Icon(Icons.more_horiz, color: Colors.white),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Image.asset("lib/post_1.jpg",
                        height: 400, width: double.infinity, fit: BoxFit.cover),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: toggleFavorite,
                            icon: Icon(
                              color: isFavorite ? Colors.red : Colors.white,
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                            ),
                          ),
                          const Icon(
                            Icons.mode_comment_outlined,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 10.0),
                          const Icon(Icons.send, color: Colors.white),
                          const SizedBox(width: 240.0),
                          const Icon(Icons.bookmark_sharp, color: Colors.white)
                        ],
                      ),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 12, bottom: 10),
                          child: Text(
                            "234 likes",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12, bottom: 10),
                          child: Row(
                            children: [
                              Text(
                                "Muhammed_Els",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                "Beach day!",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12, bottom: 10),
                          child: Text(
                            "View 23 comments",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            foregroundImage: AssetImage("lib/user_2.jpeg"),
                          ),
                          const SizedBox(width: 8),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Marc_nk",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              Text("Home",
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          SizedBox(width: deviceWidth * 0.45),
                          const Icon(Icons.more_horiz, color: Colors.white),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Image.asset("lib/post_2.jpg",
                        height: 400, width: double.infinity, fit: BoxFit.cover),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: toggleFavorite,
                            icon: Icon(
                              color: isFavorite ? Colors.red : Colors.white,
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                            ),
                          ),
                          const Icon(
                            Icons.mode_comment_outlined,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 10.0),
                          const Icon(Icons.send, color: Colors.white),
                          const SizedBox(width: 240.0),
                          const Icon(Icons.bookmark_sharp, color: Colors.white)
                        ],
                      ),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 12, bottom: 10),
                          child: Text(
                            "4444 likes",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12, bottom: 10),
                          child: Row(
                            children: [
                              Text(
                                "Marc_nk",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                "This is my cat. I like my cat.",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12, bottom: 10),
                          child: Text(
                            "View 2300 comments",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            foregroundImage: AssetImage("lib/user_3.jpeg"),
                          ),
                          const SizedBox(width: 8),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Ahmed_ks",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              Text("Sweden",
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          SizedBox(width: deviceWidth * 0.45),
                          const Icon(Icons.more_horiz, color: Colors.white),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Image.asset("lib/post_3.jpg",
                        height: 400, width: double.infinity, fit: BoxFit.cover),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: toggleFavorite,
                            icon: Icon(
                              color: isFavorite ? Colors.red : Colors.white,
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                            ),
                          ),
                          const Icon(
                            Icons.mode_comment_outlined,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 10.0),
                          const Icon(Icons.send, color: Colors.white),
                          const SizedBox(width: 240.0),
                          const Icon(Icons.bookmark_sharp, color: Colors.white)
                        ],
                      ),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 12, bottom: 10),
                          child: Text(
                            "4232 likes",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12, bottom: 10),
                          child: Row(
                            children: [
                              Text(
                                "Ahmed_ks",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                "Beach day!",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12, bottom: 10),
                          child: Text(
                            "View 340 comments",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey, width: 0.4),
          ),
        ),
        child: const BottomAppBar(
            color: Colors.black,
            child: Padding(
                padding: EdgeInsets.only(top: 10.0, right: 6, left: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.home_filled, color: Colors.white),
                    Icon(Icons.search_outlined, color: Colors.white),
                    Icon(Icons.add_box_outlined, color: Colors.white),
                    Icon(Icons.video_collection, color: Colors.white),
                    CircleAvatar(
                      foregroundImage: AssetImage("lib/WEBTABB_LOGO.png"),
                    )
                  ],
                ))),
      ),
    );
  }
}
