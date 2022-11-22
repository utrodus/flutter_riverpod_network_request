import 'package:flutter/material.dart';
import 'package:riverpod_cache_network/models/user_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.firstName),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  maxRadius: 60,
                  backgroundImage: NetworkImage(
                    user.avatar,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "${user.firstName} ${user.lastName}",
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                user.email,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
