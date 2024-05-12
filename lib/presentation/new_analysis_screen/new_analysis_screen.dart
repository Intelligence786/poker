import 'package:flutter/material.dart';
import 'package:poker/core/app_export.dart';
import 'package:poker/data/data_manager.dart';
import 'package:poker/data/models/analysis_model/analysis_model.dart';
import 'package:poker/widgets/custom_elevated_button.dart';
import 'package:poker/widgets/custom_text_form_field.dart';

import '../../widgets/app_bar/custom_app_bar.dart';

class NewAnalysisScreen extends StatefulWidget {
  const NewAnalysisScreen({super.key});

  static Widget builder(BuildContext context) {
    return NewAnalysisScreen();
  }

  @override
  State<NewAnalysisScreen> createState() => _NewAnalysisScreenState();
}

class _NewAnalysisScreenState extends State<NewAnalysisScreen> {
  CustomTextEditingController sumOfBetController =
      CustomTextEditingController();
  TextEditingController bluffCountController = TextEditingController();

  FocusNode sumOfBetNode = FocusNode();
  FocusNode bluffCountNode = FocusNode();

  bool isDisabled = false;

  int currentPage = 0;

  PageController _pageController = PageController();

  int game = -1;
  int numberOfOpponents = -1;
  double sumYourBet = .0;
  int behaviourStrategy = -1;
  int betStrategy = -1;
  int beginningCard = -1;
  int canYouBluff = -1;
  int countOfBluff = 0;
  int determinedOutcome = -1;
  int outcomeOfThisGame = -1;

