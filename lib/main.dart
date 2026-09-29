import 'dart:async';

import 'package:flutter/material.dart';

const ink = Color(0xFF102A43);
const paper = Color(0xFFF7F3EC);
const coral = Color(0xFFE86A5B);
const mustard = Color(0xFFE6B84D);
const mint = Color(0xFFD9F0E7);
const lavender = Color(0xFFE9E2F6);

void main() => runApp(const CivicGamesApp());

class GameInfo {
  const GameInfo(this.title, this.kicker, this.description, this.icon, this.color, this.tag);
  final String title;
  final String kicker;
  final String description;
  final IconData icon;
  final Color color;
  final String tag;
}

const games = [
  GameInfo('Budget Battle', 'GOVERNANCE', 'Balance public needs, approval, and the deals nobody should see.', Icons.account_balance, mint, 'Featured'),
  GameInfo('The Civic Feed', 'MEDIA LITERACY', 'Tune an algorithm for information without turning up the heat.', Icons.dynamic_feed, lavender, 'Popular'),
  GameInfo('The Assignment Desk', 'NEWSROOM', 'Curate the 9 PM broadcast before the clock runs out.', Icons.newspaper, Color(0xFFF9E2C3), 'Fast'),
  GameInfo('Coalition Builder', 'POLITICS', 'Trade policy, promises, and principles to build a government.', Icons.hub, Color(0xFFF3D9D5), 'Strategy'),
  GameInfo('The Whisper Campaign', 'ELECTIONS', 'Spot the signal in a noisy stream of campaign rumors.', Icons.record_voice_over, Color(0xFFDDE7F3), 'Sharp'),
  GameInfo('WhatsApp University', 'FACT CHECK', 'Forward, pause, or verify: not every family group message is true.', Icons.chat_bubble, Color(0xFFDDF0D6), 'New'),
];

class CivicGamesApp extends StatelessWidget {
  const CivicGamesApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Civic Games Arcade',
        theme: ThemeData(useMaterial3: true, scaffoldBackgroundColor: paper, colorScheme: ColorScheme.fromSeed(seedColor: ink), fontFamily: 'Georgia', textTheme: const TextTheme(bodyMedium: TextStyle(fontFamily: 'Arial'))),
        home: const ArcadeShell(),
      );
}

class MyApp extends CivicGamesApp {
  const MyApp({super.key});
}

class ArcadeShell extends StatefulWidget {
  const ArcadeShell({super.key});
  @override
  State<ArcadeShell> createState() => _ArcadeShellState();
}

class _ArcadeShellState extends State<ArcadeShell> {
  int tab = 0;
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(child: tab == 0 ? const HomePage() : const LibraryPage()),
        bottomNavigationBar: NavigationBar(backgroundColor: paper, indicatorColor: mustard.withValues(alpha: .35), selectedIndex: tab, onDestinationSelected: (value) => setState(() => tab = value), destinations: const [NavigationDestination(icon: Icon(Icons.explore_outlined), selectedIcon: Icon(Icons.explore), label: 'Discover'), NavigationDestination(icon: Icon(Icons.grid_view_outlined), selectedIcon: Icon(Icons.grid_view), label: 'Library')]),
      );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) => CustomScrollView(slivers: [
        SliverPadding(padding: const EdgeInsets.fromLTRB(22, 22, 22, 0), sliver: SliverToBoxAdapter(child: _TopBar())),
        SliverPadding(padding: const EdgeInsets.fromLTRB(22, 28, 22, 18), sliver: SliverToBoxAdapter(child: _HeroCard())),
        SliverPadding(padding: const EdgeInsets.fromLTRB(22, 0, 22, 16), sliver: SliverToBoxAdapter(child: _SectionTitle(title: 'Pick your perspective', action: 'View all'))),
        SliverPadding(padding: const EdgeInsets.symmetric(horizontal: 22), sliver: SliverGrid.builder(gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 360, mainAxisExtent: 205, crossAxisSpacing: 14, mainAxisSpacing: 14), itemCount: games.length, itemBuilder: (_, index) => GameCard(game: games[index]))),
        SliverPadding(padding: const EdgeInsets.fromLTRB(22, 30, 22, 14), sliver: SliverToBoxAdapter(child: _SectionTitle(title: 'A little civic practice', action: '6 games'))),
        SliverPadding(padding: const EdgeInsets.symmetric(horizontal: 22), sliver: SliverGrid.builder(gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 360, mainAxisExtent: 170, crossAxisSpacing: 14, mainAxisSpacing: 14), itemCount: games.length, itemBuilder: (_, index) => CompactGameTile(game: games[index]))),
        const SliverPadding(padding: EdgeInsets.fromLTRB(22, 18, 22, 0), sliver: SliverToBoxAdapter(child: _AboutSection())),
        const SliverToBoxAdapter(child: SizedBox(height: 28)),
      ]);
}

