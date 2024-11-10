import 'package:flutter/material.dart';
import 'package:perfectiontest/providers/all_users_provider.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/user_card_widget.dart';

class AllUsersScreen extends StatelessWidget {
  static const id = "all-users-screen";
  const AllUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => AllUsersProvider(),
        builder: (context, a) {
          return Consumer<AllUsersProvider>(builder: (ctx, provider, s) {
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  "All Users Screen",
                ),
              ),
              bottomNavigationBar: Skeletonizer(
                enabled: provider.currentData == null,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: OverflowBar(
                    children: [
                      Text(
                        provider.currentData?.support?.text ?? "",
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      FilledButton(
                        onPressed: () async => await launchUrl(
                          Uri.parse(
                            provider.currentData!.support!.url!,
                          ),
                        ),
                        child: const Text(
                          "Contact Support",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: Skeletonizer(
                enabled: provider.currentData == null,
                child: ListView.builder(
                  itemCount: provider.demo.data?.length ?? 0,
                  itemBuilder: (ctx, i) {
                    if (i + 1 == provider.demo.data!.length) {
                      provider.loadMore();
                    }
                    return UserCardWidget(
                      user: provider.demo.data![i],
                    );
                  },
                ),
              ),
            );
          });
        });
  }
}
