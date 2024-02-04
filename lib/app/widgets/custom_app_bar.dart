import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/presistance_bar_navigation.dart';

class CustomAppBar extends PreferredSize {
  CustomAppBar(
    BuildContext context, {
    super.key,
    String? title,
    Widget? titleWidget,
    double? leadingWidth,
    bool autoFocus = false,
    Widget? leadingWidget,
    bool centerTitle = true,
    double? elevation = 0.0,
    List<Widget>? actions,
    SystemUiOverlayStyle? systemOverlayStyle= SystemUiOverlayStyle.dark,
    Color? backgroundColor = Colors.transparent,
    Color? titleColor,
  }) : super(
          preferredSize: const Size.fromHeight(70.0),
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              boxShadow: (elevation == 0.0)
                  ? null
                  : const [
                      BoxShadow(
                        color: Color(0x29000000),
                        offset: Offset(0, 5),
                        blurRadius: 20,
                      )
                    ],
            ),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: AppBar(
                surfaceTintColor: Colors.transparent,
                scrolledUnderElevation: 0,
                key: key,
                toolbarHeight: 70.0,
                backgroundColor: backgroundColor ??
                    Theme.of(context).scaffoldBackgroundColor,
                title: (title != null)
                    ? Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          title,
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: titleColor ??
                                        Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.color,
                                  ),
                        ),
                      )
                    : titleWidget,
                leadingWidth: leadingWidth,
                elevation: elevation,
                centerTitle: centerTitle,
                systemOverlayStyle: systemOverlayStyle,
                leading: autoFocus
                    ? const Icon(
                        Icons.arrow_back_sharp,
                        size: 35,
                        color: Colors.black54,
                      )
                    : leadingWidget ??
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back_sharp,
                            size: 35,
                            color: Colors.black54,
                          ),
                          onPressed: () {
                            AppNavigation.instance.pop(context);
                          },
                        ),
                actions: [
                  if (actions != null) ...actions,
                ],
              ),
            ),
          ),
        );
}