class _TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(children: [Container(width: 42, height: 42, decoration: BoxDecoration(color: ink, borderRadius: BorderRadius.circular(13)), child: const Icon(Icons.account_balance, color: mustard)), const SizedBox(width: 12), const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('CIVIC GAMES', style: TextStyle(fontFamily: 'Arial', letterSpacing: 2, fontWeight: FontWeight.w800, fontSize: 12, color: coral)), Text('The thoughtful arcade', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: ink))]), const Spacer(), IconButton(onPressed: () {}, icon: const Icon(Icons.info_outline, color: ink))]);
}

class _HeroCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(color: ink, borderRadius: BorderRadius.circular(26), boxShadow: [BoxShadow(color: ink.withValues(alpha: .18), blurRadius: 24, offset: const Offset(0, 12))]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: mustard, borderRadius: BorderRadius.circular(99)), child: const Text('WELCOME TO THE ARCADE', style: TextStyle(fontFamily: 'Arial', fontWeight: FontWeight.w800, fontSize: 10, letterSpacing: 1.1, color: ink))), const Spacer(), const Icon(Icons.wb_sunny_outlined, color: mustard, size: 27)]),
          const SizedBox(height: 28),
          const Text('Play the\npublic square.', style: TextStyle(color: paper, fontSize: 36, height: .98, fontWeight: FontWeight.bold, letterSpacing: -.7)),
          const SizedBox(height: 14),
          Text('Six quick simulations about democracy, media, and the messy choices in between.', style: TextStyle(color: paper.withValues(alpha: .72), fontFamily: 'Arial', height: 1.45, fontSize: 14)),
          const SizedBox(height: 22),
          FilledButton.icon(onPressed: () => _openGame(context, games.first), icon: const Icon(Icons.play_arrow_rounded), label: const Text('Play featured game'), style: FilledButton.styleFrom(backgroundColor: coral, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14))),
        ]),
      );
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title, required this.action});
  final String title;
  final String action;
  @override
  Widget build(BuildContext context) => Row(children: [Text(title, style: const TextStyle(color: ink, fontSize: 21, fontWeight: FontWeight.bold)), const Spacer(), Text(action, style: const TextStyle(fontFamily: 'Arial', color: coral, fontWeight: FontWeight.w700, fontSize: 12))]);
}

class GameCard extends StatelessWidget {
  const GameCard({required this.game, super.key});
  final GameInfo game;
  @override
  Widget build(BuildContext context) => InkWell(onTap: () => _openGame(context, game), borderRadius: BorderRadius.circular(20), child: Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: game.color, borderRadius: BorderRadius.circular(20)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [Icon(game.icon, color: ink, size: 28), const Spacer(), Text(game.tag.toUpperCase(), style: const TextStyle(fontFamily: 'Arial', fontSize: 9, fontWeight: FontWeight.w800, letterSpacing: 1, color: ink))]), const SizedBox(height: 24), Text(game.kicker, style: const TextStyle(fontFamily: 'Arial', color: ink, fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 1)), const SizedBox(height: 5), Text(game.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(color: ink, fontSize: 20, fontWeight: FontWeight.bold)), const SizedBox(height: 8), Flexible(child: Text(game.description, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'Arial', color: ink.withValues(alpha: .72), fontSize: 12, height: 1.25))) ])));
}

class CompactGameTile extends StatelessWidget {
  const CompactGameTile({required this.game, super.key});
  final GameInfo game;
  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => _openGame(context, game),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: ink.withValues(alpha: .08))),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(width: 40, height: 40, decoration: BoxDecoration(color: game.color, borderRadius: BorderRadius.circular(12)), child: Icon(game.icon, color: ink, size: 21)),
            const SizedBox(width: 12),
            Expanded(child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(game.kicker, style: const TextStyle(fontFamily: 'Arial', color: coral, fontWeight: FontWeight.w800, fontSize: 9, letterSpacing: .8)),
              const SizedBox(height: 5),
              Text(game.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(color: ink, fontSize: 17, fontWeight: FontWeight.bold)),
              const SizedBox(height: 14),
              const Align(alignment: Alignment.centerRight, child: Icon(Icons.arrow_forward, size: 16, color: coral)),
            ])),
          ]),
        ),
      );
}

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});
  @override
  Widget build(BuildContext context) => CustomScrollView(slivers: [
        SliverPadding(padding: const EdgeInsets.fromLTRB(22, 26, 22, 20), sliver: SliverToBoxAdapter(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('Your library', style: TextStyle(color: ink, fontSize: 32, fontWeight: FontWeight.bold)), const SizedBox(height: 8), Text('Every game is a different way to look at the same room.', style: TextStyle(fontFamily: 'Arial', color: ink.withValues(alpha: .65), fontSize: 14))]))),
        SliverPadding(padding: const EdgeInsets.symmetric(horizontal: 22), sliver: SliverList.builder(itemCount: games.length, itemBuilder: (_, index) => Padding(padding: const EdgeInsets.only(bottom: 12), child: CompactGameTile(game: games[index])))),
        const SliverPadding(padding: EdgeInsets.fromLTRB(22, 18, 22, 0), sliver: SliverToBoxAdapter(child: _AboutSection())),
        const SliverToBoxAdapter(child: SizedBox(height: 28)),
      ]);
}

