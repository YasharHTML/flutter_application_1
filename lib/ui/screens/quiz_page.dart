import 'package:flutter/material.dart';
import 'package:myapp/constants/data_consts.dart';
import 'package:myapp/services/quiz_service.dart';
import 'package:myapp/ui/widgets/question_tab.dart';
import 'package:myapp/services/explore_service.dart';
import 'package:myapp/models/reponses/monument_response.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizService quizService = QuizService();

  MonumentResponsePost monumentResponsePost = MonumentResponsePost(monuments: []);

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  Future<void> fetchData() async {
    monumentResponsePost = await quizService.getMonumentsPost(1);
    setState(() {});
    debugPrint(monumentResponsePost.toString() + "11111");
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(DataConsts.quizTitle),
        ),
        body: Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Center(
              child: ListView.builder(
                itemCount: monumentResponsePost.monuments.length,
                itemBuilder: (BuildContext context, int index) {
                  return QuestionTab(data: monumentResponsePost.monuments[index]);
                },
              ),
            )));
  }
}
