import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class fourthscreen extends StatelessWidget {
  fourthscreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              'Hot Updates',
              style: GoogleFonts.nunito(
                  color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
          leading: Center(
            child: Image.asset(
              'images/Left Accessory.png',
              width: 20,
            ),
          ),
          actions: [SizedBox(width: 50)],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * .02,
              ),
              Container(
                child: Image.asset(
                  'images/Frame 32.png',
                  width: width * .9,
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              Text('Monday, 10 May 2021',
                  style: GoogleFonts.nunito(
                    color: Colors.black,
                    fontSize: 16,
                  )),
              Text(
                  'WHO classifies triple-mutant Covid variant from India as global health risk',
                  style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: height * .01,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text:
                        'The World Health Organization said Monday it classified a Covid-19 variant first identified in India last year as a.. ',
                    style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: 15,
                    )),
                TextSpan(
                    text: 'Read More',
                    style: GoogleFonts.nunito(
                      color: Colors.blue,
                      fontSize: 16,
                    )),
              ])),
              SizedBox(
                height: height * .01,
              ),
              Text('Published by Berkeley Lovelace Jr.',
                  style: GoogleFonts.nunito(
                    color: Colors.black,
                    fontSize: 16,
                  )),
              SizedBox(
                height: height * .01,
              ),
              Container(
                child: Image.asset(
                  'images/Frame 33.png',
                  width: width * .9,
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              Text('Sunday, 9 May 2021',
                  style: GoogleFonts.nunito(
                    color: Colors.black,
                    fontSize: 16,
                  )),
              SizedBox(
                height: height * .01,
              ),
              Text(
                  "What to do if you're planning or attending a wedding during the pandemic",
                  style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: height * .01,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text:
 'They had the artsy, rustic venue, the tailored dress and a guest list including about 150 of their closest friends and family. But the pandemic had other plans, forcing Carly Chalmers and Mitchell Gauvin to make a difficult decision about their wedding... ',
                    style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: 14.5,
                    )),
                TextSpan(
                    text: 'Read More',
                    style: GoogleFonts.nunito(
                      color: Colors.blue,
                      fontSize: 14.5,
                    ))
              ])),
              SizedBox(
                height: height * .01,
              ),
              Text("Published by Kristen Rogers",
                  style: GoogleFonts.nunito(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
