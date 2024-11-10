import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:perfectiontest/models/all_users_model_response_model.dart';
import 'package:url_launcher/url_launcher.dart';

class UserDetailsScreen extends StatelessWidget {
  final Data? user;
  const UserDetailsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${user?.firstName!} ${user?.lastName!}",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Row(
            children: [],
          ),
          Hero(
            tag: user!.avatar!,
            child: CachedNetworkImage(
              imageUrl: user!.avatar!,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            user!.email!,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          Text(
            "${user?.firstName} ${user?.lastName}",
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          FilledButton(
            onPressed: () async => await launchUrl(
              Uri.parse(
                "mailto:${user?.email}",
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Mail Me",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  width: 14,
                ),
                Icon(
                  Icons.email,
                  size: 14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
