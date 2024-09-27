// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:snapkeep/src/core/constants/colors.dart';
import 'package:snapkeep/src/whatsapp/domain/entities/status.dart';
import 'package:snapkeep/src/whatsapp/presentation/cubit/status_cubit.dart';

@RoutePage()
class ImageViewerPage extends StatefulWidget {
  const ImageViewerPage({
    super.key,
    required this.status,
  });

  final Status status;

  @override
  State<ImageViewerPage> createState() => _ImageViewerPageState();
}

class _ImageViewerPageState extends State<ImageViewerPage> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<StatusCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Snap Keep'),
        actions: <Widget>[
          PopupMenuButton<String>(
            icon: const FaIcon(
              FontAwesomeIcons.ellipsisVertical,
              color: Colors.white,
            ),
            onSelected: (value) {
              if (value == 'save') {
                cubit.store(status: widget.status);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: kPrimaryColor,
                    content: Text(
                      'Image saved',
                      style: TextStyle(
                        color: kWhiteColor,
                      ),
                    ),
                  ),
                );
              } else if (value == 'share') {
                cubit.share(status: widget.status);
              }
            },
            itemBuilder: (context) {
              return const <PopupMenuEntry<String>>[
                PopupMenuItem(
                  value: 'share',
                  child: ListTile(
                    leading: FaIcon(FontAwesomeIcons.shareFromSquare),
                    title: Text('Share'),
                  ),
                ),
                PopupMenuItem(
                  value: 'save',
                  child: ListTile(
                    leading: FaIcon(FontAwesomeIcons.download),
                    title: Text('Save'),
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
              decoration: const BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 30,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: const FaIcon(FontAwesomeIcons.shareFromSquare),
                      title: const Text('Share'),
                      onTap: () {
                        cubit.share(status: widget.status);

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Sharing...'),
                          ),
                        );

                        context.router.maybePop();
                      },
                    ),
                    const Divider(),
                    ListTile(
                      leading: const FaIcon(FontAwesomeIcons.download),
                      title: const Text('Save'),
                      onTap: () {
                        cubit.store(status: widget.status);

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: kPrimaryColor,
                            content: Text(
                              'Image saved',
                              style: TextStyle(
                                color: kWhiteColor,
                              ),
                            ),
                          ),
                        );

                        context.router.maybePop();
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        },
        child: InteractiveViewer(
          child: Center(
            child: Image.file(
              File(widget.status.path),
            ),
          ),
        ),
      ),
    );
  }
}
