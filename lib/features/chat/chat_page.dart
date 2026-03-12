import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_sizes.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import 'chat_detail_page.dart';
import 'data/chat_models.dart';
import 'data/chat_providers.dart';

class ChatsPage extends ConsumerStatefulWidget {
  const ChatsPage({super.key});

  @override
  ConsumerState<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends ConsumerState<ChatsPage> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final async = ref.watch(chatConversationsProvider);
=======
import 'package:roommate_app/features/chat/chat_detail_page.dart';
import 'package:roommate_app/core/theme/app_colors.dart';
import 'package:roommate_app/core/theme/app_sizes.dart';
import 'package:roommate_app/core/theme/app_spacing.dart';
import 'package:roommate_app/core/theme/app_radius.dart';
import 'package:roommate_app/core/theme/app_text_styles.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final chats = [
      _Chat(
        name: "Жанар Муратова",
        last: "Звучит отлично! Когда м...",
        time: "2 мин",
        unread: 2,
        online: true,
        letter: "Ж",
        imagePath: "assets/images/ava1.png",
      ),
      _Chat(
        name: "Нурсултан Куандыков",
        last: "Спасибо за отклик! Я хо...",
        time: "1 ч",
        unread: 1,
        online: false,
        letter: "Н",
        imagePath: "assets/images/ava2.png",
      ),
      _Chat(
        name: "Динара Алимиханова",
        last: "Отлично! Пришло детали с...",
        time: "3 ч",
        unread: 0,
        online: true,
        letter: "Д",
        imagePath: "assets/images/ava3.png",
      ),
      _Chat(
        name: "Айбек Жумабаев",
        last: "Договорились, до связи!",
        time: "1 дн",
        unread: 0,
        online: false,
        letter: "А",
        imagePath: "assets/images/ava6.png",
      ),
      _Chat(
        name: "Екатерина Родина",
        last: "Привет! Рада познакомиться 😊",
        time: "2 дн",
        unread: 0,
        online: false,
        letter: "Е",
        imagePath: "assets/images/ava5.png",
      ),
    ];
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
<<<<<<< HEAD
                  Text('Messages', style: AppTextStyles.title),
