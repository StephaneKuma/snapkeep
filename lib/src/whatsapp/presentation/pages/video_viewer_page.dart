// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:snapkeep/src/core/constants/colors.dart';
import 'package:snapkeep/src/whatsapp/domain/entities/status.dart';
import 'package:snapkeep/src/whatsapp/presentation/cubit/status_cubit.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

@RoutePage()
class VideoViewerPage extends StatefulWidget {
  const VideoViewerPage({
    super.key,
    required this.status,
  });

  final Status status;

  @override
  State<VideoViewerPage> createState() => _VideoViewerPageState();
}

class _VideoViewerPageState extends State<VideoViewerPage> {
  late ChewieController controller;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: kDarkColor,
          content: Text(
            'Double tap to save or share',
            style: TextStyle(
              color: kWhiteColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    });

    controller = ChewieController(
      videoPlayerController: VideoPlayerController.file(
        File(widget.status.path),
      ),
      autoInitialize: true,
      autoPlay: true,
      looping: true,
      errorBuilder: (context, errorMessage) => Center(
        child: Text(errorMessage),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.pause();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<StatusCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Snap Keep',
          style: TextStyle(
            fontSize: 22.sp,
          ),
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            icon: FaIcon(
              FontAwesomeIcons.ellipsisVertical,
              color: Colors.white,
              size: 25.sp,
            ),
            onSelected: (value) {
              if (value == 'save') {
                cubit.store(status: widget.status);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: kPrimaryColor,
                    content: Text(
                      'Image saved',
                      style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                );
              } else if (value == 'share') {
                cubit.share(status: widget.status);
              }
            },
            itemBuilder: (context) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem(
                  value: 'share',
                  child: ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.shareFromSquare,
                      size: 25.sp,
                    ),
                    title: Text(
                      'Share',
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 'save',
                  child: ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.download,
                      size: 25.sp,
                    ),
                    title: Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
              ];
            },
          )
        ],
      ),
      body: GestureDetector(
        onDoubleTap: () {
          showModalBottomSheet(
            enableDrag: false,
            showDragHandle: true,
            context: context,
            builder: (context) => Container(
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8.h,
                  horizontal: 30.w,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.shareFromSquare,
                        size: 25.sp,
                      ),
                      title: Text(
                        'Share',
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                      onTap: () {
                        cubit.share(status: widget.status);

                        context.router.maybePop();
                      },
                    ),
                    const Divider(),
                    ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.download,
                        size: 25.sp,
                      ),
                      title: Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                      onTap: () {
                        cubit.store(status: widget.status);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: kPrimaryColor,
                            content: Text(
                              'Image saved',
                              style: TextStyle(
                                color: kWhiteColor,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        );

                        context.router.maybePop();
                      },
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          );
        },
        child: Chewie(
          controller: controller,
        ),
      ),
    );
  }
}
