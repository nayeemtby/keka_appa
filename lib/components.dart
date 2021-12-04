import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';
import 'data.dart';

class TabScreen extends StatelessWidget {
  final String cat;
  const TabScreen({Key? key, required this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List data = bdfood[cat];
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: data.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemBuilder: (BuildContext ctx, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) => DetailsScreen(
                          data: data[index], cat: cat, index: index)));
            },
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Hero(
                            tag: data[index]["title"],
                            child: Image.asset(
                                "assets/images/$cat/${index + 1}.jpg")),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          data[index]["title"],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    IconTheme(
                      data: const IconThemeData(color: Colors.red),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [Icon(Icons.watch), Text("30 min")],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.food_bank),
                              Text(data[index]["ingredients"].length.toString())
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class DetailsScreen extends StatefulWidget {
  final Map data;
  final String cat;
  final int index;
  const DetailsScreen({
    Key? key,
    required this.data,
    required this.cat,
    required this.index,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool cooked = false;
  bool fav = false;
  @override
  Widget build(BuildContext context) {
    final proc = widget.data['directions'] as List;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Details"),
            Text(
              "Category: " + catName[widget.cat]!,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share))],
      ),
      body: Column(
        children: [
          Stack(alignment: Alignment.bottomCenter, children: [
            Hero(
                tag: widget.data["title"],
                child: Image.asset(
                    "assets/images/${widget.cat}/${widget.index + 1}.jpg")),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.black54,
              width: MediaQuery.of(context).size.width,
              child: Text(
                widget.data["title"],
                style: const TextStyle(fontSize: 22, color: Colors.white),
              ),
            )
          ]),
          IconTheme(
            data: const IconThemeData(color: Colors.white),
            child: Row(
              children: [
                Expanded(
                    child: Material(
                  color: Colors.amber[800],
                  child: InkWell(
                    splashColor: Colors.amber,
                    splashFactory: InkRipple.splashFactory,
                    onTap: () {
                      setState(() {
                        cooked = !cooked;
                      });
                    },
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Icon(
                          Icons.check,
                          color: cooked ? Colors.amber[900] : null,
                        ),
                        const Text(
                          "COOKED",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ]),
                    ),
                  ),
                )),
                Expanded(
                    child: Material(
                  color: Colors.amber[700],
                  child: InkWell(
                    splashColor: Colors.amber,
                    splashFactory: InkRipple.splashFactory,
                    onTap: () {
                      setState(() {
                        fav = !fav;
                      });
                    },
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Icon(
                          Icons.favorite,
                          color: fav ? Colors.amber[900] : null,
                        ),
                        const Text(
                          "FAVOURITE",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ]),
                    ),
                  ),
                )),
                Expanded(
                  child: Material(
                    color: Colors.amber[600],
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => WatchVideo(
                                    title: widget.data['title'],
                                    url: widget.data['youtubeUrl'])));
                      },
                      child: SizedBox(
                          width: double.infinity,
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.video_collection_sharp),
                                Text(
                                  "VIDEO",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                )
                              ])),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ingredients",
                      style: TextStyle(fontSize: 20, color: Colors.amber[700]),
                    ),
                    Divider(
                      color: Colors.amber[900],
                      thickness: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var i = 0;
                              i < widget.data["ingredients"].length;
                              i++)
                            Row(
                              children: [
                                const Text(
                                  "\u2022 ",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 28),
                                ),
                                Text(
                                  widget.data["ingredients"][i],
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            )
                        ],
                      ),
                    ),
                    Text(
                      "Procedure",
                      style: TextStyle(fontSize: 20, color: Colors.amber[700]),
                    ),
                    Divider(
                      color: Colors.amber[900],
                      thickness: 2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (var i = 0; i < proc.length; i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  (i + 1).toString() + ". ",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Expanded(
                                    child: Text(
                                  proc[i],
                                  style: const TextStyle(fontSize: 18),
                                ))
                              ],
                            ),
                          )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class WatchVideo extends StatelessWidget {
  final String title;
  final String url;
  const WatchVideo({Key? key, required this.title, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _url = url.substring(17);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          title,
          maxLines: 1,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: WebViewX(
          width: size.width,
          height: size.height,
          javascriptMode: JavascriptMode.unrestricted,
          initialSourceType: SourceType.html,
          initialContent: """
        <iframe width='${size.width - 20}' height='${(size.width - 20) * 0.589}' src='https://www.youtube.com/embed/$_url' title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>
        """,
        ),
      ),
    );
  }
}