class _AboutSection extends StatelessWidget {
  const _AboutSection();

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: ink, borderRadius: BorderRadius.circular(20)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [const Icon(Icons.person_outline, color: mustard), const SizedBox(width: 10), const Text('About the creator', style: TextStyle(color: paper, fontSize: 20, fontWeight: FontWeight.bold)), const Spacer(), Icon(Icons.edit_note, color: paper.withValues(alpha: .65))]),
          const SizedBox(height: 14),
          Text('Write a short introduction about yourself here. Share what you make, what you care about, and why these games exist.', style: TextStyle(fontFamily: 'Arial', color: paper.withValues(alpha: .72), height: 1.45)),
          const SizedBox(height: 18),
          const Text('YOUR NAME / STUDIO', style: TextStyle(fontFamily: 'Arial', color: mustard, fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 1)),
          const SizedBox(height: 10),
          Wrap(spacing: 8, runSpacing: 8, children: [
            _AboutLink(label: 'yourwebsite.com', icon: Icons.language),
            _AboutLink(label: 'linkedin.com/in/you', icon: Icons.work_outline),
            _AboutLink(label: 'github.com/you', icon: Icons.code),
          ]),
        ]),
      );
}

class _AboutLink extends StatelessWidget {
  const _AboutLink({required this.label, required this.icon});
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) => Chip(avatar: Icon(icon, size: 15, color: ink), label: Text(label, style: const TextStyle(fontFamily: 'Arial', fontSize: 11, color: ink)), backgroundColor: paper);
}

void _openGame(BuildContext context, GameInfo game) => Navigator.of(context).push(MaterialPageRoute(builder: (_) => GamePage(game: game)));

class GamePage extends StatelessWidget {
  const GamePage({required this.game, super.key});
  final GameInfo game;
  @override
  Widget build(BuildContext context) => Scaffold(backgroundColor: paper, appBar: AppBar(backgroundColor: paper, foregroundColor: ink, elevation: 0, title: Text(game.title, style: const TextStyle(color: ink, fontWeight: FontWeight.bold)), actions: [IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close))]), body: switch (game.title) {
    'Budget Battle' => const BudgetBattle(),
    'The Civic Feed' => const CivicFeedGame(),
    'The Assignment Desk' => const NewsDeskGame(),
    'Coalition Builder' => const CoalitionBuilderGame(),
    'The Whisper Campaign' => const WhisperCampaignGame(),
    _ => const WhatsAppUniversityGame(),
  });
}

class BudgetBattle extends StatefulWidget {
  const BudgetBattle({super.key});
  @override
  State<BudgetBattle> createState() => _BudgetBattleState();
}

