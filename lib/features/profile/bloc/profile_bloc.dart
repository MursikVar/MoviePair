import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_pair/features/profile/bloc/profile_event.dart';
import 'package:movie_pair/features/profile/bloc/profile_state.dart';
import 'package:movie_pair/features/profile/model/profile_model.dart';
import 'package:movie_pair/features/profile/model/profile_statistics.dart';
import 'package:movie_pair/features/profile/repos/profile_repository.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _profileRepository;

  ProfileBloc({required ProfileRepository profileRepository}) : _profileRepository = profileRepository, super(ProfileState.initial()) {
    on<Load>((event, emit) async {
      emit (ProfileState.loading());
      try{
        final result = await Future.wait([_profileRepository.getUserInfo(), _profileRepository.getUserStatistics()]);
        final profile = result[0] as ProfileModel;
        final profileStatistics = result[1] as ProfileStatistics;

        emit (ProfileState.loaded(profile: profile, profileStatistics: profileStatistics));
      }
      catch (e){
        emit (ProfileState.error(e.toString()));
      }
    });
  }
}