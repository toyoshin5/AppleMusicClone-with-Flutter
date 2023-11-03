import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'AppleMusic Clone',
      home: MyHomePage(title: 'Flutter'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white.withOpacity(0.85),
        middle: Text(title),
      ),
      child: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            TitleArea(),
            ButtonArea(),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Divider(color: CupertinoColors.systemGrey4, height: 1),
            ),
            //リスト
            SongsArea(),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class TitleArea extends StatelessWidget {
  const TitleArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CupertinoColors.systemGrey6,
              boxShadow: const [
                BoxShadow(
                  color: Color(0x77909090),
                  offset: Offset(0, 8),
                  spreadRadius: 0,
                  blurRadius: 20,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/ordinary_songs.jpg",
                height: 250,
                width: 250,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "List of Songs - EP",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            "Toyoda Shingo",
            style: TextStyle(fontSize: 20, color: AppColors.primary),
          ),
          const SizedBox(height: 2),
          const Text(
            "Electronic・2023年・ロスレス",
            style: TextStyle(
                fontSize: 12,
                color: AppColors.gray,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class ButtonArea extends StatelessWidget {
  const ButtonArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Flexible(
            child: AppButton(
              onPressed: () {},
              text: "再生",
              icon: CupertinoIcons.play_arrow_solid,
            ),
          ),
          const SizedBox(width: 20),
          Flexible(
            child: AppButton(
              onPressed: () {},
              text: "シャッフル",
              icon: CupertinoIcons.shuffle,
            ),
          ),
        ],
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
  });

  final VoidCallback onPressed;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: CupertinoButton(
        onPressed: onPressed,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: AppColors.buttonBackground,
        borderRadius: BorderRadius.circular(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppColors.primary,
              size: 22,
            ),
            const SizedBox(width: 6),
            Text(
              text,
              style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class SongsArea extends StatelessWidget {
  const SongsArea({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> songs = [
      "Good Day",
      "Bouquet",
      "Aloha",
      "Sunrise Serenade",
      "Moonlit Melody",
      "Ocean Breeze",
      "Eternal Echoes",
      "Whispering Wind",
      "Mystic Mirage",
      "Golden Horizon",
      "Enchanted Evening",
      "Starlight Serenade",
      "Lullaby of the Stars",
      "Celestial Harmony",
      "Serenity's Embrace",
      "Dancing Fireflies",
      "Melody of the Mountains",
      "Hidden Oasis",
      "Radiant Reverie",
      "Midnight Mirage",
      "Journey to Infinity",
      "Crystal Cascade",
      "Soothing Symphony",
      "Echoes of Eternity",
      "Harmony Haven",
      "Serendipity Sonata",
      "Velvet Twilight",
      "Tranquil Tides",
      "Whimsical Waltz",
      "Chasing Dreams"
    ];
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: songs.length,
      separatorBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(left: 60),
          child: Divider(color: CupertinoColors.systemGrey4, height: 1),
        );
      },
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: CupertinoListTile(
            onTap: () {},
            leading: Text(
              "${index + 1}",
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.gray,
              ),
            ),
            title: Text(
              songs[index],
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            trailing: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                CupertinoIcons.ellipsis,
                color: CupertinoColors.label,
                size: 20,
              ),
            ),
          ),
        );
      },
    );
  }
}

class AppColors {
  static const Color primary = Color(0xFFE63D44);
  static const Color gray = Color(0xFF999999);
  static const Color buttonBackground = Color(0xFFEEEDEF);
}
