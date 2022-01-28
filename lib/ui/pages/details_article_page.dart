import 'package:flutter/material.dart';
import '../../models/article_model.dart';
import '../../themes/text_styles.dart';
import 'web_view_page.dart';

class DetailsArticlePage extends StatefulWidget {
  const DetailsArticlePage({Key? key, required this.article}) : super(key: key);
  final ArticleModel article;

  @override
  State<DetailsArticlePage> createState() => _DetailsArticlePageState();
}

class _DetailsArticlePageState extends State<DetailsArticlePage> {
  double fontSize = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.4,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    fontSize++;
                  });
                },
                icon: const Icon(Icons.zoom_in),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    fontSize--;
                  });
                },
                icon: const Icon(Icons.zoom_out),
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Chip(
                  backgroundColor: Colors.red,
                  label: Text(
                    widget.article.source.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(widget.article.urlToImage!),
                  ),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                widget.article.title,
                style: kDescriptionStateStyle.copyWith(fontSize: fontSize),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                widget.article.description,
                style: kDescriptionStateStyle.copyWith(fontSize: fontSize - 3),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                widget.article.content,
                style: kDescriptionStateStyle.copyWith(fontSize: fontSize - 3),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                  child: const Text(
                    'Click to see the full article',
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                  onPressed: () {
                    MaterialPageRoute(builder: (ctx) {
                      return  WebViewScreen(
                        blogUrl: widget.article.url,
                      );
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
