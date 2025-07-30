import 'package:fanradar/views/screens/postsNewsSwitcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Explorer',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black87),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.notifications_none_outlined,
              color: Colors.black87,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // Header Section
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Découvrez des contenus',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Tendances, actualités et communautés pour vous',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),

          // Trending Now Section
          SliverToBoxAdapter(
            child: _buildSectionHeader(
              title: "Tendances actuelles",
              icon: Icons.trending_up,
              color: Colors.orange,
            ),
          ),
          SliverToBoxAdapter(child: _buildTrendingNowSection()),

          // Categories Section
          SliverToBoxAdapter(
            child: _buildSectionHeader(
              title: "Catégories populaires",
              icon: Icons.category,
              color: Colors.purple,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildCategoryCard(
                          "Sport",
                          'assets/images/sport.jpg',
                          Colors.green,
                        ),
                        _buildCategoryCard(
                          "Musique",
                          'assets/images/musique.jpg',
                          Colors.purple,
                        ),
                        _buildCategoryCard(
                          "Tech",
                          'assets/images/tech.jpg',
                          Colors.blue,
                        ),
                        _buildCategoryCard(
                          "Art",
                          'assets/images/art.jpeg',
                          Colors.orange,
                        ),
                        _buildCategoryCard(
                          "Food",
                          'assets/images/food.jpg',
                          Colors.red,
                        ),
                        _buildCategoryCard(
                          "Anime",
                          'assets/images/anime.jpg',
                          Colors.pinkAccent,
                        ),
                        _buildCategoryCard(
                          "Gaming",
                          'assets/images/gaming.jpg',
                          Colors.indigo,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Fan News Section
          SliverToBoxAdapter(
            child: _buildSectionHeader(
              title: "Actualités fans",
              icon: Icons.newspaper,
              color: Colors.blue,
              action: "Voir tout",
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildFanNewsCard(index),
              childCount: 3,
            ),
          ),

          // // Fan of the Week
          // SliverToBoxAdapter(
          //   child: _buildSectionHeader(
          //     title: "Fan de la semaine",
          //     icon: Icons.star,
          //     color: Colors.amber,
          //   ),
          // ),
          // SliverToBoxAdapter(child: _buildFanOfTheWeek()),

          // Trending Communities
          SliverToBoxAdapter(
            child: _buildSectionHeader(
              title: "Communautés tendances",
              icon: Icons.people_alt,
              color: Colors.green,
            ),
          ),
          SliverToBoxAdapter(child: _buildTrendingCommunities()),

          // Add padding at the bottom
          SliverPadding(padding: EdgeInsets.only(bottom: 30)),
        ],
      ),
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required IconData icon,
    required Color color,
    String? action,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Spacer(),
          if (action != null)
            TextButton(
              onPressed: () {},
              child: Text(action, style: TextStyle(color: color)),
            ),
        ],
      ),
    );
  }

  Widget _buildTrendingNowSection() {
    final trends = [
      {
        'tag': '#BTSComeback',
        'posts': '2.5M',
        'icon': Icons.music_note,
        'color': Colors.pink,
      },
      {
        'tag': '#AOTFinale',
        'posts': '1.8M',
        'icon': Icons.movie,
        'color': Colors.red,
      },
      {
        'tag': '#MarvelPhase5',
        'posts': '1.2M',
        'icon': Icons.theaters,
        'color': Colors.blue,
      },
      {
        'tag': '#LoLWorlds',
        'posts': '987K',
        'icon': Icons.sports_esports,
        'color': Colors.blueGrey,
      },
      {
        'tag': '#Swifties',
        'posts': '3.1M',
        'icon': Icons.headset,
        'color': Colors.purple,
      },
    ];

    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: trends.length,
        itemBuilder: (context, index) {
          final trend = trends[index];
          return Container(
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(
                  trend['icon'] as IconData,
                  size: 18,
                  color: trend['color'] as Color,
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      trend['tag'] as String,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '${trend['posts']} posts',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFanNewsCard(int index) {
    final newsItems = [
      {
        'title': 'BTS annonce un nouvel album pour 2024',
        'summary':
            'Le groupe a révélé les détails de leur prochain album lors d\'un live spécial',
        'category': 'K-pop',
        'time': 'Il y a 2h',
        'likes': '15.2K',
        'comments': '3.4K',
        'color': Colors.pink,
        'image': 'assets/images/bts_news.jpg',
      },
      {
        'title': 'Nouveau trailer pour Attack on Titan Finale',
        'summary':
            'Le trailer final révèle des scènes inédites du dernier épisode',
        'category': 'Anime',
        'time': 'Il y a 5h',
        'likes': '12.8K',
        'comments': '2.1K',
        'color': Colors.red,
        'image': 'assets/images/aot_studio.jpg',
      },
      {
        'title': 'Marvel dévoile le casting de Fantastic Four',
        'summary': 'Les acteurs principaux ont été annoncés lors du Comic-Con',
        'category': 'Cinéma',
        'time': 'Il y a 8h',
        'likes': '18.5K',
        'comments': '4.2K',
        'color': Colors.blue,
        'image': 'assets/images/marvel_cast.jpg',
      },
    ];

    final news = newsItems[index];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with category
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(
                  news['image'] as String,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: (news['color'] as Color).withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    news['category'] as String,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Content
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  news['title'] as String,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  news['summary'] as String,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 14, color: Colors.grey),
                    SizedBox(width: 5),
                    Text(
                      news['time'] as String,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Spacer(),
                    Icon(Icons.favorite_border, size: 16, color: Colors.grey),
                    SizedBox(width: 5),
                    Text(
                      news['likes'] as String,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    SizedBox(width: 15),
                    Icon(Icons.comment_outlined, size: 16, color: Colors.grey),
                    SizedBox(width: 5),
                    Text(
                      news['comments'] as String,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrendingCommunities() {
    final communities = [
      {
        'name': 'ARMY',
        'fandom': 'BTS',
        'members': '5.2M',
        'color': Colors.pink,
      },
      {
        'name': 'Marvelites',
        'fandom': 'MCU',
        'members': '3.8M',
        'color': Colors.red,
      },
      {
        'name': 'Potterheads',
        'fandom': 'Harry Potter',
        'members': '2.9M',
        'color': Colors.blue,
      },
      {
        'name': 'Swifties',
        'fandom': 'Taylor Swift',
        'members': '4.1M',
        'color': Colors.purple,
      },
    ];

    return Container(
      height: 150,
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: communities.length,
        itemBuilder: (context, index) {
          final community = communities[index];
          return Container(
            width: 160,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: (community['color'] as Color).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.people,
                      color: community['color'] as Color,
                      size: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    community['name'] as String,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Text(
                    community['fandom'] as String,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Spacer(),
                  Text(
                    '${community['members']} membres',
                    style: TextStyle(
                      color: (community['color'] as Color),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCategoryCard(String title, String imageUrl, Color color) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      width: 150,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            // Background image with overlay
            Positioned.fill(
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                color: color.withOpacity(0.4),
                colorBlendMode: BlendMode.color,
              ),
            ),

            // Gradient overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
                ),
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // Hover/click effect overlay
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: color.withOpacity(0.2),
                  highlightColor: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => Get.to(
                    PostsNewsSwitcher(),
                  ), // Add your onTap functionality here
                ),
              ),
            ),

            // Top-right corner accent
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                  ),
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
