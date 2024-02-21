import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                width: 4, color: Theme.of(context).scaffoldBackgroundColor),
            boxShadow: [
              BoxShadow(
                spreadRadius: 2,
                blurRadius: 10,
                color: Colors.black.withOpacity(0.1),
              ),
            ],
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/profile.jpg'),
            ),
          ),
        ),
        // Positioned(
        //   bottom: 0,
        //   right: 0,
        //   child: Container(
        //     height: 40,
        //     width: 40,
        //     decoration: BoxDecoration(
        //       shape: BoxShape.circle,
        //       border: Border.all(
        //         width: 4,
        //         color: Theme.of(context).scaffoldBackgroundColor,
        //       ),
        //       color: Colors.deepPurple,
        //     ),
        //   ),
        // ),
        // Positioned(
        //   bottom: -3.5,
        //   right: -4.5,
        //   child: IconButton(
        //     onPressed: () {},
        //     icon: const Icon(
        //       Icons.edit,
        //       color: Colors.white,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
