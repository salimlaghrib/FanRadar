// Écrans pour chaque onglet
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('FanRadar', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          IconButton(icon: Icon(Icons.message_outlined), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stories Section
            // Search Bar Section
            Container(
              padding: EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Rechercher des utilisateurs, posts, hashtags...',
                    hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
                    prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                    suffixIcon: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(Icons.tune, color: Colors.white, size: 20),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  onChanged: (value) {
                    // Logique de recherche ici
                  },
                ),
              ),
            ),
            // Categories Section

            // Divider(height: 1),
            //News today   scetion liste verticale
            // News Today Section
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'News Today',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'NOUVEAU',
                          style: TextStyle(
                            color: Colors.red[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      Spacer(),
                      TextButton.icon(
                        onPressed: () {},

                        label: Text('Show more'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return _buildNewsTodayCard(context, index);
                      },
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),
            // PostsNewsSwitcher(),
            // Posts from followed users
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Post',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return _buildPostCard(context, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPostCard(BuildContext context, int index) {
    final users = [
      'Alice Martin',
      'Bob Durant',
      'Clara Dubois',
      'David Moreau',
      'Emma Petit',
    ];
    final times = [
      'il y a 2h',
      'il y a 4h',
      'il y a 6h',
      'il y a 8h',
      'il y a 10h',
    ];
    final contents = [
      'Superbe coucher de soleil aujourd\'hui ! 🌅',
      'Nouveau projet terminé, très content du résultat ! 💪',
      'Concert incroyable hier soir, merci à tous ! 🎵',
      'Petite pause café bien méritée ☕',
      'Weekend productif, prêt pour la semaine ! 🚀',
    ];

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey[200]!),
          bottom: BorderSide(color: Colors.grey[200]!),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Post Header
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, color: Colors.white),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        users[index],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        times[index],
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ],
                  ),
                ),
                IconButton(icon: Icon(Icons.more_horiz), onPressed: () {}),
              ],
            ),
          ),

          // Post Content
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(contents[index]),
          ),

          // Post Image (placeholder)
          Container(
            margin: EdgeInsets.symmetric(vertical: 12),
            height: 200,
            color: Colors.grey[200],
            child: Center(
              child: Icon(Icons.image, size: 60, color: Colors.grey[400]),
            ),
          ),

          // Post Actions
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                _buildActionButton(Icons.favorite_border, '${12 + index * 3}'),
                SizedBox(width: 20),
                _buildActionButton(Icons.comment_outlined, '${5 + index}'),
                SizedBox(width: 20),
                _buildActionButton(Icons.share_outlined, '${2 + index}'),
                Spacer(),
                IconButton(icon: Icon(Icons.bookmark_border), onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String count) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey[600]),
        SizedBox(width: 4),
        Text(count, style: TextStyle(color: Colors.grey[600])),
      ],
    );
  }

  Widget _buildNewsTodayCard(BuildContext context, int index) {
    final List<Map<String, dynamic>> newsToday = [
      {
        'title': 'BTS remporte 3 prix aux MTV Awards 2024',
        'description':
            'Le groupe sud-coréen continue de dominer la scène musicale internationale avec des performances exceptionnelles.',
        'image': 'assets/images/bts_news.jpg',
        'category': 'K-pop',
        'time': '2h',
        'author': 'Music Daily',
        'likes': '45.2K',
        'comments': '8.1K',
        'isBreaking': true,
        'categoryColor': Colors.purple,
      },
      {
        'title': 'Attack on Titan Studio annonce un nouveau projet',
        'description':
            'MAPPA révèle des détails sur une nouvelle série animée dans l\'univers d\'Attack on Titan.',
        'image': 'assets/images/aot_studio.jpg',
        'category': 'Anime',
        'time': '4h',
        'author': 'Anime News',
        'likes': '32.8K',
        'comments': '5.4K',
        'isBreaking': false,
        'categoryColor': Colors.red,
      },
      {
        'title': 'Marvel dévoile le casting de Fantastic Four',
        'description':
            'Les fans attendent avec impatience les nouvelles révélations sur les personnages iconiques.',
        'image': 'assets/images/marvel_cast.jpg',
        'category': 'Cinema',
        'time': '6h',
        'author': 'Comic Central',
        'likes': '67.9K',
        'comments': '12.3K',
        'isBreaking': true,
        'categoryColor': Colors.blue,
      },
      {
        'title': 'League of Legends World Championship 2024',
        'description':
            'Les équipes se préparent pour l\'événement esports le plus attendu de l\'année.',
        'image': 'assets/images/lol_worlds.jpg',
        'category': 'Gaming',
        'time': '8h',
        'author': 'Esports Today',
        'likes': '28.5K',
        'comments': '4.2K',
        'isBreaking': false,
        'categoryColor': Colors.green,
      },
      {
        'title': 'Taylor Swift surprend ses fans avec un nouveau single',
        'description':
            'La superstar américaine continue de battre des records avec ses sorties inattendues.',
        'image': 'assets/images/taylor_new.jpg',
        'category': 'Pop',
        'time': '10h',
        'author': 'Pop Central',
        'likes': '89.1K',
        'comments': '15.7K',
        'isBreaking': true,
        'categoryColor': Colors.pink,
      },
      {
        'title': 'One Piece manga atteint un nouveau jalon',
        'description':
            'Eiichiro Oda célèbre une étape historique dans l\'histoire du manga le plus vendu.',
        'image': 'assets/images/onepiece_milestone.jpg',
        'category': 'Manga',
        'time': '12h',
        'author': 'Manga Weekly',
        'likes': '41.6K',
        'comments': '7.8K',
        'isBreaking': false,
        'categoryColor': Colors.orange,
      },
    ];

    final news = newsToday[index];

    return Container(
      width: 320,
      // ✅ Fixe une largeur pour ListView horizontal
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => print('News sélectionnée: ${news['title']}'),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 📷 Image
              Container(
                width: 100,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: (news['categoryColor'] as Color).withOpacity(0.2),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    news['image'] as String,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // 📄 Infos
              Expanded(
                // ✅ maintenant ça marche, car la largeur du parent est fixée
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 📂 Catégorie et heure
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: (news['categoryColor'] as Color).withOpacity(
                              0.1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            news['category'] as String,
                            style: TextStyle(
                              color: news['categoryColor'] as Color,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 12,
                              color: Colors.grey[500],
                            ),
                            const SizedBox(width: 2),
                            Text(
                              'il y a ${news['time']}',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    Text(
                      news['title'] as String,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 4),

                    Text(
                      news['description'] as String,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 11,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person_outline,
                              size: 12,
                              color: Colors.grey[500],
                            ),
                            const SizedBox(width: 2),
                            Text(
                              news['author'] as String,
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.favorite_border,
                              size: 12,
                              color: Colors.red[400],
                            ),
                            const SizedBox(width: 2),
                            Text(
                              news['likes'] as String,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              Icons.comment_outlined,
                              size: 12,
                              color: Colors.blue[400],
                            ),
                            const SizedBox(width: 2),
                            Text(
                              news['comments'] as String,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
