import 'package:flutter_games/models/game.dart';

class GameRepository {
  static List<Game> games = [
    Game(
      id: 0,
      name: 'League of Legends',
      image: 'images/league_of_legends.jpg',
      genre: ['MOBA'],
      description:
          'League of Legends is a fast-paced, competitive online game that blends the speed and intensity of an RTS with RPG elements. Two teams of powerful champions, each with a unique design and playstyle, battle head-to-head across multiple battlefields and game modes. With an ever-expanding roster of champions, frequent updates and a thriving tournament scene, League of Legends offers endless replayability for players of every skill level.',
      year: 2009,
      ratingMember: 77,
      ratingCritic: 84,
    ),
    Game(
      id: 1,
      name: 'Grand Theft Auto V',
      image: 'images/gta.jpg',
      genre: ['Adventure', 'Shooter'],
      description:
          'Grand Theft Auto V is a vast open world game set in Los Santos, a sprawling sun-soaked metropolis struggling to stay afloat in an era of economic uncertainty and cheap reality TV. The game blends storytelling and gameplay in new ways as players repeatedly jump in and out of the lives of the game’s three lead characters, playing all sides of the game’s interwoven story.',
      year: 2013,
      ratingMember: 90,
      ratingCritic: 88,
    ),
    Game(
      id: 2,
      name: 'Valorant',
      image: 'images/valorant.jpg',
      genre: ['Tactical', 'Shooter'],
      description:
          'VALORANT is a character-based 5v5 tactical shooter set on the global stage. Outwit, outplay, and outshine your competition with tactical abilities, precise gunplay, and adaptive teamwork.',
      year: 2020,
      ratingMember: 73,
      ratingCritic: 78,
    ),
    Game(
      id: 3,
      name: 'Minecraft',
      image: 'images/minecraaft.jpg',
      genre: ['Adventure', 'Simulator'],
      description:
          "Minecraft focuses on allowing the player to explore, interact with, and modify a dynamically-generated map made of one-cubic-meter-sized blocks. In addition to blocks, the environment features plants, mobs, and items. Some activities in the game include mining for ore, fighting hostile mobs, and crafting new blocks and tools by gathering various resources found in the game. The game's open-ended model allows players to create structures, creations, and artwork on various multiplayer servers or their single-player maps. Other features include redstone circuits for logic computations and remote actions, minecarts and tracks, and a mysterious underworld called the Nether. A designated but completely optional goal of the game is to travel to a dimension called the End, and defeat the ender dragon.",
      year: 2017,
      ratingMember: 79,
      ratingCritic: 0,
    ),
    Game(
      id: 4,
      name: 'Rust',
      image: 'images/rust.jpg',
      genre: ['Adventure', 'Shooter', 'Indie', 'RPG'],
      description:
          "The only aim in Rust is to survive. Everything wants you to die - the island’s wildlife and other inhabitants, the environment, other survivors. Do whatever it takes to last another night.",
      year: 2018,
      ratingMember: 72,
      ratingCritic: 78,
    ),
    Game(
      id: 5,
      name: 'Dota 2',
      image: 'images/dota2.jpg',
      genre: ['MOBA', 'Strategy'],
      description:
          "Dota 2 is a multiplayer online battle arena video game and the stand-alone sequel to the Defense of the Ancients (DotA) mod. With regular updates that ensure a constant evolution of gameplay, features, and heroes, Dota 2 has taken on a life of its own",
      year: 2013,
      ratingMember: 80,
      ratingCritic: 91,
    ),
    Game(
      id: 6,
      name: 'Apex Legends',
      image: 'images/apex.jpg',
      genre: ['Shooter'],
      description:
          "Conquer with character in Apex Legends, a free-to-play Hero shooter where legendary characters with powerful abilities team up to battle for fame & fortune on the fringes of the Frontier. Master an ever-growing roster of diverse Legends, deep tactical squad play and bold new innovations that go beyond the Battle Royale experience—all within a rugged world where anything goes. Welcome to the next evolution of Hero Shooter.",
      year: 2019,
      ratingMember: 78,
      ratingCritic: 88,
    ),
    Game(
      id: 7,
      name: 'Tower of Fantasy',
      image: 'images/tower_of_fantasy.jpg',
      genre: ['Adventure', 'RPG'],
      description:
          "Tower of Fantasy is an anime-inspired cross-platform Massively Multiplayer Online Role-Playing Game (MMORPG). The MMORPG features a large open world, sci-fi themed Anime aesthetics, fast, smooth action combat, the ability to interact with your environment, an active PvP system and so much more. Immersive Open-World: Experience a vast alien world full of beautiful open vistas and imposing futuristic structures. Unique Characters: Wield the unique weapons of each character that grant different gameplay styles as you explore their compelling backstories. Grow and Explore Together: Party up with friends online and take on new adventures in the shared open world. Epic Combat:    Engage in epic battles against enemies of all shapes and sizes as you switch weapons and gameplay styles on the fly to unlock your own personal fighting style. Explore and Interact: Explore and interact with a vibrant living world as you discover your own journey through it.",
      year: 2021,
      ratingMember: 0,
      ratingCritic: 0,
    ),
    Game(
      id: 8,
      name: 'Fortnite',
      image: 'images/fortnite.jpg',
      genre: ['Shooter', 'RPG', 'Strategy'],
      description:
          "Fortnite is the completely free online game where you and your friends fight to be the last one standing in Battle Royale, join forces to make your own Creative games, or catch a live show at Party Royale.",
      year: 2017,
      ratingMember: 68,
      ratingCritic: 83,
    ),
    Game(
      id: 9,
      name: 'Cult of the Lamb',
      image: 'images/cult_of_the_lamb.jpg',
      genre: ['Shooter', 'Simulator', 'Strategy'],
      description:
          "Cult of the Lamb casts players in the role of a possessed lamb saved from annihilation by an ominous stranger, and must repay their debt by building a loyal following in his name. Start your own cult in a land of false prophets, venturing out into diverse and mysterious regions to build a loyal community of woodland worshippers and spread your Word to become the one true cult.",
      year: 2022,
      ratingMember: 0,
      ratingCritic: 89,
    ),
    Game(
      id: 10,
      name: 'Counter-Strike: Global Offensive',
      image: 'images/cs.jpg',
      genre: ['Shooter', 'Tactical'],
      description:
          "CS:GO is the fourth iteration of Valve's team-based modern-military first-person shooter that features new and updated versions of the classic CS content. While expanding the franchise, the game also introduces new gameplay modes, matchmaking and leader boards.",
      year: 2012,
      ratingMember: 82,
      ratingCritic: 81,
    ),
    Game(
      id: 11,
      name: 'Dead by Daylight',
      image: 'images/dead_by_daylight.jpg',
      genre: ['Simulator', 'Strategy', 'Adventure'],
      description:
          "Dead by Daylight is an asymmetrical multiplayer (4vs1) horror game where one player takes on the role of the savage Killer, and the other four players play as Survivors, trying to escape the Killer and avoid being caught and killed.",
      year: 2016,
      ratingMember: 72,
      ratingCritic: 67,
    ),
    Game(
      id: 12,
      name: 'Fall Guys',
      image: 'images/fall_guys.jpg',
      genre: ['Sport', 'Plataform'],
      description:
          "Fall Guys flings hordes of contestants together online in a mad dash through round after round of escalating chaos until one victor remains! Battle bizarre obstacles, shove through unruly competitors, and overcome the unbending laws of physics to avoid both humiliation and elimination. Leave your dignity at the door and prepare for hilarious failure in your quest for the crown",
      year: 2020,
      ratingMember: 77,
      ratingCritic: 77,
    ),
    Game(
      id: 13,
      name: 'Fifa 2022',
      image: 'images/fifa_22.jpg',
      genre: ['Sport'],
      description:
          "Powered by Football, FIFA 22 brings the game even closer to the real thing with fundamental gameplay advances and a new season of innovation across every mode. Play with 17,000+ players, over 700 teams in 90+ stadiums and more than 30 leagues from all over the globe.",
      year: 2021,
      ratingMember: 82,
      ratingCritic: 79,
    ),
  ];
}
