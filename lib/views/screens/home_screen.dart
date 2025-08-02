import 'package:fanradar/views/screens/newsDetailPage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String userName = "Ahmed";
  final List<String> motivationalPhrases = [
    "Découvrez vos passions aujourd'hui",
    "Connectez-vous avec vos communautés",
    "Explorez de nouveaux univers",
    "Partagez votre passion avec le monde",
    "Votre radar détecte les meilleures tendances",
  ];

  Map<int, bool> likedPosts = {};
  Map<int, int> likeCounts = {0: 12, 1: 15, 2: 18, 3: 21, 4: 24};

  @override
  Widget build(BuildContext context) {
    final currentPhrase =
        motivationalPhrases[DateTime.now().day % motivationalPhrases.length];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: _buildModernAppBar(context, currentPhrase),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAddPostSection(context),
            const SizedBox(height: 16),
            _buildSearchSection(),
            const SizedBox(height: 24),
            _buildNewsTodaySection(),
            const SizedBox(height: 24),
            _buildPostsSection(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildModernAppBar(BuildContext context, String phrase) {
    return AppBar(
      toolbarHeight: 80,
      backgroundColor: Colors.white,
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: const Icon(Icons.radar, color: Colors.white, size: 24),
                ),
                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'FanRadar',
                            style: TextStyle(
                              color: Color(0xFF1F2937),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -0.5,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF10B981),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'LIVE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        phrase,
                        style: const TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F4F6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.notifications_outlined,
                          color: Color(0xFF6B7280),
                          size: 22,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Color(0xFFEF4444),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 8),

                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F4F6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.message_outlined,
                      color: Color(0xFF6B7280),
                      size: 22,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddPostSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
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
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blue[100],
              child: Text(
                userName[0].toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[600],
                ),
              ),
            ),
            const SizedBox(width: 12),

            Expanded(
              child: GestureDetector(
                onTap: () => _showCreatePostDialog(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    'Quoi de neuf, $userName ?',
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 12),

            Row(
              children: [
                _buildMediaButton(
                  Icons.photo_outlined,
                  Colors.green,
                  () => _showCreatePostDialog(context, mediaType: 'photo'),
                ),
                const SizedBox(width: 8),
                _buildMediaButton(
                  Icons.videocam_outlined,
                  Colors.red,
                  () => _showCreatePostDialog(context, mediaType: 'video'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMediaButton(IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: color, size: 20),
      ),
    );
  }

  void _showCreatePostDialog(BuildContext context, {String? mediaType}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.9,
        minChildSize: 0.5,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: _buildCreatePostForm(context, scrollController, mediaType),
        ),
      ),
    );
  }

  Widget _buildCreatePostForm(
    BuildContext context,
    ScrollController scrollController,
    String? mediaType,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              const Text(
                'Créer un post',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Publier',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blue[100],
                child: Text(userName[0].toUpperCase()),
              ),
              const SizedBox(width: 12),
              Text(
                userName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const SizedBox(height: 16),

          const TextField(
            maxLines: 5,
            decoration: InputDecoration(
              hintText: 'Partagez vos pensées...',
              border: InputBorder.none,
            ),
          ),

          if (mediaType != null) ...[
            const SizedBox(height: 16),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      mediaType == 'photo' ? Icons.photo : Icons.videocam,
                      size: 40,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      mediaType == 'photo'
                          ? 'Photo sélectionnée'
                          : 'Vidéo sélectionnée',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ),
          ],

          const Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildPostOption(Icons.photo_outlined, 'Photo', Colors.green),
              _buildPostOption(Icons.videocam_outlined, 'Vidéo', Colors.red),
              _buildPostOption(Icons.location_on_outlined, 'Lieu', Colors.blue),
              _buildPostOption(Icons.mood_outlined, 'Humeur', Colors.orange),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPostOption(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
      ],
    );
  }

  Widget _buildSearchSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Rechercher sur FanRadar...',
                hintStyle: const TextStyle(
                  color: Color(0xFF9CA3AF),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: Container(
                  padding: const EdgeInsets.all(12),
                  child: const Icon(
                    Icons.search_rounded,
                    color: Color(0xFF6366F1),
                    size: 22,
                  ),
                ),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Icon(
                        Icons.tune_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ],
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
              ),
              onChanged: (value) {},
            ),
          ),

          const SizedBox(height: 12),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildQuickSearchChip(
                  '🎵 Musique',
                  const Color(0xFF8B5CF6),
                  true,
                ),
                _buildQuickSearchChip('🎮 Gaming', const Color(0xFF10B981)),
                _buildQuickSearchChip('🎬 Cinéma', const Color(0xFF3B82F6)),
                _buildQuickSearchChip('📚 Manga', const Color(0xFFF59E0B)),
                _buildQuickSearchChip('⚽ Sport', const Color(0xFFEF4444)),
                _buildQuickSearchChip('🎨 Art', const Color(0xFF8B5CF6)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickSearchChip(
    String label,
    Color color, [
    bool isActive = false,
  ]) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isActive ? color : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isActive ? color : const Color(0xFFE5E7EB),
              width: 1,
            ),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: color.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : [],
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.white : const Color(0xFF6B7280),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNewsTodaySection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'News Today',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.red[400]!, Colors.orange[400]!],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'NOUVEAU',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios, size: 12),
                label: const Text('Voir plus'),
                style: TextButton.styleFrom(foregroundColor: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return _buildNewsTodayCard(context, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Posts récents',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return _buildEnhancedPostCard(context, index);
          },
        ),
      ],
    );
  }

  Widget _buildEnhancedPostCard(BuildContext context, int index) {
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
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.blue[300]!, Colors.purple[300]!],
                    ),
                  ),
                  padding: const EdgeInsets.all(2),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Text(
                      users[index][0],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        users[index],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        times[index],
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.more_horiz, color: Colors.grey[400]),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              contents[index],
              style: const TextStyle(fontSize: 14, height: 1.4),
            ),
          ),

          Container(
            margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(Icons.image, size: 60, color: Colors.grey[400]),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    _buildEnhancedActionButton(
                      likedPosts[index] == true
                          ? Icons.favorite
                          : Icons.favorite_border,
                      '${likeCounts[index]}',
                      likedPosts[index] == true
                          ? const Color(0xFFEF4444)
                          : const Color(0xFF6B7280),
                      () {
                        setState(() {
                          if (likedPosts[index] == true) {
                            likedPosts[index] = false;
                            likeCounts[index] = (likeCounts[index]! - 1);
                          } else {
                            likedPosts[index] = true;
                            likeCounts[index] = (likeCounts[index]! + 1);
                          }
                        });
                      },
                      isLiked: likedPosts[index] == true,
                    ),
                    const SizedBox(width: 24),
                    _buildEnhancedActionButton(
                      Icons.chat_bubble_outline_rounded,
                      '${5 + index}',
                      const Color(0xFF3B82F6),
                      () => _showCommentsDialog(context, users[index]),
                    ),
                    const SizedBox(width: 24),
                    _buildEnhancedActionButton(
                      Icons.share_outlined,
                      '${2 + index}',
                      const Color(0xFF10B981),
                      () => _showShareDialog(context),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F4F6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.bookmark_border_rounded,
                        color: Color(0xFF6B7280),
                        size: 20,
                      ),
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

  Widget _buildEnhancedActionButton(
    IconData icon,
    String count,
    Color color,
    VoidCallback onTap, {
    bool isLiked = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isLiked ? color.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              child: Icon(
                icon,
                size: 20,
                color: isLiked ? color : const Color(0xFF6B7280),
              ),
            ),
            const SizedBox(width: 6),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                color: isLiked ? color : const Color(0xFF6B7280),
                fontWeight: isLiked ? FontWeight.w600 : FontWeight.w500,
                fontSize: 14,
              ),
              child: Text(count),
            ),
          ],
        ),
      ),
    );
  }

  void _showShareDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Partager ce post',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildShareOption(
                    Icons.copy,
                    'Copier le lien',
                    const Color(0xFF6B7280),
                  ),
                  _buildShareOption(
                    Icons.message,
                    'Message',
                    const Color(0xFF3B82F6),
                  ),
                  _buildShareOption(
                    Icons.share,
                    'Autres apps',
                    const Color(0xFF10B981),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShareOption(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF6B7280),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  void _showCommentsDialog(BuildContext context, String postAuthor) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.8,
        maxChildSize: 0.9,
        minChildSize: 0.5,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Text(
                      'Commentaires',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return _buildCommentItem(index);
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey[200]!)),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.blue[100],
                      child: Text(
                        userName[0].toUpperCase(),
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Ajouter un commentaire...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send, color: Colors.blue),
                      onPressed: () {},
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
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsDetailPage(newsItem: news),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      (news['categoryColor'] as Color).withOpacity(0.3),
                      (news['categoryColor'] as Color),
                    ],
                  ),
                ),
                child: const Center(
                  child: Icon(Icons.image, size: 40, color: Colors.white),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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

  Widget _buildCommentItem(int index) {
    final comments = [
      {
        'author': 'Marie Dupont',
        'content': 'Super post ! J\'adore cette photo 😍',
        'time': 'il y a 5min',
        'likes': 3,
      },
      {
        'author': 'Thomas Martin',
        'content': 'Merci pour le partage, très inspirant !',
        'time': 'il y a 12min',
        'likes': 1,
      },
      {
        'author': 'Sophie Bernard',
        'content': 'Exactement ce dont j\'avais besoin aujourd\'hui 💪',
        'time': 'il y a 25min',
        'likes': 7,
      },
    ];

    final comment = comments[index];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.blue[100],
            child: Text(
              comment['author']![0].toUpperCase(),
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      comment['author'] as String,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      comment['time'] as String,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(comment['content'] as String),
                const SizedBox(height: 8),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Répondre',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'J\'aime',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
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
}
