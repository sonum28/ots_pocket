import 'package:equatable/equatable.dart';
import 'package:ots_pocket/models/user_registration_model.dart';

class UserEvent extends Equatable {
  @override
  List<Object?> get props => [];

  const UserEvent();
}

class UserRegistrationEvent extends UserEvent {
  final UserRegistration userDetails;
  UserRegistrationEvent({required this.userDetails});
}

class GetUserDetailsEvent extends UserEvent{}