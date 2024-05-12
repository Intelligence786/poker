import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../data/data_manager.dart';
import '../../data/models/news_model/news_model.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  static Widget builder(BuildContext context) {
    return NewsPage();
  }

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<NewsModel> newsModelList = [];

  @override
  void initState() {
    // TODO: implement initState
    newsModelList = DataManager.getAllNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: CustomAppBar(
        height: 50,
        title: Padding(
          padding: EdgeInsets.all(12.h),
          child: Text(
            'News',
            style: theme.textTheme.headlineMedium,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: newsModelList.length,
                  itemBuilder: (context, index) {
                    return _newsItemBuild(
                      context,
                      newsModelList[index],
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 80.v,
            )
          ],
        ),
      ),
    );
  }

  Widget _newsItemBuild(BuildContext context, NewsModel newsModel) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 8.v,
      ),
      decoration: AppDecoration.surface.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadiusStyle.roundedBorder8,
          onTap: () {
            NavigatorService.pushNamed(AppRoutes.newsContentScreen,
                arguments: newsModel);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomImageView(
                  imagePath: newsModel.imgUrl,
                  height: 100.adaptSize,
                  width: 100.adaptSize,
                  fit: BoxFit.cover,
                  radius: BorderRadius.horizontal(
                    left: Radius.circular(8),
                  ),
                ),
                SizedBox(width: 10.h),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 3.v,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(newsModel.title!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.titleLarge),
                        ),
                        SizedBox(
                          height: 10.v,
                        ),
                        SizedBox(
                          child: Text('Read more',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.titleMedium
                                  ?.copyWith(color: theme.colorScheme.primary)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
