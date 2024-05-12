import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static Widget builder(BuildContext context) {
    return SettingsPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: CustomAppBar(
        height: 50,
        title: Padding(
          padding: EdgeInsets.all(12.h),
          child: Text(
            'Settings',
            style: theme.textTheme.headlineMedium,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 100.v,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 15.v),
              decoration: AppDecoration.outlinePrimary
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
              child: Column(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgSettings1,
                  ),
                  SizedBox(
                    height: 30.v,
                  ),
                  Text(
                    'Your opinion is important',
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 20.v,
                  ),
                  CustomElevatedButton(text: 'Rate app'),
                ],
              ),
            ),
            SizedBox(
              height: 20.v,
            ),
            _buildButton(context,
                name: 'Terms of use', imagePath: ImageConstant.imgTerms),
            SizedBox(
              height: 8.v,
            ),
            _buildButton(context,
                name: 'Privacy Policy', imagePath: ImageConstant.imgPrivacy),
            SizedBox(
              height: 8.v,
            ),
            _buildButton(context,
                name: 'Support page', imagePath: ImageConstant.imgSupport),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context, {
    String name = '',
    String imagePath = '',
    VoidCallback? onTap,
  }) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadiusStyle.roundedBorder8,
        onTap: () {
          onTap?.call();
        },
        child: Container(
          padding: EdgeInsets.all(16.h),
          decoration: AppDecoration.surface
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
          child: Row(
            children: [
              CustomImageView(
                imagePath: imagePath,
              ),
              SizedBox(
                width: 8.h,
              ),
              Expanded(
                child: Text(
                  name,
                  style: CustomTextStyles.bodyLargePrimary,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: theme.colorScheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
