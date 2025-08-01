import 'package:flutter/material.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  List<Community> communities = [
    Community(
      name: 'Musique',
      members: '104K',
      image: 'assets/images/musique.jpg',
      isJoined: false,
    ),
    Community(
      name: 'Cinéma',
      members: '87K',
      image: 'assets/images/tech.jpg',
      isJoined: true,
    ),
    Community(
      name: 'Jeux Vidéo',
      members: '156K',
      image: 'assets/images/gaming.jpg',
      isJoined: false,
    ),
    Community(
      name: 'Art Digital',
      members: '42K',
      image: 'assets/images/art.jpeg',
      isJoined: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Communauté'),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Fonctionnalité de recherche
              showSearch(
                context: context,
                delegate: CommunitySearchDelegate(communities),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [_buildHeader(), _buildCommunityList()]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Créer une nouvelle communauté
          _showCreateCommunityDialog();
        },
        backgroundColor: Colors.orange,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.orange.withAlpha(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rejoignez des communautés passionnantes',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Découvrez, partagez et connectez-vous avec des fans partageant les mêmes intérêts',
            style: TextStyle(color: Colors.grey[600]),
          ),
          SizedBox(height: 16),
          _buildStatsRow(),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildStatItem('250K+', 'Membres'),
        _buildStatItem('1.2K+', 'Communautés'),
        _buildStatItem('50K+', 'Posts/jour'),
      ],
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
      ],
    );
  }

  Widget _buildCommunityList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: communities.length,
      itemBuilder: (context, index) {
        return _buildCommunityCard(communities[index]);
      },
    );
  }

  Widget _buildCommunityCard(Community community) {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  community.image,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(150),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${community.members} membres',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    community.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                community.isJoined
                    ? OutlinedButton(
                        onPressed: () {
                          setState(() {
                            community.isJoined = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Vous avez quitté la communauté ${community.name}',
                              ),
                            ),
                          );
                        },
                        child: Text('Quitter'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.orange,
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          setState(() {
                            community.isJoined = true;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Vous avez rejoint la communauté ${community.name}',
                              ),
                            ),
                          );
                        },
                        child: Text('Rejoindre'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showCreateCommunityDialog() {
    showDialog(
      context: context,
      builder: (context) {
        String communityName = '';
        return AlertDialog(
          title: Text('Créer une communauté'),
          content: TextField(
            onChanged: (value) => communityName = value,
            decoration: InputDecoration(
              hintText: 'Nom de la communauté',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                if (communityName.isNotEmpty) {
                  setState(() {
                    communities.insert(
                      0,
                      Community(
                        name: communityName,
                        members: '1',
                        image: 'assets/images/new_community.jpg',
                        isJoined: true,
                      ),
                    );
                  });
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Communauté "$communityName" créée !'),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: Text('Créer'),
            ),
          ],
        );
      },
    );
  }
}

class Community {
  String name;
  String members;
  String image;
  bool isJoined;

  Community({
    required this.name,
    required this.members,
    required this.image,
    required this.isJoined,
  });
}

class CommunitySearchDelegate extends SearchDelegate {
  final List<Community> communities;

  CommunitySearchDelegate(this.communities);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = communities.where(
      (community) => community.name.toLowerCase().contains(query.toLowerCase()),
    );

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final community = results.elementAt(index);
        return ListTile(
          leading: CircleAvatar(backgroundImage: AssetImage(community.image)),
          title: Text(community.name),
          subtitle: Text('${community.members} membres'),
          trailing: community.isJoined
              ? Text('Déjà membre', style: TextStyle(color: Colors.green))
              : ElevatedButton(
                  onPressed: () {},
                  child: Text('Rejoindre'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? communities
        : communities.where(
            (community) =>
                community.name.toLowerCase().contains(query.toLowerCase()),
          );

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final community = suggestions.elementAt(index);
        return ListTile(
          leading: CircleAvatar(backgroundImage: AssetImage(community.image)),
          title: Text(community.name),
          subtitle: Text('${community.members} membres'),
          onTap: () {
            query = community.name;
            showResults(context);
          },
        );
      },
    );
  }
}
