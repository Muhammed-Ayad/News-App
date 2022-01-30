import 'package:flutter/material.dart';
import '../../models/article_model.dart';
import '../../services/news_services.dart';
import '../widgets/article_item.dart';

class AllCategoryPage extends StatelessWidget {
  const AllCategoryPage({Key? key, required this.category}) : super(key: key);
  final String category;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FutureBuilder<List<ArticleModel>?>(
            future: NewsServices.getOneCategoryOfNews(category: category),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  children: const [
                    SizedBox(
                      height: 80,
                    ),
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                );
              }
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const PageScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ArticleItem(article: snapshot.data![index]);
                  },
                
                );
              } else {
                return Column(
                  children: const [
                    SizedBox(
                      height: 80,
                    ),
                    Center(
                      child: Text('There are no data'),
                    ),
                  ],
                );
              }
            },
          )
        ],
      ),
    );
  }
}
