import 'package:flutter/material.dart';
import 'package:poker/core/app_export.dart';

import '../../data/models/news_model/news_model.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class NewsContentScreen extends StatefulWidget {
  final NewsModel newsModel;

  const NewsContentScreen({super.key, required this.newsModel});

  static Widget builder(BuildContext context, NewsModel newsModel) {
    return NewsContentScreen(
      newsModel: newsModel,
    );
  }

  @override
  State<NewsContentScreen> createState() => _NewsContentScreenState();
}

class _NewsContentScreenState extends State<NewsContentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          height: 50.v,
          leadingWidth: 100.h,
          leading: Container(
            width: 85.h,
            child: TextButton(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: appTheme.black900,
                  ),
                  SizedBox(width: 4.h),
                  Text(
                    'Back',
                    style: CustomTextStyles.bodyLargeBlack900,
                  ),
                ],
              ),
              onPressed: () {
                NavigatorService.goBack();
              },
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Container(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 160.v,
                    child: CustomImageView(
                      radius: BorderRadius.circular(8.h),
                      //   height: 60,
                      fit: BoxFit.fitWidth,
                      imagePath: widget.newsModel.imgUrl,
                    ),
                  ),
                  SizedBox(
                    height: 20.v,
                  ),
                  Text(
                    widget.newsModel.title ?? '',
                    style: theme.textTheme.headlineMedium,
                  ),
                  SizedBox(
                    height: 18.v,
                  ),
                  Text(
                    widget.newsModel.body ?? '',
                    style: theme.textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