class _BudgetBattleState extends State<BudgetBattle> {
  double roads = 20, police = 10, water = 20, health = 20, education = 20;
  int budget = 100, risk = 0;
  final deals = <String>{};
  double get used => roads + police + water + health + education;
  int get approval => (30 + [roads, police, water, health, education].where((v) => v >= 30).length * 10 - risk * .2).clamp(0, 100).floor();
  void takeDeal(String name, int amount, int riskValue) { if (deals.add(name)) setState(() { budget += amount; risk += riskValue; }); }
  @override
  Widget build(BuildContext context) {
    final sectors = [('Roads', Icons.construction, roads, (v) => roads = v, 40), ('Police', Icons.local_police, police, (v) => police = v, 35), ('Water', Icons.water_drop, water, (v) => water = v, 30), ('Health', Icons.local_hospital, health, (v) => health = v, 30), ('Education', Icons.school, education, (v) => education = v, 25)];
    return ListView(padding: const EdgeInsets.fromLTRB(20, 8, 20, 28), children: [const Text('Make the city work.', style: TextStyle(color: ink, fontSize: 28, fontWeight: FontWeight.bold)), const SizedBox(height: 6), Text('Pick your winning allocations. Every shortcut has a receipt.', style: TextStyle(fontFamily: 'Arial', color: ink.withValues(alpha: .65))), const SizedBox(height: 20), Row(children: [_Metric(label: 'BUDGET LEFT', value: '₹${budget - used.toInt()} Cr', color: mint), _Metric(label: 'APPROVAL', value: '$approval%', color: lavender), _Metric(label: 'RISK', value: '$risk%', color: risk > 50 ? const Color(0xFFF5D0CD) : const Color(0xFFF9E2C3))]), const SizedBox(height: 22), const Text('Secret deals', style: TextStyle(color: ink, fontSize: 18, fontWeight: FontWeight.bold)), const SizedBox(height: 10), Wrap(spacing: 8, runSpacing: 8, children: [('Sell Park', 30, 25), ('Privatize Water', 25, 20), ('Corp Donation', 15, 15), ('Sell Data', 10, 10)].map((deal) => ActionChip(label: Text('${deal.$1}  +₹${deal.$2}Cr'), avatar: Icon(deals.contains(deal.$1) ? Icons.check : Icons.add, size: 17), onPressed: deals.contains(deal.$1) ? null : () => takeDeal(deal.$1, deal.$2, deal.$3))).toList()), const SizedBox(height: 24), const Text('Fund the sectors', style: TextStyle(color: ink, fontSize: 18, fontWeight: FontWeight.bold)), const SizedBox(height: 8), ...sectors.map((sector) => _Sector(name: sector.$1, icon: sector.$2, value: sector.$3, demand: sector.$5, onChanged: (value) => setState(() => sector.$4(value)))), const SizedBox(height: 18), FilledButton.icon(onPressed: budget - used >= 0 ? () => _result(context) : null, icon: const Icon(Icons.how_to_vote), label: const Text('Finalize budget'), style: FilledButton.styleFrom(backgroundColor: ink, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 16))) ]);
  }
  void _result(BuildContext context) => showDialog(context: context, builder: (_) => AlertDialog(title: Text(approval >= 60 ? 'Re-elected!' : 'The voters have spoken.'), content: Text('Final approval: $approval%. ${risk > 50 ? 'Your secret deals became tomorrow’s headline.' : 'The city is still standing.'}'), actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Keep playing'))]));
}

class _Metric extends StatelessWidget { const _Metric({required this.label, required this.value, required this.color}); final String label, value; final Color color; @override Widget build(BuildContext context) => Expanded(child: Container(margin: const EdgeInsets.only(right: 7), padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(14)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(label, style: const TextStyle(fontFamily: 'Arial', fontSize: 9, fontWeight: FontWeight.w800, color: ink)), const SizedBox(height: 7), Text(value, style: const TextStyle(color: ink, fontSize: 18, fontWeight: FontWeight.bold))]))); }
class _Sector extends StatelessWidget { const _Sector({required this.name, required this.icon, required this.value, required this.demand, required this.onChanged}); final String name; final IconData icon; final double value; final int demand; final ValueChanged<double> onChanged; @override Widget build(BuildContext context) => Container(margin: const EdgeInsets.only(bottom: 10), padding: const EdgeInsets.fromLTRB(14, 11, 10, 7), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)), child: Column(children: [Row(children: [Icon(icon, color: coral, size: 19), const SizedBox(width: 9), Text(name, style: const TextStyle(fontFamily: 'Arial', fontWeight: FontWeight.w700, color: ink)), const Spacer(), Text('₹${value.toInt()} Cr', style: const TextStyle(color: ink, fontWeight: FontWeight.bold))]), Slider(value: value, min: 0, max: 60, activeColor: coral, onChanged: onChanged), Align(alignment: Alignment.centerRight, child: Text('public demand ₹$demand Cr', style: TextStyle(fontFamily: 'Arial', fontSize: 10, color: ink.withValues(alpha: .5))))])); }

class _StatRow extends StatelessWidget {
  const _StatRow({required this.items});
  final List<(String, String, Color)> items;
  @override
  Widget build(BuildContext context) => Row(
        children: items.map((item) {
          return Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 7),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: item.$3, borderRadius: BorderRadius.circular(14)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(item.$1, style: const TextStyle(fontFamily: 'Arial', fontSize: 9, fontWeight: FontWeight.w800, color: ink)),
                const SizedBox(height: 7),
                Text(item.$2, style: const TextStyle(color: ink, fontSize: 18, fontWeight: FontWeight.bold)),
              ]),
            ),
          );
        }).toList(),
      );
}

class FeedItem {
  const FeedItem(this.text, this.source, this.type, this.engagement, this.polarization, this.info);
  final String text, source, type;
  final int engagement, polarization, info;
}

const feedItems = [
  FeedItem('Detailed PDF: How the new Metro line alignment was chosen.', 'Govt Portal', 'Policy', -10, -5, 20),
  FeedItem('RTI Activist reveals breakdown of road repair funds.', 'Citizen Watch', 'Civic', -5, 0, 15),
  FeedItem('DEBATE NIGHT: Panelist throws water glass at opponent!', 'Noida TV Hub', 'Outrage', 35, 20, -10),
  FeedItem('FWD: UNESCO declares Indian National Anthem Best in Universe.', 'Family Group', 'Misinfo', 15, 5, -10),
  FeedItem('Why Those People are secretly buying all the land in your city.', 'Radical Blog', 'Polarization', 40, 35, -20),
  FeedItem('Water tanker mafia exposed in sting operation.', 'Investigate', 'Civic', 20, 5, 15),
  FeedItem('ISRO announces launch date for new solar mission.', 'Science Daily', 'Education', 10, -5, 15),
];

class CivicFeedGame extends StatefulWidget {
  const CivicFeedGame({super.key});
  @override
  State<CivicFeedGame> createState() => _CivicFeedGameState();
}

