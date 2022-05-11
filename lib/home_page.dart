import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_project/colors.dart';
import 'package:e_project/model/product_model.dart';
import 'package:e_project/theme_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // SizedBox(
          //   height: 300,
          //   child: Expanded(
          //     child: Image.network(
          //       'https://th.bing.com/th/id/OIP.LNPKGb2UqqFwXqHnHJd7LQHaKX?pid=ImgDet&rs=1',
          //       fit: BoxFit.fill,
          //     ),
          //   ),
          // ),
          Container(
            height: 250,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://th.bing.com/th/id/OIP.LNPKGb2UqqFwXqHnHJd7LQHaKX?pid=ImgDet&rs=1'),
                fit: BoxFit.fill,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 20,
                  bottom: 30,
                  child: Text(
                    'Street clothes',
                    style: OursProjectTheme.lightTextTheme.headline4!
                        .copyWith(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sale',
                          style: OursProjectTheme.lightTextTheme.headline4,
                        ),
                        Text(
                          'Super summer sale',
                          style: OursProjectTheme.lightTextTheme.caption,
                        ),
                      ],
                    ),
                    Text(
                      'View all',
                      style: OursProjectTheme.lightTextTheme.bodyText2,
                    ),
                  ],
                ),
                SizedBox(
                  height: 300,
                  child: StreamBuilder(
                    stream: getProductData(),
                    builder: (ctx,
                        AsyncSnapshot<List<ProductModel>> streamSnapshot) {
                      if (streamSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (streamSnapshot.hasData == null) {
                        return Text('No data found');
                      } else if (streamSnapshot.hasData) {
                        return ListView.builder(
                          itemCount: streamSnapshot.data?.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 5),
                              height: 270,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 220,
                                    width: double.infinity,
                                    child: Image.network(
                                      streamSnapshot.data?[index].images?[0] ??
                                          'https://th.bing.com/th/id/OIP.AytKVja7ZOR127tyX5JisgHaEp?pid=ImgDet&rs=1',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      customIcon(),
                                      customIcon(),
                                      customIcon(),
                                      customIcon(),
                                      customIcon(),
                                    ],
                                  ),
                                  Text(
                                    'Dorothy Perkins',
                                    style:
                                        OursProjectTheme.lightTextTheme.caption,
                                  ),
                                  Text(
                                    'Evening Dress',
                                    style: OursProjectTheme
                                        .lightTextTheme.subtitle1,
                                  ),
                                  Text(
                                    '15\$',
                                    style: OursProjectTheme
                                        .lightTextTheme.subtitle2!
                                        .copyWith(color: Colors.red),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      }
                      return Center(
                        child: Text('Failed to load data'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget customIcon() {
    return Container(
      padding: const EdgeInsets.only(right: 3),
      child: const Icon(
        Icons.star,
        color: AppColor.starColor,
        size: 20,
      ),
    );
  }

  Stream<List<ProductModel>> getProductData() {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    return firestore.collection('products').snapshots().map((query) {
      return query.docs.map((products) {
        return ProductModel.fromJson(products.data());
      }).toList();
    });
  }
}

// Widget listProducts({itemCount, image, text1, text2, text3}) {
  //   return SizedBox(
  //     height: 300,
  //     child: StreamBuilder(
  //       stream: getProductData(),
  //       builder: (ctx, streamSnapshot) {
  //         return ListView.builder(
  //           itemCount: 10,
  //           shrinkWrap: true,
  //           scrollDirection: Axis.horizontal,
  //           itemBuilder: (context, index) {
  //             return Container(
  //               margin: const EdgeInsets.only(right: 5),
  //               height: 270,
  //               width: MediaQuery.of(context).size.width * 0.4,
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   SizedBox(
  //                     height: 220,
  //                     width: double.infinity,
  //                     child: Image.network(
  //                       'https://th.bing.com/th/id/OIP.LNPKGb2UqqFwXqHnHJd7LQHaKX?pid=ImgDet&rs=1',
  //                       fit: BoxFit.cover,
  //                     ),
  //                   ),
  //                   Row(
  //                     children: [
  //                       customIcon(),
  //                       customIcon(),
  //                       customIcon(),
  //                       customIcon(),
  //                       customIcon(),
  //                     ],
  //                   ),
  //                   Text(
  //                     'Dorothy Perkins',
  //                     style: OursProjectTheme.lightTextTheme.caption,
  //                   ),
  //                   Text(
  //                     'Evening Dress',
  //                     style: OursProjectTheme.lightTextTheme.subtitle1,
  //                   ),
  //                   Text(
  //                     '15\$',
  //                     style: OursProjectTheme.lightTextTheme.subtitle2!
  //                         .copyWith(color: Colors.red),
  //                   )
  //                 ],
  //               ),
  //             );
  //           },
  //         );
  //       },
  //     ),
  //   );
  // }