  @override
  void initState() {
    isDisabled = true;
    super.initState();
  }

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
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'New analysis',
                  style: theme.textTheme.headlineMedium,
                ),
                Text(
                  '${currentPage + 1}/9',
                  style: CustomTextStyles
                      .titleLargePrimary, //theme.textTheme.titleLarge,
                ),
              ],
            ),
            SizedBox(
              height: 50.v,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 60.0),
                child: PageView.custom(
                  physics: NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  // physics: NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  childrenDelegate: SliverChildListDelegate(
                    [
                      CustomChooserWidget(
                        onTap: (value) {
                          game = value;
                          setState(() {
                            isDisabled = false;
                          });
                        },
                        options: DataManager.game,
                        title: 'Select a game',
                      ),
                      CustomChooserWidget(
                        onTap: (value) {
                          numberOfOpponents = value;
                          setState(() {
                            isDisabled = false;
                          });
                        },
                        options: DataManager.oponnentsCount,
                        title: 'Number of Opponents',
                      ),
                      CustomTextFormField(
                        controller: sumOfBetController,
                        focusNode: sumOfBetNode,
                        textStyle: CustomTextStyles.bodyLargeBlack900,
                        hintText: 'Sum your bet',
                        textInputType: TextInputType.number,
                        onChanged: (value) {
                          sumYourBet = double.parse(value);
                          setState(
                            () {
                              sumOfBetNode.requestFocus();
                              isDisabled = sumOfBetController.text.isEmpty;
                            },
                          );
                        },
                      ),
                      CustomChooserWidget(
                        onTap: (value) {
                          behaviourStrategy = value;
                          setState(() {
                            isDisabled = false;
                          });
                        },
                        options: DataManager.behaviourStrategy,
                        title: 'What strategy did you use?',
                      ),
                      CustomChooserWidget(
                        onTap: (value) {
                          betStrategy = value;
                          setState(() {
                            isDisabled = false;
                          });
                        },
                        options: DataManager.betStrategy,
                        title: 'What strategy did you use?',
                      ),
                      CustomChooserWidget(
                        onTap: (value) {
                          beginningCard = value;
                          setState(() {
                            isDisabled = false;
                          });
                        },
                        options: DataManager.beginningCards,
                        title:
                            'What cards did you have at the beginning of the game?',
                      ),
                      _buildBluffWidget(context),
                      CustomChooserWidget(
                        onTap: (value) {
                          determinedOutcome = value;
                          setState(() {
                            isDisabled = false;
                          });
                        },
                        options: DataManager.determinedOutcome,
                        title: 'What determined the outcome of the game?',
                      ),
                      CustomChooserWidget(
                        onTap: (value) {
                          outcomeOfThisGame = value;
                          setState(() {
                            isDisabled = false;
                          });
                        },
                        options: DataManager.outcomeOfThisGame,
                        title: 'What is the outcome of this game?',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: CustomElevatedButton(
          onPressed: () {
            setState(() {
              isDisabled = true;
            });
            if (currentPage < 8) {
              _pageController.nextPage(
                  duration: Duration(milliseconds: 100), curve: Curves.linear);
            } else {
              AnalysisModel analysisModel = AnalysisModel(
                game: game,
                numberOfOpponents: numberOfOpponents,
                sumYourBet: sumYourBet,
                behaviourStrategy: behaviourStrategy,
                betStrategy: betStrategy,
                beginningCard: beginningCard,
                canYouBluff: canYouBluff,
                countOfBluff: countOfBluff,
                determinedOutcome: determinedOutcome,
                outcomeOfThisGame: outcomeOfThisGame,
              );

              DataManager.saveAnalysisModel(analysisModel);

              NavigatorService.popAndPushNamed(AppRoutes.navigationBarScreen);
            }
          },
          isDisabled: isDisabled,
          text: 'Continue',
          buttonStyle: ElevatedButton.styleFrom(
            disabledBackgroundColor:
                theme.colorScheme.primary.withOpacity(.3), // Background Color
            disabledForegroundColor: theme.colorScheme.onPrimaryContainer
                .withOpacity(.3), //Text Color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _buildBluffWidget(BuildContext context) {
    return Column(
      children: [
        CustomChooserWidget(
          options: DataManager.canYouBluff,
          title: 'Can you bluff?',
          isBluff: true,
          onTap: (value) {
            canYouBluff = value;
          },
        ),
        SizedBox(
          height: 20.v,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'How many times?',
            style: theme.textTheme.titleLarge,
          ),
        ),
        SizedBox(
          height: 20.v,
        ),
        CustomTextFormField(
          controller: bluffCountController,
          focusNode: bluffCountNode,
          textStyle: CustomTextStyles.bodyLargeBlack900,
          textInputType: TextInputType.number,
          onChanged: (value) {
            countOfBluff = int.parse(value);
            setState(
              () {
                bluffCountNode.requestFocus();
                isDisabled = bluffCountController.text.isEmpty;
              },
            );
          },
        ),
      ],
    );
  }
}

class CustomTextEditingController extends TextEditingController {
  @override
  TextSpan buildTextSpan(
      {required BuildContext context,
      TextStyle? style,
      bool withComposing = false}) {
    final customText =
        '$text${text.isNotEmpty ? '\$' : ''}'; // Add $ sign at the end
    return TextSpan(text: customText, style: style);
  }
}

class CustomChooserWidget extends StatefulWidget {
  final List<String> options;
  final String title;
  final Function(int)? onTap;
  final bool isBluff;

  const CustomChooserWidget(
      {super.key,
      required this.options,
      required this.title,
      this.onTap,
      this.isBluff = false});

  @override
  State<CustomChooserWidget> createState() => _CustomChooserWidgetState();
}

class _CustomChooserWidgetState extends State<CustomChooserWidget> {
  int choiseIndex = -1;

  @override
  void initState() {
    if (widget.isBluff) {
      choiseIndex = 1;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.title,
            style: theme.textTheme.titleLarge,
          ),
        ),
        SizedBox(
          height: 20.v,
        ),
        !widget.isBluff
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: widget.options
                    .map(
                      (option) => Container(
                        margin: EdgeInsets.symmetric(vertical: 5.v),
                        height: 52.v,
                        width: 110.h,
                        decoration: customBoxDecoration(choiseIndex != -1
                            ? widget.options[choiseIndex] == option
                            : false),
                        child: InkWell(
                          onTap: () {
                            changeState(option, widget.options);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.h),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${option}',
                                    textAlign: TextAlign.right,
                                    style: (choiseIndex != -1
                                            ? widget.options[choiseIndex] ==
                                                option
                                            : false)
                                        ? CustomTextStyles.bodyLargeOnPrimary
                                        : theme.textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: widget.options
                    .map(
                      (option) => Flexible(
                        child: Container(
                          margin: EdgeInsets.only(right: 5.h),
                          height: 52.v,
                          //width: 110.h,
                          decoration: customBoxDecoration(choiseIndex != -1
                              ? widget.options[choiseIndex] == option
                              : false),
                          child: InkWell(
                            onTap: () {
                              changeState(option, widget.options);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.h),
                              child: Align(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${option}',
                                      textAlign: TextAlign.center,
                                      style: (choiseIndex != -1
                                              ? widget.options[choiseIndex] ==
                                                  option
                                              : false)
                                          ? (widget.isBluff
                                              ? CustomTextStyles
                                                  .bodyLargeBlack900
                                              : CustomTextStyles
                                                  .bodyLargeOnPrimary)
                                          : theme.textTheme.bodyLarge,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              )
      ],
    );
  }

  changeState(option, List<String> options) {
    setState(() {
      for (int i = 0; i < options.length; i++) {
        if (options[i] == option) {
          setState(() {
            choiseIndex = i;
            widget.onTap?.call(choiseIndex);
            print(i);
          });
        }
      }
    });
  }

  customBoxDecoration(isActive) {
    return BoxDecoration(
      color: isActive
          ? (widget.isBluff ? Colors.white : theme.colorScheme.primary)
          : theme.colorScheme.onPrimaryContainer,
      border: isActive && widget.isBluff
          ? Border.all(color: theme.colorScheme.primary)
          : Border.all(color: Colors.white),
      borderRadius: const BorderRadius.all(
        Radius.circular(8.0),
      ),
    );
  }
}