=======
                  Text("Сообщения", style: AppTextStyles.title),
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
                  Spacer(),
                  Icon(Icons.more_horiz),
                ],
              ),
              const SizedBox(height: AppSpacing.headerGap),
              Container(
                height: AppSizes.searchHeight,
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                decoration: BoxDecoration(
                  color: AppColors.searchBg,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
<<<<<<< HEAD
                child: Row(
                  children: [
                    const Icon(Icons.search, size: 18, color: Colors.black38),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        onChanged: (_) => setState(() {}),
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                          isCollapsed: true,
=======
                child: const Row(
                  children: [
                    Icon(Icons.search, size: 18, color: Colors.black38),
                    SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Text(
                        "Поиск",
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.searchGap),
              Expanded(
<<<<<<< HEAD
                child: async.when(
                  loading: () => const Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  ),
                  error: (e, _) => Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Failed to load chats\n$e',
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          FilledButton(
                            onPressed: () =>
                                ref.invalidate(chatConversationsProvider),
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  data: (chats) {
                    final query = _searchController.text.trim().toLowerCase();
                    final filtered = chats.where((c) {
                      if (query.isEmpty) return true;
                      return c.peerName.toLowerCase().contains(query) ||
                          (c.lastMessageText ?? '').toLowerCase().contains(query);
                    }).toList();

                    if (filtered.isEmpty) {
                      return const Center(child: Text('No messages yet'));
                    }

                    return RefreshIndicator(
                      onRefresh: () async {
                        ref.invalidate(chatConversationsProvider);
                        await ref.read(chatConversationsProvider.future);
                      },
                      child: ListView.separated(
                        itemCount: filtered.length,
                        separatorBuilder: (_, __) =>
                            const SizedBox(height: AppSpacing.chatItemGap),
                        itemBuilder: (_, i) => _ChatTile(
                          chat: filtered[i],
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ChatDetailPage(
                                  conversationId: filtered[i].id,
                                  title: filtered[i].peerName,
                                  imageUrl: filtered[i].peerAvatarUrl,
                                  letter: _firstLetter(filtered[i].peerName),
                                ),
                              ),
                            );
                            ref.invalidate(chatConversationsProvider);
                          },
                        ),
                      ),
                    );
                  },
=======
                child: ListView.separated(
                  itemCount: chats.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(height: AppSpacing.chatItemGap),
                  itemBuilder: (_, i) => _ChatTile(
                    chat: chats[i],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChatDetailPage(
                            title: chats[i].name,
                            online: chats[i].online,
                            letter: chats[i].letter,
                            imagePath: chats[i].imagePath,
                          ),
                        ),
                      );
                    },
                  ),
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
<<<<<<< HEAD

  String _firstLetter(String s) {
    final t = s.trim();
    if (t.isEmpty) return '?';
    return t.characters.first.toUpperCase();
  }
}

class _ChatTile extends StatelessWidget {
  const _ChatTile({
=======
}

class _Chat {
  final String name, last, time, letter;
  final int unread;
  final bool online;
  final String imagePath;

  _Chat({
    required this.name,
    required this.last,
    required this.time,
    required this.unread,
    required this.online,
    required this.letter,
    required this.imagePath,
  });
}

class _ChatTile extends StatelessWidget {
  final _Chat chat;
  final VoidCallback onTap;

  const _ChatTile({
    super.key,
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
    required this.chat,
    required this.onTap,
  });

<<<<<<< HEAD
  final ChatConversation chat;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final lastText = (chat.lastMessageText ?? '').trim();
    final timeText = _formatTime(chat.lastMessageAt);

=======
  @override
  Widget build(BuildContext context) {
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.lg),
      child: Row(
        children: [
<<<<<<< HEAD
          CircleAvatar(
            radius: AppSizes.avatarRadius,
            backgroundColor: const Color(0xFFE5E7EB),
            backgroundImage:
                chat.peerAvatarUrl != null ? NetworkImage(chat.peerAvatarUrl!) : null,
            child: chat.peerAvatarUrl == null
                ? Text(
                    _firstLetter(chat.peerName),
                    style: const TextStyle(
                      color: Color(0xFF001561),
                      fontWeight: FontWeight.w700,
                    ),
                  )
                : null,
=======
          Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: AppSizes.avatarRadius,
                backgroundImage: AssetImage(chat.imagePath),
              ),
              Positioned(
                right: -1,
                bottom: -1,
                child: Container(
                  width: AppSizes.onlineDot,
                  height: AppSizes.onlineDot,
                  decoration: BoxDecoration(
                    color: chat.online ? AppColors.online : AppColors.offline,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
          ),
          const SizedBox(width: AppSpacing.avatarToTextGap),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
<<<<<<< HEAD
                Text(chat.peerName, style: AppTextStyles.name),
                const SizedBox(height: AppSpacing.nameToLastGap),
                Text(
                  lastText.isEmpty ? 'Start conversation' : lastText,
=======
                Text(chat.name, style: AppTextStyles.name),
                const SizedBox(height: AppSpacing.nameToLastGap),
                Text(
                  chat.last,
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.secondary12,
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.rightColumnGap),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
<<<<<<< HEAD
              Text(timeText, style: AppTextStyles.secondary12),
              const SizedBox(height: AppSpacing.timeToBadgeGap),
              if (chat.unreadCount > 0)
=======
              Text(chat.time, style: AppTextStyles.secondary12),
              const SizedBox(height: AppSpacing.timeToBadgeGap),
              if (chat.unread > 0)
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
                Container(
                  width: AppSizes.unreadBadge,
                  height: AppSizes.unreadBadge,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius:
                        BorderRadius.circular(AppSizes.unreadBadge / 2),
                  ),
                  child: Text(
<<<<<<< HEAD
                    '${chat.unreadCount}',
=======
                    "${chat.unread}",
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
<<<<<<< HEAD

  static String _firstLetter(String s) {
    final t = s.trim();
    if (t.isEmpty) return '?';
    return t.characters.first.toUpperCase();
  }

  static String _formatTime(DateTime? dt) {
    if (dt == null) return '';
    final now = DateTime.now();
    if (dt.year == now.year && dt.month == now.month && dt.day == now.day) {
      final h = dt.hour.toString().padLeft(2, '0');
      final m = dt.minute.toString().padLeft(2, '0');
      return '$h:$m';
    }
    return '${dt.day.toString().padLeft(2, '0')}.${dt.month.toString().padLeft(2, '0')}';
  }
=======
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
}
