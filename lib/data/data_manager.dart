import 'dart:convert';

import 'package:poker/data/models/news_model/news_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/analysis_model/analysis_model.dart';

class DataManager {
  static final String _key = 'analysis_model';

  static Future<void> saveAnalysisModel(AnalysisModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> jsonModel = model.toJson();
    String jsonString = jsonEncode(jsonModel);
    await prefs.setString(_key, jsonString);
  }

  static Future<AnalysisModel> loadAnalysisModel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(_key);
    if (jsonString != null) {
      Map<String, dynamic> jsonModel = jsonDecode(jsonString);
      return AnalysisModel.fromJson(jsonModel);
    } else {
      return AnalysisModel(); // Возвращаем пустую модель, если данные не найдены
    }
  }

  static List<String> game = [
    'Brag',
    'Badugi',
    'Texas hold\'em',
    'Pai Gow poker',
    'Poker',
    'Baccarat',
  ];

  static List<String> oponnentsCount = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '5+',
  ];

  static List<String> canYouBluff = [
    'Yes',
    'No',
  ];

  static List<String> behaviourStrategy = [
    'Aggressive',
    'Conservative',
    'Balanced',
    'None',
  ];

  static List<String> betStrategy = [
    'Doubled the bet',
    'Set the minimum',
    'Raised the bet',
    'None',
  ];

  static List<String> beginningCards = [
    'A pair of aces',
    'Cards of the same suit, but low',
    'One card of each suit',
    'I do not remember',
  ];

  static List<String> determinedOutcome = [
    'Successful bluffs',
    'Incorrect assessment of actions',
    'Winning card combinations',
    'I do not remember',
  ];

  static List<String> outcomeOfThisGame = [
    'Winning',
    'Loss',
    'Draw',
  ];

  static List<NewsModel> getAllNews() {
    List<NewsModel> news = [
      NewsModel(
        imgUrl: 'https://pnimg.net/w/articles/4/664/0907794eb4.jpg',
        title:
            'Two All-Time Greats Bag SCOOP Titles; Lex Leads SCOOP League',
        body:
'After a rest day on Friday, the PokerStars Spring Championship Of Online Poker (SCOOP) was back in full swing on Saturday night, with 21 new champions crowned. PokerNews is here and ready to give you The Inside SCOOP on SCOOP matters all this month, so keep reading to find out who emerged in the winner\'s circle and who will be looking for a strong showing as the schedule of PokerStars SCOOP Events enters its second week! Denis "aDrENalin710" Strebkov Grabs 15th COOP Title; Tied Fourth All-Time Denis StrebkovDenis Strebkov During the SCOOP League draft, many of the team captains commented that you needed players who could play all the games. An event like SCOOP 34-H: \$1,050 8-Game really puts that to the test. That\'s why there were some huge SCOOP League ramifications as Denis "aDrENalin710" Strebkov overcame a star-studded 61-player field to take down the tournament, winning his fourth SCOOP title. Put together with his 11 WCOOP titles, Strebkov now sits tied for fourth all-time on the all-time COOP list. Not only that, but he\'s now the best-performing player in the SCOOP League, moving Team Lex further ahead at the top of proceedings. Veldhuis also picked up valuable points from fourth-place finisher Jerry \"Perrymejsen\" Odeen and fifth-place finisher Ole "wizowizo" Schemion.'
      ),
      NewsModel(
        imgUrl:
            'https://pnimg.net/w/articles/4/664/095fad39d1.jpg',
        title:
            'Kenjic Hails "Once in a Lifetime" Achievement After Mediterranean Poker Party High Roller Victory',
        body:
            'Table Of Contents \$10,400 Mediterranean Poker Party High Roller Winner\'s Reaction Day 2 Action One week ago, Jovan Kenjic shined under the spotlights of EPT Monte-Carlo, finishing in fourth place of the €5,300 Main Event for €340,500. After this final table, he flew to the Merit Royal Diamond Hotel in Northern Cyprus, hoping for more deepruns. But more than another deeprun, he became the new champion of the \$10,400 Mediterranean Poker Party High Roller. Out of a field of 159 entrants, he bagged a big stack at the end of Day 1 and managed to make his way to the final table on Day 2. And after a "tougher final table than in Monte-Carlo," he lifted the trophy and won \$365,000, his new best cash. His last opponent, Aleksandr Kirichenko, goes back home with \$250,000 for his second place.',
      ),
      NewsModel(
        imgUrl:
        'https://pnimg.net/w/articles/4/645/a86c2d985f.jpg',
        title:
        '8 More WSOP Rules You Didn\'t Know Existed',
        body:
        'We\'ve previously looked at 8 World Series of Poker (WSOP) rules that you didn\'t know existed, and now with the 2024 WSOP less than a month away, we\'re back with another eight rules that you should be mindful of before making the trip to Las Vegas. Whatever you do...Don\'t Lose Your Bounty Marker There are plenty of bounty tournaments on the 2024 WSOP schedule, with each player receiving a special Bounty marker that can then be redeemed for the value of the bounty, which will vary from event to event. Tournament Room - Ballys However the rules, under Section 39c, stipulate that if you lose your bounty marker you will be required to pay the bounty value to receive another one. This money then goes straight into the prize pool. Not so bad in the \$1,000 Super Turbo Bounty, but what about the \$10,000 Super Turbo Bounty. And if you\'re playing either the Mystery Millions or a Mystery Bounty event? Listen up. If you are found to be playing in either of these events without a bounty marker, you may be subject to a penalty AND be required to pay the average value of all remaining bounties at that point in the tournament. Remember: The Mystery Millions guarantees the top bounty is \$1 million, which could cause a headache for someone should it stay in. However, rest assured that if the bounty marker is later found, the penalty payment will be returned to the participant "Disruptive" Personal Hygiene No one wants to be sat next to a smelly player, but did you know that the WSOP rules make specific reference to players like this? Under the \'Participant Conduct\' section, WSOP Tournament Staff may implement sanctions on any Participant whose personal hygiene has become "disruptive" to other players at the table, and refuses to "remedy the situation". Taunting. 15-Yard Penalty? In the last article, we mentioned that "Excessive Chatter" was a punishable offense. This time we\'re here to tell you that "Taunting" is also explicitly outlawed as per the WSOP rules. The official wording is that any player who taunts another player "through theatrics or gestures" is subject to penalty. This also covers any form of "inappropriate behavior" intended to disrupt other players at the table. New Phone, Who Dis? Under \'Communication\', the WSOP rules state that all cell phones must be silenced during Tournament play, and although players are allowed to use their phones at the table — providing they\'re not in a hand — a special rule is in place for texting someone at the same table. In short, if you attempt to communicate with someone at the same table as you — you\'re both disqualified. Alec Torelli watches some poker on his phone Don\'t Even Think About Real-Time Assistance Just in case you were wondering, even the WSOP has noticed the recent talk within the poker industry about Real-Time Assistance. Here\'s Section IV.64.c of the WSOP rules to spell it out for you:',
      ),
      NewsModel(
        imgUrl:
        'https://pnimg.net/w/articles/4/662/b1db8a1ee9.jpg',
        title:
        'Rampage Wants the \'Chat Pros\' to Bet Against Him at the World Series of Poker',
        body:
        'Ethan "Rampage" Yau is putting his money where his mouth is heading into the 2024 World Series of Poker (WSOP), and he\'s asking for the "chat pros" to do the same. The popular poker vlogger who isn\'t afraid to gamble for massive stakes called out his doubters on X in hopes of securing what could be the biggest prop bet of the summer that doesn\'t involve Landon Tice and Jeremy Becker, unless of course they want in on the action. "Idea for WSOP prop bet, would anyone be interested in fading me and my entire schedule? I’m 0/2 in profitable summers lifetime and looking to make things interesting. Looking to increase my exposure x2 basically and the fader acts as casino. If I brick a 5K, I lose extra 5K on top within prop bet. If I min cash a 5K for 9K, I’ll profit an extra 4K. Winning a 5K for \$300K~ then I profit 295K. Looking for action for my whole schedule or capped to a buy in amount. Chat pros, your time to step up and put your money where your Twitter thumbs are," Yau tweeted.',
      ),
      NewsModel(
        imgUrl:
        'https://pnimg.net/w/articles/4/663/3794c794dc.png',
        title:
        'Venetian Las Vegas Announces \$1.5 Billion Facelift',
        body:
        'As the Venetian Resort Las Vegas celebrates the property’s 25th anniversary this year, the casino has announced a \$1.5 billion renovation project. The casino will see a complete reimagining, according to management, that will include every aspect of the resort – even a rebrand of The Venetian’s lion logo. “The Venetian Resort’s innovative spirit has had a massive impact on Las Vegas over the last 25 years and paved the way for our visionary \$1.5 billion reinvestment today,” Venetian President and CEO Patrick Nichols said. “This redevelopment marks more than just a surface-level renovation, it signifies a deep understanding of our guests and a profound reimagining of an iconic resort unlike any other in history. The beauty of this project lies within the balance of the beloved familiar and the never-before-seen.” A Look At The Plans The property announced in February that renovation also includes a new poker room. The addition moves the room from 35 tables to 50 in a new 14,000-square-foot space, which will also feature a dedicated livestreaming space. Venetian officials said the new venue would “push the boundaries of modern poker forward.” The room is expected to be unveiled this summer. Now the property has outlined some of the additional renovation plans. A major part of that is a complete redesign of the resort’s hotel suites, which remain the largest standard room on The Strip. Available for stays beginning in September 2024, all 4,000 suites in The Venetian towers, will be completely updated. The new suites are inspired by the traditional ornate costumes of the Venetian Carnival, “infusing energy, spirit, and warmth in a contemporary, fresh design,” according to the company. Additionally, plans call for new chef-led culinary concepts and additional entertainment options. Gaming areas will also be redeveloped including new offerings in The Palazzo High Limit Lounge, a fully redesigned sportsbook complete with a multi-year naming rights partnership with Yahoo, and an investment of \$188 million to renovate the resort’s convention center.',
      ),
      NewsModel(
        imgUrl:
        'https://pnimg.net/w/articles/4/663/cd8cca49be.jpg',
        title:
        'Ukraine Bans Online Gambling For Soldiers',
        body:
        'Ukraine has not only seen ground given up in recent months in the country’s war against Russia, but a new report also notes that online gambling may be becoming popular with soldiers coping with the ravages of the battlefield. A Ukrainian soldier put forward a petition in the hopes of getting the country to do something about the issue. Critics of the online casinos say that the operators use patriotic ads and tactics to take advantage of soldiers and other Ukrainians. Gambling has long been a way to kill some time while in battle. Soldiers in the Civil War and World War II were known to play poker to pass the time. But the ability to easily wager on mobile phones has some concerned that Ukrainian soldiers may be developing gambling problems. “Military life generally has been described as long hours of boredom punctuated by a few minutes of terror, and I think that’s a very apt description," Nigel Turner, a scientist at the Centre for Addiction and Mental Health (CAMH) in Toronto, told the CBC.',
      ),
      NewsModel(
        imgUrl:
        'https://pnimg.net/w/articles/7/663/df4b896dae.jpg',
        title:
        'Rattlesnake Open Kicks Off At Global Poker',
        body:
        'The Rattlesnake Open, one of Global Poker’s most popular series, has returned to the site with a staggering GC 965,000,000 and SC 2,220,000 guaranteed. The action kicks off May 6 and continues with three weeks of non-stop tournament action. There are a total of 216 trophies up for grabs (108 Gold Coin and 108 Sweeps Coin), along with a daily log-in bonus, weekend pop up freerolls, and a new mystery bounty event. Everything leads to the two main events, which boast GC 40,000,000 and SC 200,000 guaranteed. Those who find themselves in the Gold Coin winner’s circle will take home an exclusive Rattlesnake Open VII championship pack, which includes Global Poker merch and the iconic rattlesnake trophy.',
      ),
      NewsModel(
        imgUrl:
        'https://pnimg.net/w/articles/7/663/e5b997758d.png',
        title:
        'Poker Strategy With Jonathan Little: You Need To Start Bluffing!',
        body:
        'If you want to increase your poker skills and learn to crush the games, check out Jonathan Little’s elite training site at PokerCoaching.com/CardPlayer. One of the most common mistakes many amateur poker players make is that they only bet when they have a strong hand. They assume that the way to win at poker is to wait for a premium hand and then pile their money into the pot, hoping some oblivious whale pays them off. In reality, if you only put significant money in the pot with your premium hands, your competent opponents will almost never pay you off unless they happen to also make an extremely strong hand. Suppose your opponent raises to three big blinds out of her 100 big blind stack from middle position and only you call on the button. The flop comes 8Heart Suit 7Heart Suit 4Diamond Suit. Your opponent bets four big blinds into the 7.5 bb pot. Some players only raise in this spot with exactly 6-5, 8-8, 7-7, 4-4, and 8-7. While there is nothing wrong with raising with these premium hands since it is nearly impossible for your opponent to have a better hand, she can easily fold her entire range, meaning you will never get value. To solve this problem, you should bluff from time to time. The hands that are best to bluff with are those that also have some chance to improve to the best hand on the turn or river. In this case, the best bluffs are flush draws and straight draws. If your goal is to be balanced (as it often should be against decent opponents), you can raise with about two times as many semi-bluffs as value hands because many of your semi-bluffs will improve to premium hands on the turn or river. So, in this situation, in addition to raising with your premium made hands, you should raise with many of your draws such as 10-9, K-6 suited, 5-4 suited, and flush draws. If you are known to have a tight image, your opponent will play poorly by folding far too often (because she will incorrectly assume that you are only raising with premium hands). If your opponent is a calling station, that is fine too, because your premium hands will extract a lot of value and your draws will complete by the river some portion of the time.',
      ),
      NewsModel(
        imgUrl:
        'https://pnimg.net/w/articles/7/65d/735455686b.jpg',
        title:
        'PokerStars\' North American Poker Tour Returns To Resorts World Las Vegas This Fall',
        body:
        'Resorts World Las Vegas hosted the first PokerStars North American Poker Tour stop held in more than a decade last fall. The debut series of the reborn NAPT attracted just shy of 3,200 entries across 17 events, with \$4,264,665 in total prize money paid out along the way. The event’s organizers have announced that the festival is set to return in 2024, with ten days of tournament action planned for Nov. 1-10. “Resorts World Las Vegas is thrilled to announce the highly anticipated return of PokerStars and the NAPT this November. After last year’s tremendous success, we are eager to capitalize on that momentum and host an even more spectacular festival in 2024,” said Leon Wheeler, Director of Poker Operations for Resorts World Las Vegas. Sami Bechahed The main event last fall featured a \$1,650 buy-in. It attracted 1,095 total entries, surpassing the \$1.5 million guarantee to create a final prize pool of \$1,609,650. Sami Bechahed came out on top, securing the trophy and the top prize of \$268,945. This year the main event will feature a larger \$5,300 buy-in. There will be plenty of ways to win a seat, both online and via live events, with details to be announced shortly. “Last year, the NAPT smashed all expectations, so this year, we’re going even bigger. With a premier partner like Resorts World Las Vegas, we’re stepping up our game: bigger tournaments, buy-ins, and player-focused events,” said Steve Preiss, Vice President of PokerStars North America. Buy-ins are expected to range from \$250 all the way up to \$25,000. The full schedule will be released soon.',
      ),
      NewsModel(
        imgUrl:
        'https://pnimg.net/w/articles/7/661/ec3475a494.png',
        title:
        'PokerGO Announces 2024 World Series of Poker Live Streaming Schedule',
        body:
        'PokerGO has released their schedule for live streaming coverage of the 2024 World Series of Poker. There will be daily livestreams from this year’s WSOP starting May 30, with more than 300 hours of live broadcasts expected over the course of the summer. More than 30 bracelet events are expected to be featured, including marquee events like the \$50,000 Poker Players Championship, the \$250,000 buy-in high roller, the \$25,000 buy-in heads-up championship, and several other high-stakes staples of the festival. There will also be plenty of coverage of the biggest events of the summer that sport more affordable buy-ins, with tournaments like the \$1,500 Millionaire Maker, the \$1,500 Monster Stack, the \$1,000 Ladies championship all set to be broadcast. The 2024 WSOP \$10,000 main event will also see daily broadcast coverage on PokerGO from July 3-17. The full WSOP schedule can be found on the on PokerGO’s website. The PokerGO streaming platform is available on Android phones and tablets, iPhone, iPad, Apple TV, Roku, Amazon Fire TV, and via any web or mobile browser (simply navigate to PokerGO.com). Select broadcasts will be hosted on PokerGO’s YouTube channel.',
      ),
      NewsModel(
        imgUrl:
        'https://pnimg.net/w/articles/1/65e/876ed88b98.jpg',
        title:
        'Charity Series of Poker Hosts Hold\'em For Hunger Event On May 9th',
        body:
        'The Charity Series of Poker will be staying on the East Coast as part of their 2024 schedule with an event at the Borgata on May 9. The Hold’em for Hunger Charity Event will benefit the The Community Food Bank of New Jersey. The evening begins at the Gypsy Bar, and then things will move upstairs to the Central Conference Center for the poker tournament. The festivities kick off at 6:30 pm when players will be welcomed for a cocktail hour, with appetizers, live music, and a silent auction that will begin running at that time as well. You can view the auction items right here. Everything leads up to the main event of the night with the charity poker tournament. That turbo poker tournament will begin at 8 pm, featuring a top prize worth that will be half of the total buy-ins with the other half all going to charity. The \$230 buy-in charity poker event will also have unlimited re-entries until registration closes. There will be additional chip leader and most re-entry bonuses, and silent auctions prizes up for grabs as well. Anyone is welcome to attend the reception and silent auction for \$100 without participating in the tournament. Attire for all of the events is business casual. Established in 2014, the Charity Series of Poker is a nonprofit company founded to organize and promote charity poker tournaments and other events that raise money and awareness for worthy charities and causes. Poker professional Matt Stout is the founder and president of the CSOP. This upcoming event will be the 62nd stop for the series as it continues a strong lineup of events. Regarding this coming event, the CSOP website offered the following additional info: “At CFBNJ We serve as a champion for addressing root causes of hunger, delivering neighbor-centered solutions and fostering collaborative partnerships across all sectors of society for New Jersey. Working together with volunteers, donors and our many partners, we work to fill the emptiness caused by hunger with Food, Help and Hope.” For sponsorship opportunities, or any other questions, please contact Torrina Bennett-Michael at tbennett-michael@cfbnj.org.',
      ),
    ];

    return news;
  }
}
