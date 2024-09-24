import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snapkeep/src/core/constants/colors.dart';
import 'package:snapkeep/src/core/router/index.dart';
import 'package:snapkeep/src/whatsapp/domain/entities/status.dart';
import 'package:snapkeep/src/whatsapp/presentation/cubit/status_cubit.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({
    super.key,
    required this.status,
  });

  final Status status;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<StatusCubit>();

    return GestureDetector(
      onTap: () {
        context.router.push(
          ImageViewerRoute(status: status),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
          image: DecorationImage(
            image: FileImage(
              File(status.path),
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        cubit.store(status: status);

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
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.download,
                        color: kWhiteColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        cubit.share(status: status);
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.shareFromSquare,
                        color: kWhiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
