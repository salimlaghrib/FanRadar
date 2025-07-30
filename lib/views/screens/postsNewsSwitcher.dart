import 'package:flutter/material.dart';

class PostsNewsSwitcher extends StatefulWidget {
  @override
  _PostsNewsSwitcherState createState() => _PostsNewsSwitcherState();
}

class _PostsNewsSwitcherState extends State<PostsNewsSwitcher> {
  String selected = 'news'; // 'news' ou 'posts'

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20), // 🔘 Boutons Switch
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildToggleButton('news', 'News'),
                  const SizedBox(width: 12),
                  _buildToggleButton('posts', 'Posts'),
                ],
              ),
              const SizedBox(height: 24),

              // 🧾 Contenu dynamique
              if (selected == 'news')
                _buildNewsContent()
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
    );
  }

  Widget _buildToggleButton(String key, String label) {
    final isSelected = selected == key;
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = key;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[700],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildNewsContent() {
    return Column(
      children: const [
        Icon(Icons.article, size: 60, color: Colors.blue),
        SizedBox(height: 8),
        Text('Contenu des News', style: TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget _buildPostsContent() {
    return Column(
      children: const [
        Icon(Icons.post_add, size: 60, color: Colors.green),
        SizedBox(height: 8),
        Text('Contenu des Posts', style: TextStyle(fontSize: 16)),
      ],
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
