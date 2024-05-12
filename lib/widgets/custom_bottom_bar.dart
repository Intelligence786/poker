
import  'package:flutter/material.dart';
import  '../core/app_export.dart';

enum  BottomBarEnum  {  Home,  News,  Settings  }
//  ignore_for_file:  must_be_immutable
class  CustomBottomBar  extends  StatefulWidget  {
    CustomBottomBar({this.onChanged});
    Function(BottomBarEnum)?  onChanged;
    @override
    CustomBottomBarState  createState()  =>  CustomBottomBarState();
}
//  ignore_for_file:  must_be_immutable
class  CustomBottomBarState  extends  State<CustomBottomBar>  {
    int  selectedIndex  =  0;
    List<BottomMenuModel>  bottomMenuList  =  [
        BottomMenuModel(
            icon:  ImageConstant.imgHomeDisable,
            activeIcon:  ImageConstant.imgHomeEnabled,
            title:  'Home',
            type:  BottomBarEnum.Home,
        ),
        BottomMenuModel(
            icon:  ImageConstant.imgNewsDisabled,
            activeIcon:  ImageConstant.imgNewsEnabled,
            title:  'News',
            type:  BottomBarEnum.News,
        ),
        BottomMenuModel(
            icon:  ImageConstant.imgSettingsDisabled,
            activeIcon:  ImageConstant.imgSettingsEnabled,
            title:  'Settings',
            type:  BottomBarEnum.Settings,
        )
    ];
    @override
    Widget  build(BuildContext  context)  {
        return  Container(
            height:  98.v,
            decoration:  BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black.withAlpha(50), blurRadius: 10, spreadRadius: 1),],
                borderRadius:  BorderRadius.vertical(
                    top:  Radius.circular(16.h),
                ),
            ),
            child:  BottomNavigationBar(
                backgroundColor:  Colors.transparent,
                showSelectedLabels:  false,
                showUnselectedLabels:  false,
                selectedFontSize:  0,
                elevation:  0,
                currentIndex:  selectedIndex,
                type:  BottomNavigationBarType.fixed,
                items:  List.generate(bottomMenuList.length,  (index)  {
                    return  BottomNavigationBarItem(
                        icon:  Column(
                            mainAxisSize:  MainAxisSize.min,
                            crossAxisAlignment:  CrossAxisAlignment.center,
                            children:  [
                                CustomImageView(
                                    imagePath:  bottomMenuList[index].icon,
                                    height:  24.adaptSize,
                                    width:  24.adaptSize,
                                    color:  appTheme.black900,
                                ),
                                Opacity(
                                    opacity:  0.6,
                                    child:  Padding(
                                        padding:  EdgeInsets.only(top:  5.v),
                                        child:  Text(
                                            bottomMenuList[index].title  ??  "",
                                            style:  theme.textTheme.bodyMedium!.copyWith(
                                                color:  appTheme.black900.withOpacity(0.56),
                                            ),
                                        ),
                                    ),
                                )
                            ],
                        ),
                        activeIcon:  Column(
                            mainAxisSize:  MainAxisSize.min,
                            crossAxisAlignment:  CrossAxisAlignment.center,
                            children:  [
                                CustomImageView(
                                    imagePath:  bottomMenuList[index].activeIcon,
                                    height:  24.adaptSize,
                                    width:  24.adaptSize,
                                    color:  theme.colorScheme.primary,
                                ),
                                Padding(
                                    padding:  EdgeInsets.only(top:  5.v),
                                    child:  Text(
                                        bottomMenuList[index].title  ??  "",
                                        style:  CustomTextStyles.bodyMediumPrimary.copyWith(
                                            color:  theme.colorScheme.primary,
                                        ),
                                    ),
                                )
                            ],
                        ),
                        label:  '',
                    );
                }),
                onTap:  (index)  {
                    selectedIndex  =  index;
                    widget.onChanged?.call(bottomMenuList[index].type);
                    setState(()  {});
                },
            ),
        );
    }
}
class  BottomMenuModel  {
    BottomMenuModel(
            {required  this.icon,
            required  this.activeIcon,
            this.title,
            required  this.type});
    String  icon;
    String  activeIcon;
    String?  title;
    BottomBarEnum  type;
}
class  DefaultWidget  extends  StatelessWidget  {
    @override
    Widget  build(BuildContext  context)  {
        return  Container(
            color:  Color(0xffffffff),
            padding:  EdgeInsets.all(10),
            child:  Center(
                child:  Column(
                    crossAxisAlignment:  CrossAxisAlignment.start,
                    mainAxisAlignment:  MainAxisAlignment.center,
                    children:  [
                        Text(
                            'Please  replace  the  respective  Widget  here',
                            style:  TextStyle(
                                fontSize:  18,
                            ),
                        )
                    ],
                ),
            ),
        );
    }
}