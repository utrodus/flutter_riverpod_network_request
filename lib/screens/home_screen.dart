import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_cache_network/dataprovider/data_provider.dart';

import '../models/user_model.dart';
import 'detail_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(userDataProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Riverpod Get'),
          actions: [
            IconButton(
                onPressed: () {
                  ref.invalidate(userDataProvider);
                },
                icon: const Icon(Icons.refresh))
          ],
        ),
        body: data.when(
          data: (data) {
            List<UserModel> userList = data.map((e) => e).toList();
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => DetailScreen(
                                user: userList[index],
                              ),
                            ),
                          );
                        },
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(userList[index].avatar),
                        ),
                        title: Text(userList[index].firstName),
                        subtitle: Text(userList[index].lastName),
                      );
                    },
                  ),
                ),
              ],
            );
          },
          error: (error, stackTrace) {
            return Center(
              child: ElevatedButton(
                child: const Text('Retry Load Data'),
                onPressed: () {
                  ref.invalidate(userDataProvider);
                },
              ),
            );
          },
          // error: (err, s) => Text(err.toString()),
          loading: () => const CircularProgressIndicator(),
        ));
  }
}
