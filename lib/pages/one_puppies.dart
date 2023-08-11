import 'package:flutter/material.dart';
import 'package:puppies/controller/puppies_controller.dart';

class OnePuppies extends StatelessWidget {
  final String? id;
  const OnePuppies({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    Padding description(String title, String content) {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromRGBO(236, 236, 236, 1)),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                title,
                style: const TextStyle(color: Color.fromRGBO(247, 93, 94, 1)),
              ),
              Text(
                content,
              )
            ],
          )),
        ),
      );
    }

    Widget displayContent(context, snapshot) {
      return Stack(
        // alignment: Alignment.bottomCenter,
        children: [
          Image.network(snapshot.url),
          Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(top: 400),
              height: 400,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        snapshot.breeds[0].name,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.energy_savings_leaf,
                              color: Color.fromRGBO(247, 93, 94, 1),
                            ),
                          ),
                          Text(
                            snapshot.breeds[0].energyLevel.toString(),
                            style: const TextStyle(
                                color: Color.fromRGBO(247, 93, 94, 1),
                                fontSize: 20),
                          )
                        ],
                      ),
                    ],
                  ),
                  Text(
                    snapshot.breeds[0].temperament,
                  ),
                  Row(
                    children: [
                      description(
                          "Age", snapshot.breeds[0].childFriendly.toString()),
                      description(
                          "Length", snapshot.breeds[0].lifeSpan.toString()),
                      description(
                          "Rare", snapshot.breeds[0].rare == 0 ? "No" : "Yes")
                    ],
                  ),
                  Text(
                    snapshot.breeds[0].description,
                  )
                ],
              ))
        ],
      );
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          foregroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: FutureBuilder(
              future: PuppiesController().getOnePuppies(id ?? "IFXsxmXLm"),
              builder: (context, result) {
                if (result.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (result.connectionState == ConnectionState.none) {
                  return Container();
                } else {
                  if (result.hasData) {
                    return displayContent(context, result.data);
                  } else if (result.hasError) {
                    return Text('${result.error}');
                  } else {
                    throw Exception("Impossible de charger les données");
                  }
                }
              }),
        ));
  }
}
