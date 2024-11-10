import 'package:flutter/material.dart';
import 'package:perfectiontest/screens/all_users_screen.dart';

const initalRoute = AllUsersScreen.id;
final appRoutes = {
  AllUsersScreen.id: (BuildContext ctx) => const AllUsersScreen(),
};