class _CivicFeedGameState extends State<CivicFeedGame> {
  int engagement = 50, polarization = 20, info = 30, turn = 0;
  void choose(bool boost) {
    final item = feedItems[turn % feedItems.length];
    setState(() { engagement = (engagement + (boost ? item.engagement : -item.engagement ~/ 2)).clamp(0, 100); polarization = (polarization + (boost ? item.polarization : -item.polarization ~/ 2)).clamp(0, 100); info = (info + (boost ? item.info : 0)).clamp(0, 100); turn++; });
    if (turn >= 10 || polarization >= 100 || engagement <= 0) _finish(context, 'Feed simulation ended', 'Engagement $engagement%  •  Polarization $polarization%  •  Civic information $info%');
  }
  @override
  Widget build(BuildContext context) { final item = feedItems[turn % feedItems.length]; return ListView(padding: const EdgeInsets.fromLTRB(20, 8, 20, 28), children: [const Text('The Civic Feed', style: TextStyle(color: ink, fontSize: 28, fontWeight: FontWeight.bold)), const SizedBox(height: 6), Text('India Edition • Target: maximize information, minimize hate', style: TextStyle(fontFamily: 'Arial', color: ink.withValues(alpha: .65))), const SizedBox(height: 18), _StatRow(items: [('ENGAGEMENT', '$engagement%', mint), ('POLARIZATION', '$polarization%', const Color(0xFFF5D0CD)), ('CIVIC INFO', '$info%', lavender)]), const SizedBox(height: 20), Container(padding: const EdgeInsets.all(22), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: ink.withValues(alpha: .08), blurRadius: 18, offset: const Offset(0, 8))]), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(item.type.toUpperCase(), style: const TextStyle(fontFamily: 'Arial', color: coral, fontWeight: FontWeight.w800, fontSize: 10, letterSpacing: 1)), const SizedBox(height: 15), Text(item.text, style: const TextStyle(color: ink, fontSize: 24, height: 1.15, fontWeight: FontWeight.bold)), const SizedBox(height: 20), Text(item.source, style: TextStyle(fontFamily: 'Arial', color: ink.withValues(alpha: .55), fontSize: 12))])), const SizedBox(height: 18), Row(children: [Expanded(child: _GameButton(label: 'BURY', icon: Icons.keyboard_arrow_down, color: ink, onTap: () => choose(false))), const SizedBox(width: 10), Expanded(child: _GameButton(label: 'BOOST', icon: Icons.trending_up, color: coral, onTap: () => choose(true)))])]); }
}

class _GameButton extends StatelessWidget {
  const _GameButton({required this.label, required this.icon, required this.color, required this.onTap});
  final String label; final IconData icon; final Color color; final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => FilledButton.icon(onPressed: onTap, icon: Icon(icon), label: Text(label), style: FilledButton.styleFrom(backgroundColor: color, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 15)));
}

class NewsStory { const NewsStory(this.title, this.type, this.rating, this.info); final String title, type; final int rating, info; }
const newsStories = [NewsStory('Cricketer buys 5 Cr SUV: PICS!', 'Fluff', 15, -5), NewsStory('DEBATE: Anchor Shouts for 20 Mins', 'Scandal', 20, -10), NewsStory('GST Council: New Tax Slab Details', 'Policy', -10, 20), NewsStory('Groundwater Report: Crisis Ahead', 'Policy', -8, 25), NewsStory('ISRO Launch Successful', 'News', 10, 10), NewsStory('New Metro Line Opens Today', 'News', 5, 5), NewsStory('Hindu-Muslim Debate: Shout Match', 'Scandal', 25, -15)];

class NewsDeskGame extends StatefulWidget {
  const NewsDeskGame({super.key});
  @override
  State<NewsDeskGame> createState() => _NewsDeskGameState();
}

class _NewsDeskGameState extends State<NewsDeskGame> {
  int ratings = 50, info = 50, aired = 0, seconds = 15;
  Timer? timer;
  final active = <NewsStory>[];
  bool started = false, ended = false;

