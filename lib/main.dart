import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'utils/routes.dart';
import 'screens/start_select_screen.dart';
import 'screens/home_screen.dart';
import 'screens/kakao_signin_screen.dart';
import 'screens/gallery_screen.dart';
import 'screens/add_photo_screen.dart';
import 'screens/conversation_screen.dart'; // ✅ 새로 만든 대화 스크린 import
import 'screens/intro_screen.dart'; // ✅ 새로 만든 인트로 스크린 import
import 'screens/photo_detail_screen.dart';
import 'screens/report_list_screen.dart';
import 'screens/2-3-3.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env"); //.env 로드
  runApp(const MyCustomApp());
}

class MyCustomApp extends StatelessWidget {
  const MyCustomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memento Box',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal, fontFamily: 'Pretendard'),
      initialRoute: Routes.home, // ✅ 앱 실행 시 IntroScreen이 처음 뜨도록
      routes: {
        Routes.home: (context) => const HomeUpdateScreen(),
        Routes.startSelect: (context) => const StartSelectScreen(),
        // Routes.signUp: (context) => const KakaoSigninScreen(userType: ???),
        Routes.gallery: (context) => const GalleryScreen(),
        Routes.addPhoto: (context) => const AddPhotoScreen(),
        Routes.conversation: (context) =>
            const PhotoConversationScreen(), // ✅ 0530 고권아 추가
        // Routes.intro: (context) => const IntroScreen(), // ✅ 0530 고권아 추가
        Routes.report: (context) => const ReportListScreen(),
        Routes.photoDetail: (context) => const PhotoDetailScreen(),
        // Routes.listenRec: (context) => const ConversationPlaybackScreen(),
        '/pictureGuardianListen': (context) => const PictureGuardianLlmScreen(),
      },
    );
  }
}
