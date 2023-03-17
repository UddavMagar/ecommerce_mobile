import 'package:ecommerce_mobileapp/models/gallery.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:like_button/like_button.dart';
import '../models/product.dart';
import '../network/end_points.dart';
import '../network/gallery_network.dart';
import '../network/network_handler.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  static final String id = "MainPage";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Product> productRequest = [];
  List<Gallery> galleryRequest = [];

  @override
  void initState() {
    serverRequest();
    super.initState();
  }

  Future<List<Product>> serverRequest() async {
    NetworkHandler networkHandler = NetworkHandler();
    productRequest = await networkHandler.requestToServer(PRODUCT_ENDPOINT);
    return productRequest;
  }

  Future<List<Gallery>> galleryserverRequest(String id) async {
    GalleryNetworkHandler networkHandler = GalleryNetworkHandler();
    galleryRequest =
        await networkHandler.requestToServer(GALLERY_ENDPOINT + id);
    return galleryRequest;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ecommerce App')),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: serverRequest(),
              builder: (context, AsyncSnapshot<List<Product>> snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (BuildContext context, int position) {
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFC8CBCC),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Center(
                                    child: FutureBuilder(
                                      future: galleryserverRequest(
                                          snapshot.data![position].id.toString()),
                                      builder: (context,
                                          AsyncSnapshot<List<Gallery>> image) {
                                        if (image.hasData) {
                                          return Image(
                                            height: 100.0,
                                            image: NetworkImage(
                                                image.data![0].image.toString()),
                                            fit: BoxFit.cover,
                                          );
                                        } else {
                                          return Text("No image");
                                        }
                                      },
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: LikeButton(
                                      size: 20,
                                      ))
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  snapshot.data![position].name.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      "\$ " + snapshot.data![position].price.toString(),
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.deepOrangeAccent),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('There was an error, Please try again'),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
