import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../models/MyStaff.dart';
import '../../../../ui.theme/colors_app.dart';

class StaffInfoCards extends StatelessWidget {
  final StaffInfo info;

  const StaffInfoCards({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          child: Padding(
              padding: EdgeInsets.all(8),
              child: SvgPicture.asset(
                "assets/icons/${info.pngSrc!}",
                height: !ResponsiveBreakpoints.of(context).isMobile ? 30 : 20,
                colorFilter: ColorFilter.mode(white, BlendMode.srcIn),
              )),
          backgroundColor: info.color!,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                info.title!,
                maxLines: 2,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: gray3
                )),
              SelectableText(
                "${info.numOfPersons} ",
                style: theme.textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w900,
                    color: text)
              ),
            ],
          ),
        )
      ],
    );
  }
}
