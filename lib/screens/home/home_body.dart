import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lf_test/modal/lost_found.dart';
import 'package:provider/provider.dart';
class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    // scroll controller event
    // scrollController.addListener(scrollListener);
    super.initState();
  }
  void scrollListener(){
    if(scrollController.offset > scrollController.position.maxScrollExtent/2){
    }
  }
  @override
  Widget build(BuildContext context) {
    final lfDB = Provider.of<List<LostFound>>(context);
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            GridView(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: MediaQuery.of(context).size.width),
            scrollDirection: Axis.horizontal,
            ),
            Row(),
            // get users data from firestore and infinite scroll
            ListView(
              controller: scrollController,
              shrinkWrap: true,
              children: [
                ...lfDB.map((data){
                  return ListTile(
                    title: Text("hello"),
                  );
                }).toList()
              ],
            )
          ],
        ),
      ),
    );
  }
}

