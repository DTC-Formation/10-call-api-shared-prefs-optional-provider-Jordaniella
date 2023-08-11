import 'package:puppies/controller/puppies_controller.dart';
import 'package:puppies/pages/one_puppies.dart';
import 'package:puppies/providers/dark_mode.dart';
import 'package:puppies/views/puppies_button.dart';
import 'package:puppies/models/puppies.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class PuppiesPage extends StatelessWidget {
  const PuppiesPage({super.key});
  List<FutureBuilder<Puppies>> buildDataWidget(context, snapshot) {
    List<FutureBuilder<Puppies>> res = [];

    for (var element in snapshot) {
      res.add(FutureBuilder<Puppies>(
          future: PuppiesController().getOnePuppies(element.id),
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
              return const Center(
                child: Text("Une erreur s'est produite lors du chargement"),
              );
            } else {
              if (result.hasData) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                OnePuppies(id: result.data?.id)));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.only(top: 30, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: context.watch<DarkProvider>().grey,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                result.data?.breeds?[0].name ?? "Name Pets",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: context
                                        .watch<DarkProvider>()
                                        .textColor),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0),
                                child: Text(
                                  result.data?.breeds?[0].temperament ??
                                      "Temperament Pets",
                                  style: TextStyle(
                                      color: context
                                          .watch<DarkProvider>()
                                          .textColor),
                                ),
                              ),
                              Text(
                                result.data?.breeds?[0].origin ?? "Origin Pets",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: context
                                        .watch<DarkProvider>()
                                        .textColor),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 130,
                          height: 130,
                          child: Image.network(
                            result.data?.url ??
                                "https://cdn2.thecatapi.com/images/IFXsxmXLm.jpg",
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              } else if (result.hasError) {
                return Text(
                  "erreur de chargement",
                  style:
                      TextStyle(color: context.watch<DarkProvider>().textColor),
                );
                // return Text("Erreur");
              } else {
                throw Exception("Nothing to display");
              }
            }
          }));
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    Future<List<Puppies>>? allPuppies = PuppiesController().getAllPuppies();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: context.watch<DarkProvider>().bgColor,
          elevation: 0,
          foregroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            color: context.watch<DarkProvider>().bgColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Search for a Pet",
                      style: TextStyle(
                          color: context.watch<DarkProvider>().textColor,
                          fontSize: 20),
                    ),
                    IconButton(
                        onPressed: () {
                          context.read<DarkProvider>().setMode();
                        },
                        icon: Icon(context.watch<DarkProvider>().isDark
                            ? Icons.sunny
                            : Icons.night_shelter))
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 30),
                  padding: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: context.watch<DarkProvider>().grey,
                      borderRadius: BorderRadius.circular(30)),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: const Icon(Icons.search),
                        hintText: 'Search',
                        hintStyle: TextStyle(
                            color: context.watch<DarkProvider>().textColor)),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ButtonPuppies(
                            icone: Icons.pets_outlined,
                            content: "Cat",
                            isSimple: false,
                            size: 80,
                            bgColor: Color.fromRGBO(255, 184, 80, 1),
                            urlPage: "/cats"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ButtonPuppies(
                            icone: Icons.picture_in_picture,
                            content: "Dog",
                            isSimple: false,
                            size: 80,
                            bgColor: context.watch<DarkProvider>().grey,
                            urlPage: "/dogs"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ButtonPuppies(
                            icone: Icons.biotech,
                            content: "Bird",
                            isSimple: false,
                            size: 80,
                            bgColor: context.watch<DarkProvider>().grey,
                            urlPage: "/birds"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ButtonPuppies(
                            icone: Icons.grid_3x3,
                            content: "Other",
                            isSimple: false,
                            size: 80,
                            bgColor: context.watch<DarkProvider>().grey,
                            urlPage: "/other"),
                      ),
                    ],
                  ),
                ),
                FutureBuilder<List<Puppies>?>(
                    future: allPuppies,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.connectionState ==
                          ConnectionState.none) {
                        return Container();
                      } else {
                        if (snapshot.hasData) {
                          return Column(
                            children: buildDataWidget(context, snapshot.data),
                          );
                        } else if (snapshot.hasError) {
                          return Text("{$snapshot.error}");
                          // return Text("Erreur");
                        } else {
                          return Container();
                        }
                      }
                    })
              ],
            ),
          ),
        ));
  }
}
