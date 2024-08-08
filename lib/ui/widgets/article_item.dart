import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:myapp/ui/screens/article_details_view.dart';
import 'package:myapp/utils/color_manager.dart';

Widget buildArticleItem(context, article) {
  var urlToImage = article["urlToImage"];
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticleDetailsView(
                    url: "${article["url"]}", name: '${article["publishedAt"]}',
                  )), );
    },
    child: Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: ConditionalBuilder(
                condition: urlToImage != null,
                builder: (context) => Image.network(
                      "${article["urlToImage"]}",
                      height: 180,
                      width: 300,
                    ),
                fallback: (context) => const Icon(
                      Icons.error,
                      color: Color(ColorManager.bottomNavBarItemColor),
                    )),
            // child: Image.network(
            //   "${article["urlToImage"]}",
            //   height: 180,
            // ),
          ),
          const SizedBox(
            height: 3,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              "${article["title"]}",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff002366)),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            "${article["publishedAt"]}",
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 126, 145, 180)),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}
