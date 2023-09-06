import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/data/cubits/Getnewsmodel/get_news_cubit.dart';
import 'package:newsapp/data/models/getnewsmodel.dart';
import 'package:newsapp/screens/thirdscreen.dart';

// ignore: must_be_immutable
class firstscreen extends StatelessWidget {
  firstscreen({super.key});
  GetNewsModel? ourFirstResponse;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              context.read<GetNewsCubit>().getnews();
            },
            child: Text("Get News"),
          ),
          BlocBuilder<GetNewsCubit, GetNewsState>(builder: (context, state) {
            if (state is GetNewsInitial) {
              return Center(child: Text("Please Press Get News Button"));
            } else if (state is GetNewsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is GetNewsSucces) {
              return Expanded(
                child: Column(
                  children: [
                    _buildSearchBar(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Latest News",
                            style: GoogleFonts.newsCycle(
                              textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "See All",
                                    style: GoogleFonts.newsCycle(
                                      textStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios)
                                ],
                              ))
                        ],
                      ),
                    ),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: ListView.builder(
                            itemCount: state.response?.articles.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return thirdscreen(
                                        publishedAt: state.response
                                                ?.articles[index].publishedAt ??
                                            "No publishedAt",
                                        author: state.response?.articles[index]
                                                .author ??
                                            "No Author",
                                        description: state.response
                                                ?.articles[index].description ??
                                            "No description",
                                        content: state
                                            .response!.articles[index].content,
                                        imagrUrl: state.response
                                                ?.articles[index].urlToImage ??
                                            "https://i2-prod.mirror.co.uk/incoming/article29909337.ece/ALTERNATES/s1200d/0_Real-Madrid-v-Liverpool-UEFA-Champions-League-Final.jpg");
                                  }));
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.95,
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(28)),
                                    image: DecorationImage(
                                      fit: BoxFit.fitWidth,
                                      image: NetworkImage(state.response
                                              ?.articles[index].urlToImage ??
                                          "https://static.vecteezy.com/system/resources/thumbnails/006/299/370/original/world-breaking-news-digital-earth-hud-rotating-globe-rotating-free-video.jpg"),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 35.0,
                                    ),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 50,
                                          ),
                                          Text(
                                            state.response?.articles[index]
                                                    .author ??
                                                "",
                                            style: GoogleFonts.nunito(
                                              textStyle: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 7,
                                          ),
                                          Text(
                                            state.response?.articles[index]
                                                    .content ??
                                                "",
                                            style: GoogleFonts.nunito(
                                              textStyle: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Text(
                                            state.response?.articles[index]
                                                    .description ??
                                                "",
                                            style: GoogleFonts.nunito(
                                              textStyle: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ]),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),

                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 20),
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         width: MediaQuery.sizeOf(context).width * 0.15,
                    //         height: MediaQuery.sizeOf(context).height * 0.02,
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(20),
                    //           color: Colors.red,
                    //         ),
                    //         child: Center(
                    //           child: Text(
                    //             "Healthy",
                    //             style: TextStyle(color: Colors.white),
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         width: 10,
                    //       ),
                    //       Container(
                    //         width: MediaQuery.sizeOf(context).width * 0.15,
                    //         height: MediaQuery.sizeOf(context).height * 0.02,
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(20),
                    //           color: Colors.white,
                    //         ),
                    //         child: Text(
                    //           "Technology",
                    //           style: TextStyle(color: Colors.black),
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         width: 10,
                    //       ),
                    //       Container(
                    //         width: MediaQuery.sizeOf(context).width * 0.15,
                    //         height: MediaQuery.sizeOf(context).height * 0.02,
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(20),
                    //           color: Colors.white,
                    //         ),
                    //         child: Text(
                    //           "Technology",
                    //           style: TextStyle(color: Colors.black),
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         width: 10,
                    //       ),
                    //       Container(
                    //         width: MediaQuery.sizeOf(context).width * 0.15,
                    //         height: MediaQuery.sizeOf(context).height * 0.02,
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(20),
                    //           color: Colors.white,
                    //         ),
                    //         child: Text(
                    //           "Arts",
                    //           style: TextStyle(color: Colors.black),
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         width: 10,
                    //       ),
                    //       Container(
                    //         width: MediaQuery.sizeOf(context).width * 0.15,
                    //         height: MediaQuery.sizeOf(context).height * 0.02,
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(20),
                    //           color: Colors.white,
                    //         ),
                    //         child: Text(
                    //           "Sports",
                    //           style: TextStyle(color: Colors.black),
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width * 0.95,
                    //   height: MediaQuery.of(context).size.height * 0.2,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(20),
                    //     color: Colors.white,
                    //     image: DecorationImage(
                    //       image: AssetImage("images/img1.jpg"),
                    //       fit: BoxFit.fill,
                    //     ),
                    //   ),
                    //   child: SingleChildScrollView(
                    //     scrollDirection: Axis.vertical,
                    //     child: Column(
                    //       children: [
                    //         Padding(
                    //           padding: const EdgeInsets.symmetric(
                    //               horizontal: 10, vertical: 10),
                    //           child: Text(
                    //               "5 things to know about the 'conundrum' of lupus",
                    //               style: TextStyle(
                    //                 fontSize: 17,
                    //                 color: Colors.white,
                    //                 fontWeight: FontWeight.bold,
                    //               )),
                    //         ),
                    //         SizedBox(
                    //           height: MediaQuery.of(context).size.height * 0.09,
                    //         ),
                    //         Padding(
                    //           padding: const EdgeInsets.symmetric(horizontal: 10),
                    //           child: Row(
                    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //             children: [
                    //               Text("Matt Villano",
                    //                   style: TextStyle(
                    //                     color: Colors.white,
                    //                     fontSize: 15,
                    //                     fontWeight: FontWeight.bold,
                    //                   )),
                    //               Text("Sunday, 9 May 2021",
                    //                   style: TextStyle(
                    //                     color: Colors.white,
                    //                     fontSize: 15,
                    //                     fontWeight: FontWeight.bold,
                    //                   ))
                    //             ],
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width * 0.95,
                    //   height: MediaQuery.of(context).size.height * 0.2,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(20),
                    //     color: Colors.white,
                    //     image: DecorationImage(
                    //       image: AssetImage("images/img2.jpg"),
                    //       fit: BoxFit.fill,
                    //     ),
                    //   ),
                    //   child: SingleChildScrollView(
                    //     scrollDirection: Axis.vertical,
                    //     child: Column(
                    //       children: [
                    //         Padding(
                    //           padding: const EdgeInsets.symmetric(
                    //               horizontal: 10, vertical: 10),
                    //           child:
                    //               Text("4 ways families can ease anxiety together",
                    //                   style: TextStyle(
                    //                     fontSize: 18,
                    //                     color: Colors.white,
                    //                     fontWeight: FontWeight.bold,
                    //                   )),
                    //         ),
                    //         SizedBox(
                    //           height: MediaQuery.of(context).size.height * 0.1,
                    //         ),
                    //         Padding(
                    //           padding: const EdgeInsets.symmetric(horizontal: 10),
                    //           child: Row(
                    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //             children: [
                    //               Text("Zain Korsgaard",
                    //                   style: TextStyle(
                    //                     color: Colors.white,
                    //                     fontSize: 15,
                    //                     fontWeight: FontWeight.bold,
                    //                   )),
                    //               Text("Sunday, 9 May 2021",
                    //                   style: TextStyle(
                    //                     color: Colors.white,
                    //                     fontSize: 15,
                    //                     fontWeight: FontWeight.bold,
                    //                   ))
                    //             ],
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              );
            } else {
              return Center(child: Text("something went wrong"));
            }
          }),
        ],
      ),
    ));
  }
}

Widget _buildSearchBar() {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: SearchBar(
              trailing: [
                Icon(Icons.search),
              ],
              hintText: 'Search...',
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {},
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Container(
          width: 40,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: [Color(0xffFF3A44), Color(0xffFF80865)])),
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(
              'images/Group38.png',
              width: 50,
            ),
          ),
        ),
      ],
    ),
  );
}
