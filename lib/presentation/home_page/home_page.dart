import 'package:flutter/material.dart';
import 'package:poker/core/app_export.dart';
import 'package:poker/presentation/home_page/home_bloc/home_bloc.dart';
import 'package:poker/widgets/app_bar/custom_app_bar.dart';
import 'package:poker/widgets/custom_elevated_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc()..add(HomeGetEvent()),
      child: HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: CustomAppBar(
        height: 50.h,
        title: Padding(
          padding: EdgeInsets.all(12.h),
          child: Text(
            'Poker chance',
            style: theme.textTheme.headlineMedium,
          ),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoadedFullState) {
                return Column(
                  children: [
                    SizedBox(
                      height:50.v,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Your result',
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    SizedBox(
                      height: 20.v,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.v),
                      decoration: AppDecoration.outlinePrimary
                          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            state.resultModel.title,
                            style: CustomTextStyles.headlineMediumPrimary,

                          ),
                          SizedBox(
                            height: 16.v,
                          ),
                          Text(
                            state.resultModel.description,
                            style: theme.textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgHome1,
                    ),
                    Text(
                      'Start analyzing your\nvictories',
                      style: theme.textTheme.headlineLarge,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Analyze your successes and keep track\nof victories according to various\nparameters',
                      style: theme.textTheme.titleLarge
                          ?.copyWith(fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 100.v,
                    ),
                  ],
                );
              }
            },
          )),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 100.v, right: 10.h, left: 10.h),
        child: CustomElevatedButton(
          text: 'Start',
          onPressed: () {
            NavigatorService.pushNamed(AppRoutes.newAnalysisScreen);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
