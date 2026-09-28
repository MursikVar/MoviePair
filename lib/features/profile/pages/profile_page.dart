import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_pair/features/profile/bloc/profile_bloc.dart';
import 'package:movie_pair/features/profile/bloc/profile_event.dart';
import 'package:movie_pair/features/profile/bloc/profile_state.dart';
import 'package:movie_pair/features/profile/model/profile_model.dart';
import 'package:movie_pair/features/profile/model/profile_statistics.dart';
import 'package:movie_pair/features/profile/pages/widgets/statistic_card.dart';
import 'package:movie_pair/features/profile/pages/widgets/text_style_user_info.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    context.read<ProfileBloc>().add(ProfileEvent.load());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0e1014),
        title: Text(
          "Профиль",
          style: TextStyle(
            color: Color(0xFFf5f5f7),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/settings');
            },
            icon: Icon(Icons.settings),
            color: Color(0xFFf5f5f7),
          ),
        ],
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return state.when(
            initial: () => SizedBox(),
            loading: () => Center(
              child: CircularProgressIndicator(color: Color(0xFFff6b6b)),
            ),
            loaded: (profile, profileStatistics) =>
                _buildContext(profile, profileStatistics),
            error: (error) => Center(
              child: Text(
                'Упс, кажется ошибка $error',
                style: TextStyle(color: Color(0xFFf5f5f7)),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContext(
    ProfileModel profile,
    ProfileStatistics profileStatistics,
  ) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<ProfileBloc>().add(ProfileEvent.refreshUserInfo());
        await context.read<ProfileBloc>().stream.firstWhere(
          (state) => state is! Loaded,
        );
      },
      child: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF1b1e25),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Имя', style: TextStyleUserInfo().discriptionText()),
                  SizedBox(height: 5),
                  Text(
                    profile.userName,
                    style: TextStyleUserInfo().userInfoText(22),
                  ),

                  SizedBox(height: 15),
                  Divider(color: Color(0xFF2e323c)),
                  SizedBox(height: 15),
                  Text('Логин', style: TextStyleUserInfo().discriptionText()),
                  Row(
                    children: [
                      Text(
                        profile.login,
                        style: TextStyleUserInfo().userInfoText(15),
                      ),
                      SizedBox(width: 8),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: profile.emailVerified
                              ? Color.fromRGBO(102, 217, 191, 0.3)
                              : Color.fromRGBO(255, 209, 102, 0.16),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (profile.emailVerified)
                              Icon(
                                Icons.check_rounded,
                                color: Color(0xFF66d9bf),
                                size: 11,
                              ),
                            SizedBox(width: 4),
                            Text(
                              profile.emailVerified
                                  ? 'Подтверждена'
                                  : 'Не подтверждена',
                              style: TextStyle(
                                color: profile.emailVerified
                                    ? Color(0xFF66d9bf)
                                    : Color(0xFFffd166),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (profile.emailVerified == false) ...[
                    SizedBox(height: 20),
                    Text(
                      'Мы отправим код на этот адрес, чтобы подтвердить его.',
                      style: TextStyleUserInfo().discriptionText(),
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            '/email-verificated',
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0XFFff6b6b),
                          foregroundColor: Color(0xFF0f0f14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(16),
                          ),
                        ),
                        child: Text(
                          'Подтвердить почту',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                statisticCard(
                  'Списки',
                  profileStatistics.listsCount.toString(),
                ),
                SizedBox(width: 12),
                statisticCard(
                  'Фильмы',
                  profileStatistics.moviesCount.toString(),
                ),
                SizedBox(width: 12),
                statisticCard(
                  'Прсмотрено',
                  profileStatistics.watchedCount.toString(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