  void start() {
    setState(() { started = true; ended = false; aired = 0; ratings = 50; info = 50; seconds = 15; active..clear()..addAll(newsStories.take(5)); });
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      setState(() => seconds--);
      if (seconds <= 0) finish('Deadline missed!');
    });
  }

  void air(NewsStory story) {
    if (!started || ended) return;
    setState(() { ratings = (ratings + story.rating).clamp(0, 100); info = (info + story.info).clamp(0, 100); aired++; active.remove(story); });
    if (aired >= 5) finish('Broadcast complete!');
  }

  void finish(String reason) {
    timer?.cancel();
    if (!mounted) return;
    setState(() => ended = true);
    showDialog(context: context, barrierDismissible: false, builder: (_) => AlertDialog(title: Text(ratings > 50 && info > 50 ? 'LEGENDARY EDITOR' : 'Hour ended'), content: Text('$reason\n\nTRP: $ratings%\nInfo: $info%'), actions: [TextButton(onPressed: () { Navigator.pop(context); start(); }, child: const Text('Play again'))]));
  }

  @override
  void dispose() { timer?.cancel(); super.dispose(); }

  @override
  Widget build(BuildContext context) => ListView(padding: const EdgeInsets.fromLTRB(20, 8, 20, 28), children: [
        const Text('News Desk', style: TextStyle(color: ink, fontSize: 28, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Text('Curate the 9 PM broadcast before the clock runs out.', style: TextStyle(fontFamily: 'Arial', color: ink.withValues(alpha: .65))),
        const SizedBox(height: 18),
        _StatRow(items: [('TIME LEFT', '${started ? seconds : 15}s', const Color(0xFFF9E2C3)), ('TRP', '$ratings%', mint), ('INFO', '$info%', lavender)]),
        const SizedBox(height: 18),
        if (!started)
          Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: ink, borderRadius: BorderRadius.circular(20)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('Breaking News', style: TextStyle(color: paper, fontSize: 25, fontWeight: FontWeight.bold)), const SizedBox(height: 8), Text('You are the Editor-in-Chief. Pick five stories for the broadcast in 15 seconds.', style: TextStyle(fontFamily: 'Arial', color: paper.withValues(alpha: .72), height: 1.4)), const SizedBox(height: 18), FilledButton(onPressed: start, child: const Text('Start broadcast'))]))
        else ...[
          const Text('Choose five stories', style: TextStyle(color: ink, fontSize: 19, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          ...active.map((story) => Card(child: ListTile(onTap: () => air(story), leading: Icon(story.type == 'Policy' ? Icons.balance : story.type == 'Scandal' ? Icons.warning_amber : Icons.article, color: coral), title: Text(story.title, style: const TextStyle(color: ink, fontWeight: FontWeight.bold)), subtitle: Text('${story.type}  •  TRP ${story.rating >= 0 ? '+' : ''}${story.rating}  •  Info ${story.info >= 0 ? '+' : ''}${story.info}')))),
        ],
      ]);
}

class Law { const Law(this.title, this.description, this.affinities); final String title, description; final List<int> affinities; }
const parties = [('Farmers Front', 80), ('Corp Alliance', 90), ('Sanskriti Dal', 70), ('Youth Bloc', 110)];
const laws = [Law('Green Energy Subsidy', 'Tax cuts for solar farms. Reduces diesel subsidies.', [-2, 1, -1, 2]), Law('Labor Code Reform', '12-hour work shifts allowed. Easier hiring/firing.', [-1, 2, -1, 0]), Law('Heritage Protection Act', 'Funds ancient sites but bans construction near them.', [-1, -2, 2, -1]), Law('Digital Privacy Bill', 'Strict data localization. Good for users, bad for big tech.', [0, -2, 0, 2]), Law('MSP Guarantee Act', 'Guarantees minimum crop prices. Huge cost to exchequer.', [2, -2, 0, -1]), Law('Urban Infra Overhaul', 'Demolish old structures for flyovers.', [-1, 1, -2, 1]), Law('University Autonomy', 'Reduces government control over syllabus.', [0, 0, -2, 2]), Law('Defense Budget Hike', 'Increases military spending by cutting social welfare.', [-1, 1, 2, -2])];

class CoalitionBuilderGame extends StatefulWidget {
  const CoalitionBuilderGame({super.key});
  @override
  State<CoalitionBuilderGame> createState() => _CoalitionBuilderGameState();
}

class _CoalitionBuilderGameState extends State<CoalitionBuilderGame> {
  int capital = 75, weeks = 10, passed = 0, lawIndex = 0;
  late List<bool> support;
  _CoalitionBuilderGameState() : support = laws[0].affinities.map((value) => value > 0).toList();
  Law get law => laws[lawIndex % laws.length];
  int get votes => 150 + [for (var i = 0; i < parties.length; i++) if (support[i]) parties[i].$2].fold(0, (a, b) => a + b);

  void negotiate(int index) {
    final cost = 20 + law.affinities[index].abs() * 15;
    if (!support[index] && capital >= cost) setState(() { capital -= cost; support[index] = true; });
  }

