
import 'package:flutter/material.dart';

// Page de détails de news
class NewsDetailPage extends StatefulWidget {
  final Map<String, dynamic> newsItem;

  const NewsDetailPage({super.key, required this.newsItem});

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  bool isLiked = false;
  bool isBookmarked = false;
  int likeCount = 0;
  int commentCount = 0;
  bool isFollowingAuthor = false;
  
  @override
  void initState() {
    super.initState();
    // Parse initial values from newsItem
    String likesStr = widget.newsItem['likes'].toString();
    if (likesStr.contains('K')) {
      double value = double.parse(likesStr.replaceAll('K', '').replaceAll(',', '.'));
      likeCount = (value * 1000).toInt();
    } else {
      likeCount = int.tryParse(likesStr) ?? 0;
    }
    
    String commentsStr = widget.newsItem['comments'].toString();
    if (commentsStr.contains('K')) {
      double value = double.parse(commentsStr.replaceAll('K', '').replaceAll(',', '.'));
      commentCount = (value * 1000).toInt();
    } else {
      commentCount = int.tryParse(commentsStr) ?? 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // App Bar avec image
          _buildSliverAppBar(),
          
          // Contenu principal
          SliverToBoxAdapter(
            child: Column(
              children: [
                _buildNewsContent(),
                _buildAuthorSection(),
                _buildActionSection(),
                _buildSimilarNewsSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            icon: const Icon(Icons.share_outlined, color: Colors.white, size: 20),
            onPressed: () => _showShareDialog(context),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            icon: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () {
              setState(() {
                isBookmarked = !isBookmarked;
              });
            },
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Image de fond
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    (widget.newsItem['categoryColor'] as Color).withOpacity(0.3),
                    (widget.newsItem['categoryColor'] as Color),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Icon(
                  _getCategoryIcon(widget.newsItem['category']),
                  size: 80,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ),
            
            // Overlay gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                  stops: const [0.5, 1.0],
                ),
              ),
            ),
            
            // Breaking news badge
            if (widget.newsItem['isBreaking'] == true)
              Positioned(
                top: 100,
                left: 20,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEF4444),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFEF4444).withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.flash_on, color: Colors.white, size: 16),
                      SizedBox(width: 4),
                      Text(
                        'BREAKING',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'K-pop':
        return Icons.music_note;
      case 'Anime':
        return Icons.animation;
      case 'Cinema':
        return Icons.movie;
      case 'Gaming':
        return Icons.sports_esports;
      case 'Pop':
        return Icons.queue_music;
      case 'Manga':
        return Icons.book;
      default:
        return Icons.article;
    }
  }

  Widget _buildNewsContent() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Catégorie et temps
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: (widget.newsItem['categoryColor'] as Color).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  widget.newsItem['category'],
                  style: TextStyle(
                    color: widget.newsItem['categoryColor'] as Color,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  const Icon(Icons.access_time, size: 14, color: Color(0xFF9CA3AF)),
                  const SizedBox(width: 4),
                  Text(
                    'il y a ${widget.newsItem['time']}',
                    style: const TextStyle(
                      color: Color(0xFF9CA3AF),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Titre
          Text(
            widget.newsItem['title'],
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              height: 1.3,
              color: Color(0xFF1F2937),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Description étendue
          Text(
            widget.newsItem['description'],
            style: const TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Color(0xFF4B5563),
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Contenu détaillé (simulé)
          _buildDetailedContent(),
        ],
      ),
    );
  }

  Widget _buildDetailedContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Analyse approfondie',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F2937),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Cette nouvelle marque un tournant important dans l\'industrie. Les experts s\'accordent à dire que cet événement aura des répercussions significatives sur l\'ensemble du secteur.\n\n'
          'Les fans du monde entier ont réagi avec enthousiasme à cette annonce, créant une vague de discussions sur les réseaux sociaux. Les tendances montrent un engagement sans précédent de la communauté.\n\n'
          'Cette évolution s\'inscrit dans une dynamique plus large de transformation digitale qui touche tous les aspects de l\'industrie du divertissement.',
          style: TextStyle(
            fontSize: 15,
            height: 1.7,
            color: Color(0xFF4B5563),
          ),
        ),
        
        const SizedBox(height: 24),
        
        // Tags
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _buildTags(),
        ),
      ],
    );
  }

  List<Widget> _buildTags() {
    final tags = _getTagsForCategory(widget.newsItem['category']);
    return tags.map((tag) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Text(
        '#$tag',
        style: const TextStyle(
          color: Color(0xFF6B7280),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    )).toList();
  }

  List<String> _getTagsForCategory(String category) {
    switch (category) {
      case 'K-pop':
        return ['BTS', 'MTV', 'Awards', 'Music'];
      case 'Anime':
        return ['AttackOnTitan', 'MAPPA', 'Animation', 'Manga'];
      case 'Cinema':
        return ['Marvel', 'FantasticFour', 'Superhero', 'MCU'];
      case 'Gaming':
        return ['LoL', 'Esports', 'Championship', 'Gaming'];
      case 'Pop':
        return ['TaylorSwift', 'Music', 'Pop', 'Charts'];
      case 'Manga':
        return ['OnePiece', 'Manga', 'Oda', 'Bestseller'];
      default:
        return ['News', 'Trending', 'FanRadar'];
    }
  }

  Widget _buildAuthorSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
              ),
            ),
            padding: const EdgeInsets.all(2),
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.white,
              child: Text(
                widget.newsItem['author'][0],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF6366F1),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.newsItem['author'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF1F2937),
                  ),
                ),
                Text(
                  'Journaliste ${widget.newsItem['category']}',
                  style: const TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isFollowingAuthor = !isFollowingAuthor;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: isFollowingAuthor ? const Color(0xFFE5E7EB) : const Color(0xFF6366F1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                isFollowingAuthor ? 'Suivi' : 'Suivre',
                style: TextStyle(
                  color: isFollowingAuthor ? const Color(0xFF6B7280) : Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionSection() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              _buildDetailActionButton(
                isLiked ? Icons.favorite : Icons.favorite_border,
                '$likeCount',
                const Color(0xFFEF4444),
                () {
                  setState(() {
                    if (isLiked) {
                      likeCount--;
                    } else {
                      likeCount++;
                    }
                    isLiked = !isLiked;
                  });
                },
                isActive: isLiked,
              ),
              const SizedBox(width: 24),
              _buildDetailActionButton(
                Icons.chat_bubble_outline_rounded,
                '$commentCount',
                const Color(0xFF3B82F6),
                () => _showCommentsDialog(context),
              ),
              const SizedBox(width: 24),
              _buildDetailActionButton(
                Icons.share_outlined,
                'Partager',
                const Color(0xFF10B981),
                () => _showShareDialog(context),
              ),
              const Spacer(),
              _buildDetailActionButton(
                Icons.report_outlined,
                '',
                const Color(0xFF9CA3AF),
                () => _showReportDialog(context),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Barre de stats
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatItem('Vues', widget.newsItem['likes']),
                Container(width: 1, height: 20, color: const Color(0xFFE5E7EB)),
                _buildStatItem('Partages', '${(likeCount * 0.1).toInt()}'),
                Container(width: 1, height: 20, color: const Color(0xFFE5E7EB)),
                _buildStatItem('Saves', '${(likeCount * 0.05).toInt()}'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailActionButton(IconData icon, String label, Color color, VoidCallback onTap, {bool isActive = false}) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? color.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: isActive ? color : const Color(0xFF6B7280), size: 20),
            if (label.isNotEmpty) ...[
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  color: isActive ? color : const Color(0xFF6B7280),
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Color(0xFF1F2937),
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF9CA3AF),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildSimilarNewsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              const Text(
                'Articles similaires',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Voir tout',
                  style: TextStyle(
                    color: Color(0xFF6366F1),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 16),
        
        SizedBox(
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: _getSimilarNews().length,
            itemBuilder: (context, index) {
              return _buildSimilarNewsCard(_getSimilarNews()[index]);
            },
          ),
        ),
        
        const SizedBox(height: 24),
      ],
    );
  }

  List<Map<String, dynamic>> _getSimilarNews() {
    // Retourne une liste de news similaires
    return [
      {
        'title': 'Nouvelle collaboration K-pop annoncée',
        'description': 'Les fans sont en effervescence suite à cette annonce surprise.',
        'category': widget.newsItem['category'],
        'time': '1h',
        'author': 'Music News',
        'likes': '23.4K',
        'comments': '4.1K',
        'categoryColor': widget.newsItem['categoryColor'],
        'isBreaking': false,
      },
      {
        'title': 'Interview exclusive avec les artistes',
        'description': 'Découvrez les coulisses de cette production exceptionnelle.',
        'category': widget.newsItem['category'],
        'time': '3h',
        'author': 'Entertainment Weekly',
        'likes': '18.7K',
        'comments': '2.8K',
        'categoryColor': widget.newsItem['categoryColor'],
        'isBreaking': false,
      },
    ];
  }

  Widget _buildSimilarNewsCard(Map<String, dynamic> news) {
    return Container(
      width: 260,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image placeholder
              Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      (news['categoryColor'] as Color).withOpacity(0.3),
                      (news['categoryColor'] as Color),
                    ],
                  ),
                ),
                child: Center(
                  child: Icon(
                    _getCategoryIcon(news['category']),
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
              
              const SizedBox(height: 12),
              
              // Category
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: (news['categoryColor'] as Color).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  news['category'],
                  style: TextStyle(
                    color: news['categoryColor'] as Color,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              
              const SizedBox(height: 8),
              
              // Title
              Text(
                news['title'],
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              
              const SizedBox(height: 4),
              
              // Description
              Text(
                news['description'],
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                  height: 1.3,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              
              const Spacer(),
              
              // Stats
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'il y a ${news['time']}',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey[500],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.favorite_border, size: 12, color: Colors.red[400]),
                      const SizedBox(width: 2),
                      Text(
                        news['likes'],
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
                  _buildShareOption(Icons.copy, 'Copier le lien', const Color(0xFF6B7280)),
                  _buildShareOption(Icons.message, 'Message', const Color(0xFF3B82F6)),
                  _buildShareOption(Icons.share, 'Autres apps', const Color(0xFF10B981)),
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

  void _showCommentsDialog(BuildContext context) {
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
              // Handle
              Container(
                margin: const EdgeInsets.only(top: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              
              // Header
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Text(
                      'Commentaires',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              
              // Comments List
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 3,
                  itemBuilder: (context, index) => _buildCommentItem(index),
                ),
              ),
              
              // Add Comment
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
                      child: const Text('A', style: TextStyle(fontSize: 12)),
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

  Widget _buildCommentItem(int index) {
    final commentAuthors = ['Sophie L.', 'Marc D.', 'Julie R.'];
    final comments = [
      'Magnifique photo ! 😍',
      'Félicitations pour ce beau projet !',
      'Tu as l\'air de passer un super moment !',
    ];
    final commentTimes = ['il y a 1h', 'il y a 3h', 'il y a 5h'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.grey[300],
            child: Text(commentAuthors[index][0], style: const TextStyle(fontSize: 12)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        commentAuthors[index],
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      const SizedBox(height: 4),
                      Text(comments[index], style: const TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      commentTimes[index],
                      style: TextStyle(color: Colors.grey[500], fontSize: 12),
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Répondre',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Icon(Icons.favorite_border, size: 16, color: Colors.grey[400]),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showReportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Signaler ce contenu'),
        content: const Text('Voulez-vous signaler ce contenu comme inapproprié ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Contenu signalé')),
              );
            },
            child: const Text('Signaler'),
          ),
        ],
      ),
    );
  }
}