// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:snapkeep/src/core/constants/colors.dart';
import 'package:snapkeep/src/whatsapp/domain/entities/status.dart';
import 'package:snapkeep/src/whatsapp/presentation/cubit/status_cubit.dart';

class StatusAction extends StatelessWidget {
  const StatusAction({
    super.key,
    required this.status,
  });

  final Status status;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<StatusCubit>();

    return Stack(
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
    );
  }
}
