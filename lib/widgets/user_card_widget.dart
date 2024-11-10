import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:perfectiontest/models/all_users_model_response_model.dart';
import 'package:perfectiontest/screens/user_details_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:url_launcher/url_launcher.dart';

class UserCardWidget extends StatelessWidget {
  final Data? user;
  const UserCardWidget({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserDetailsScreen(
                user: user,
              ),
            ),
          );
        },
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: user!.avatar!,
                child: CachedNetworkImage(
                  imageUrl: user!.avatar!,
                  placeholder: (context, url) => Skeleton.keep(
                      child: Container(
                    width: 100,
                    height: 100,
                  )),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () async => await launchUrl(
                        Uri.parse(
                          "mailto:${user!.email}",
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.email,
                            size: 14,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            user!.email!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: null,
                      child: Text(
                        "${user?.firstName!} ${user?.lastName!}",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
