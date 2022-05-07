import 'package:flutter/material.dart';
import 'package:myapp/ui/screens/quiz_page.dart';
import 'package:myapp/ui/widgets/label_box.dart';

class LabeledCard extends StatelessWidget {
  final String labelMain;
  final String? labelSecondary;
  final String imageUrl;
  late String description;
  double? height;
  double? width;
  final double borderRadius;

  LabeledCard(
      {Key? key,
      required this.labelMain,
      this.labelSecondary,
      required this.imageUrl,
      this.height,
      required this.description,
      this.width,
      this.borderRadius = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        children: [
          Container(
            height: height ?? MediaQuery.of(context).size.height * .25,
            width: width ?? MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                new InkWell(
                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => QuizPage()),);},
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: LabelBox(text: labelMain),
                ),
                labelSecondary != null
                    ? Positioned(
                        bottom: 10,
                        right: 10,
                        child: LabelBox(
                          text: labelSecondary!,
                          fontSize: 14,
                        ),
                      )
                    : Container(),
                    
              ],
            ),
          ),Container(width: width ?? MediaQuery.of(context).size.width, child: Text(description, textAlign: TextAlign.center,),)
        ],
      ),
    );
  }
}