  void nextLaw(bool success) {
    setState(() {
      if (success) { passed++; capital += 10; weeks--; } else { capital -= 5; weeks -= 2; }
      lawIndex++;
      support = law.affinities.map((value) => value > 0).toList();
    });
    if (passed >= 5 || weeks <= 0) showDialog(context: context, builder: (_) => AlertDialog(title: Text(passed >= 5 ? 'Victory!' : 'Defeat'), content: Text(passed >= 5 ? 'Coalition victorious! Your agenda passed.' : 'Term ended. The coalition collapsed.'), actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Keep playing'))]));
  }

  @override
  Widget build(BuildContext context) => ListView(padding: const EdgeInsets.fromLTRB(20, 8, 20, 28), children: [
        const Text('Coalition Builder', style: TextStyle(color: ink, fontSize: 28, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Text('Negotiate, count votes, and pass five laws before the term ends.', style: TextStyle(fontFamily: 'Arial', color: ink.withValues(alpha: .65))),
        const SizedBox(height: 18),
        _StatRow(items: [('CAPITAL', '$capital', const Color(0xFFF9E2C3)), ('WEEKS', '$weeks', mint), ('PASSED', '$passed / 5', lavender)]),
        const SizedBox(height: 18),
        Container(padding: const EdgeInsets.all(18), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(law.title, style: const TextStyle(color: ink, fontSize: 22, fontWeight: FontWeight.bold)), const SizedBox(height: 7), Text(law.description, style: TextStyle(fontFamily: 'Arial', color: ink.withValues(alpha: .7))), const SizedBox(height: 16), Text('Votes secured: $votes / 251', style: const TextStyle(color: ink, fontWeight: FontWeight.bold))])),
        const SizedBox(height: 14),
        ...List.generate(parties.length, (index) {
          final cost = 20 + law.affinities[index].abs() * 15;
          return Card(child: ListTile(title: Text(parties[index].$1, style: const TextStyle(color: ink, fontWeight: FontWeight.bold)), subtitle: Text('${parties[index].$2} seats  •  ${support[index] ? 'SUPPORTS' : 'OPPOSES'}'), trailing: support[index] ? const Icon(Icons.check_circle, color: Colors.green) : TextButton(onPressed: () => negotiate(index), child: Text('Negotiate $cost'))));
        }),
        const SizedBox(height: 10),
        _GameButton(label: 'CALL VOTE', icon: Icons.how_to_vote, color: ink, onTap: () => nextLaw(votes >= 251)),
      ]);
}

class WhisperNarrative { const WhisperNarrative(this.title, this.type, this.cost, this.power, this.description); final String title, type, description; final int cost, power; }
const whisperNarratives = [WhisperNarrative('Free Electricity Promise', 'Freebie', 40, 25, 'Promise 200 units free power.'), WhisperNarrative('Temple/Mosque Renovation Fund', 'Culture', 30, 15, 'Donation drive for a local place of worship.'), WhisperNarrative('Metro Extension Plan', 'Policy', 25, 10, 'Map of new metro lines.'), WhisperNarrative('Deepfake: Corruption Audio', 'Scandal', 60, 40, 'AI audio of the opponent taking bribes.'), WhisperNarrative('Scholarship Scheme', 'Policy', 20, 15, 'Tablets for toppers.')];
const whisperGroups = ['RWA Uncles', 'Kitty Party', 'Student Union', 'Traders Assoc', 'Slum Leaders', 'Auto Union', 'WhatsApp Grp'];
class WhisperCampaignGame extends StatefulWidget { const WhisperCampaignGame({super.key}); @override State<WhisperCampaignGame> createState() => _WhisperCampaignGameState(); }
class _WhisperCampaignGameState extends State<WhisperCampaignGame> { int days = 14, influence = 180, score = 0; WhisperNarrative? selected; String? target; void plant() { if (selected == null || target == null || influence < selected!.cost) return; setState(() { influence -= selected!.cost; score = (score + selected!.power).clamp(0, 100); days--; selected = null; target = null; }); if (score >= 60 || days <= 0) showDialog(context: context, builder: (_) => AlertDialog(title: Text(score >= 60 ? 'Campaign landslide!' : 'Campaign ended'), content: Text('Influence reached $score%. ${score >= 60 ? 'Your network carried the message.' : 'You ran out of time.'}'), actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Keep playing'))])); }
  @override Widget build(BuildContext context) => ListView(padding: const EdgeInsets.fromLTRB(20, 8, 20, 28), children: [const Text('The Whisper Campaign', style: TextStyle(color: ink, fontSize: 28, fontWeight: FontWeight.bold)), const SizedBox(height: 6), Text('Plant narratives, choose a network, and reach 60% influence.', style: TextStyle(fontFamily: 'Arial', color: ink.withValues(alpha: .65))), const SizedBox(height: 18), _StatRow(items: [('DAYS', '$days', const Color(0xFFF9E2C3)), ('INFLUENCE', '$influence', mint), ('REACH', '$score%', lavender)]), const SizedBox(height: 18), const Text('Choose a narrative', style: TextStyle(color: ink, fontSize: 19, fontWeight: FontWeight.bold)), const SizedBox(height: 8), ...whisperNarratives.map((n) => Card(child: ListTile(onTap: () => setState(() => selected = n), leading: Icon(selected == n ? Icons.check_circle : Icons.radio_button_unchecked, color: selected == n ? coral : ink.withValues(alpha: .4)), title: Text(n.title, style: const TextStyle(color: ink, fontWeight: FontWeight.bold)), subtitle: Text('${n.type}  •  ${n.description}  •  Cost ${n.cost}')))), const SizedBox(height: 10), const Text('Pick the first audience', style: TextStyle(color: ink, fontSize: 19, fontWeight: FontWeight.bold)), Wrap(spacing: 8, children: whisperGroups.map((group) => ChoiceChip(label: Text(group), selected: target == group, onSelected: (_) => setState(() => target = group))).toList()), const SizedBox(height: 18), _GameButton(label: 'PLANT NARRATIVE', icon: Icons.campaign, color: coral, onTap: plant)]); }

class WhatsAppLevel { const WhatsAppLevel(this.sender, this.text, this.correct, this.forward, this.ignore, this.reaction); final String sender, text, correct, forward, ignore, reaction; }
const whatsappLevels = [WhatsAppLevel('Ramesh Uncle', 'NASA has released a satellite picture of India during Diwali! Forward to every Indian!', 'Uncle, this is a population map, not Diwali lights. The image is fake.', 'Wow! Proud to be Indian! Forwarding to all my friends.', 'You ignored the message. A few relatives forwarded it anyway.', 'Beta, don’t try to teach me. I got this from a retired IAS officer.'), WhatsAppLevel('Auntie Anju', 'URGENT: Child kidnapping gangs are roaming our city! Forward to save children!', 'Auntie, local police confirmed this is a fake rumor. Sharing it can cause panic.', 'Oh my god! Sharing immediately!', 'You stayed silent. The fear-mongering spread to five groups.', 'I am trying to protect your kids and you are lecturing me?'), WhatsAppLevel('Cousin Rahul', 'CURE FOR VIRUS FOUND! Lemon and ginger at 6 AM kills every virus!', 'Doctors have clarified this does not cure viruses. Please share real medical advice.', 'Thanks bro! Nature’s best cure. Sending to my office group.', 'You ignored it. Several relatives stopped taking their medicines.', 'You trust these greedy doctors too much.')];
class WhatsAppUniversityGame extends StatefulWidget { const WhatsAppUniversityGame({super.key}); @override State<WhatsAppUniversityGame> createState() => _WhatsAppUniversityGameState(); }
class _WhatsAppUniversityGameState extends State<WhatsAppUniversityGame> {
  int level = 0, spread = 0, anger = 0;
  String? response;

  void choose(String action) {
    final data = whatsappLevels[level];
    setState(() {
      response = action == 'correct' ? data.correct : action == 'forward' ? data.forward : data.ignore;
      spread = (spread + (action == 'forward' ? 20 : action == 'ignore' ? 8 : 0)).clamp(0, 100);
      anger = (anger + (action == 'correct' ? 20 : 0)).clamp(0, 100);
    });
    Future.delayed(const Duration(milliseconds: 300), () {
      if (!mounted) return;
      if (anger >= 100 || spread >= 100 || level == whatsappLevels.length - 1) {
        showDialog(context: context, builder: (_) => AlertDialog(title: Text(anger >= 100 ? 'Kicked out of the group' : spread >= 100 ? 'Misinformation spread' : 'Group survived!'), content: Text('Spread: $spread%  •  Family anger: $anger%'), actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Keep playing'))]));
      } else {
        setState(() { level++; response = null; });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = whatsappLevels[level];
    return ListView(padding: const EdgeInsets.fromLTRB(20, 8, 20, 28), children: [
      const Text('WhatsApp University', style: TextStyle(color: ink, fontSize: 28, fontWeight: FontWeight.bold)),
      const SizedBox(height: 6),
      Text('Forward, fact-check, or ignore. Balance truth and family harmony.', style: TextStyle(fontFamily: 'Arial', color: ink.withValues(alpha: .65))),
      const SizedBox(height: 18),
      _StatRow(items: [('SPREAD', '$spread%', const Color(0xFFF9E2C3)), ('FAMILY ANGER', '$anger%', const Color(0xFFF5D0CD)), ('MESSAGE', '${level + 1}/${whatsappLevels.length}', mint)]),
      const SizedBox(height: 18),
      Container(padding: const EdgeInsets.all(18), decoration: BoxDecoration(color: const Color(0xFFE7F7E9), borderRadius: BorderRadius.circular(18)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(data.sender, style: const TextStyle(color: Color(0xFF128C7E), fontWeight: FontWeight.bold)), const SizedBox(height: 10), Text(data.text, style: const TextStyle(color: ink, fontSize: 18, height: 1.35)), if (response != null) ...[const Divider(height: 24), Text(response!, style: TextStyle(fontFamily: 'Arial', color: ink.withValues(alpha: .7)))] ])),
      const SizedBox(height: 14),
      _GameButton(label: 'FACT-CHECK', icon: Icons.fact_check, color: Colors.green.shade700, onTap: () => choose('correct')),
      const SizedBox(height: 8),
      _GameButton(label: 'FORWARD', icon: Icons.forward, color: coral, onTap: () => choose('forward')),
      const SizedBox(height: 8),
      OutlinedButton.icon(onPressed: () => choose('ignore'), icon: const Icon(Icons.visibility_off), label: const Text('IGNORE'), style: OutlinedButton.styleFrom(foregroundColor: ink, padding: const EdgeInsets.symmetric(vertical: 15))),
    ]);
  }
}

void _finish(BuildContext context, String title, String message) => showDialog(context: context, builder: (_) => AlertDialog(title: Text(title), content: Text(message), actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Keep playing'))]));
