import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:snapkeep/src/core/router/index.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              'Snap Keep',
              style: TextStyle(fontSize: 16.sp),
            ),
            accountEmail: Text(
              'support@snapkeep.com',
              style: TextStyle(fontSize: 12.sp),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: FlutterLogo(
                size: 60.sp,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.whatsapp,
              size: 25.sp,
            ),
            title: Text(
              'WhatsApp',
              style: TextStyle(fontSize: 16.sp),
            ),
            onTap: () {
              context.router.push(const StatusRoute());
            },
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.whatsapp,
              size: 25.sp,
            ),
            title: Text(
              'WhatsApp Business',
              style: TextStyle(fontSize: 16.sp),
            ),
            onTap: () {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.lightBlue,
                  content: Text(
                    'Coming soon...!',
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              );
              context.router.maybePop();
            },
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.facebook,
              size: 25.sp,
            ),
            title: Text(
              'Facebook',
              style: TextStyle(fontSize: 16.sp),
            ),
            onTap: () {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.lightBlue,
                  content: Text(
                    'Coming soon...!',
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              );
              context.router.maybePop();
            },
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.instagram,
              size: 25.sp,
            ),
            title: Text(
              'Instagram',
              style: TextStyle(fontSize: 16.sp),
            ),
            onTap: () {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.lightBlue,
                  content: Text(
                    'Coming soon...!',
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              );
              context.router.maybePop();
            },
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.tiktok,
              size: 25.sp,
            ),
            title: Text(
              'TikTok',
              style: TextStyle(fontSize: 16.sp),
            ),
            onTap: () {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.lightBlue,
                  content: Text(
                    'Coming soon...!',
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              );
              context.router.maybePop();
            },
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.wrench,
              size: 25.sp,
            ),
            title: Text(
              'Settings',
              style: TextStyle(fontSize: 16.sp),
            ),
            onTap: () {
              context.router.push(const SettingRoute());
            },
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.info,
              size: 25.sp,
            ),
            title: Text(
              'About Us',
              style: TextStyle(fontSize: 16.sp),
            ),
            onTap: () {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.lightBlue,
                  content: Text(
                    'Coming soon...!',
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              );
              context.router.maybePop();
            },
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.message,
              size: 25.sp,
            ),
            title: Text(
              'Suggestions',
              style: TextStyle(fontSize: 16.sp),
            ),
            onTap: () {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.lightBlue,
                  content: Text(
                    'Coming soon...!',
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              );
              context.router.maybePop();
            },
          ),
        ],
      ),
    );
  }
}
