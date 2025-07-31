import 'package:flutter/material.dart';

class PostsNewsSwitcher extends StatefulWidget {
  @override
  _PostsNewsSwitcherState createState() => _PostsNewsSwitcherState();
}

class _PostsNewsSwitcherState extends State<PostsNewsSwitcher> {
  String selected = 'news'; // 'news' ou 'posts'

  final String selectedCategory = 'Musique'; // Catégorie sélectionnée
  final int categoryFollowers = 10400; // 10.4k followers
  final int categoryPosts = 125000; // 125k posts
  final int categoryNews = 820; // 820 news

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Explore par categorie")),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(height: 20),
                // Bannière principale de catégorie
                _buildCategoryBanner(),
                SizedBox(height: 20),

                // Section Formations de la catégorie
                _buildCategoryStats(),
                SizedBox(height: 30),

                // Switch amélioré
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Expanded(child: _buildToggleButton('news', 'Actualités')),
                      Expanded(child: _buildToggleButton('posts', 'Posts')),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Contenu dynamique
                if (selected == 'news')
                  _buildNewsList()
                else
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return _buildPostCard(context, index);
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryBanner() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue[800],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/musique.jpg",
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.purple,
                  ),
                  child: Text(
                    selectedCategory,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Text(
                  "Découvrez tout sur la $selectedCategory",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.black,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryStats() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem(
            Icons.people_alt_outlined,
            '${(categoryFollowers / 1000).toStringAsFixed(1)}k',
            'Fandoms',
          ),
          _buildStatItem(
            Icons.post_add,
            '${(categoryPosts / 1000).toStringAsFixed(0)}k',
            'Posts',
          ),
          _buildStatItem(
            Icons.article_outlined,
            categoryNews.toString(),
            'News',
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.blue),
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
      ],
    );
  }

  Widget _buildToggleButton(String key, String label) {
    final isSelected = selected == key;
    return InkWell(
      onTap: () {
        setState(() {
          selected = key;
        });
      },
      borderRadius: BorderRadius.circular(26),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(26),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey[700],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNewsList() {
    final newsItems = [
      {
        'title': 'Nouvelle fonctionnalité disponible',
        'summary':
            'Découvrez notre dernière mise à jour avec des améliorations de performance',
        'time': 'Il y a 1 heure',
        'category': 'Technologie',
        'image': 'assets/images/tech.jpg',
      },
      {
        'title': 'Événement communautaire ce weekend',
        'summary':
            'Rejoignez-nous pour une journée de networking et d\'apprentissage',
        'time': 'Il y a 3 heures',
        'category': 'Événement',
        'image': 'assets/images/tech.jpg',
      },
      {
        'title': 'Interview avec notre CEO',
        'summary':
            'Découvrez les coulisses de notre entreprise et notre vision',
        'time': 'Il y a 5 heures',
        'category': 'Entreprise',
        'image': 'assets/images/tech.jpg',
      },
      {
        'title': 'Guide du débutant',
        'summary':
            'Tout ce que vous devez savoir pour bien commencer sur notre plateforme',
        'time': 'Il y a 1 jour',
        'category': 'Tutoriel',
        'image': 'assets/images/tech.jpg',
      },
      {
        'title': 'Mise à jour des CGU',
        'summary':
            'Nous avons mis à jour nos conditions générales d\'utilisation',
        'time': 'Il y a 2 jours',
        'category': 'Juridique',
        'image': 'assets/images/tech.jpg',
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: newsItems.length,
      itemBuilder: (context, index) {
        return _buildNewsCard(newsItems[index]);
      },
    );
  }

  Widget _buildNewsCard(Map<String, String> news) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image de la news
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  news['image']!,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  child: Text(
                    news['category']!,
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

          // Contenu textuel
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        news['title']!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      news['time']!,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  news['summary']!,
                  style: TextStyle(color: Colors.grey[600]),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.thumb_up_outlined, size: 18, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(
                      '24',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    SizedBox(width: 16),
                    Icon(Icons.comment_outlined, size: 18, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(
                      '5',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Spacer(),
                    Icon(Icons.bookmark_border, size: 18, color: Colors.grey),
                  ],
                ),
              ],
            ),
          ),
        ],
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
}
