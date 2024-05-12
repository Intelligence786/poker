import  'package:flutter/material.dart';
import  '../core/app_export.dart';

class  CustomButtonStyles  {
    static  ButtonStyle  get  fillPrimaryTL8  =>  ElevatedButton.styleFrom(
                backgroundColor:  theme.colorScheme.primary.withOpacity(0.46),
                shape:  RoundedRectangleBorder(
                    borderRadius:  BorderRadius.circular(8.h),
                ),
            );
    static  ButtonStyle  get  fillSecondaryContainer  =>  ElevatedButton.styleFrom(
                backgroundColor:  theme.colorScheme.secondaryContainer,
                shape:  RoundedRectangleBorder(
                    borderRadius:  BorderRadius.circular(8.h),
                ),
            );
    static  ButtonStyle  get  none  =>  ButtonStyle(
                backgroundColor:  MaterialStateProperty.all<Color>(Colors.transparent),
                elevation:  MaterialStateProperty.all<double>(0),
            );
}