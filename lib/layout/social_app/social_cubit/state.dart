abstract class SocialStates{}


class  SocialInitialState extends SocialStates{}

class  SocialGetUserLoadingState extends SocialStates{}
class  SocialGetUserSuccessfulState extends SocialStates{}
class  SocialGetUserErrorState extends SocialStates{

  final String error;

  SocialGetUserErrorState(this.error);
}

class  SocialChangeBottomNav extends SocialStates{}
class  SocialNewPostState extends SocialStates{}


class  SocialUpdateProfileImageSuccessfulState extends SocialStates{}
class  SocialUpdateProfileImageErrorState extends SocialStates{}

class  SocialUpdateCoverImageSuccessfulState extends SocialStates{}
class  SocialUpdateCoverImageErrorState extends SocialStates{}


class  SocialUploadProfileImageSuccessfulState extends SocialStates{}
class  SocialUploadProfileImageErrorState extends SocialStates{}


class  SocialUploadCoverImageSuccessfulState extends SocialStates{}
class  SocialUploadCoverImageErrorState extends SocialStates{}

class  SocialUpdateUserDataErrorState extends SocialStates{}

class  SocialUpdateUserDataLoadingState extends SocialStates{}


class  SocialCreatePostLoadingState extends SocialStates{}
class  SocialCreatePostSuccessfulState extends SocialStates{}
class  SocialCreatePostErrorState extends SocialStates{}


class SocialPostImagePickedSuccessfulState extends SocialStates{}
class SocialPostImagePickedErrorState extends SocialStates{}

class SocialRemovePostImageState extends SocialStates{}

class  SocialGetPostLoadingState extends SocialStates{}
class  SocialGetPostSuccessfulState extends SocialStates{}
class  SocialGetPostErrorState extends SocialStates{
  final String error;

  SocialGetPostErrorState(this.error);
}

class  SocialLikePostSuccessfulState extends SocialStates{}
class  SocialLikePostErrorState extends SocialStates{}


class  SocialCommentPostSuccessfulState extends SocialStates{}
class  SocialCommentPostErrorState extends SocialStates{}

class  SocialGetAllUserLoadingState extends SocialStates{}
class  SocialGetAllUserSuccessfulState extends SocialStates{}
class  SocialGetAllUserErrorState extends SocialStates{
  final String error;

  SocialGetAllUserErrorState(this.error);
}


class  SocialSendMessageSuccessfulState extends SocialStates{}
class  SocialSendMessageErrorState extends SocialStates{}

class  SocialGetMessageSuccessfulState extends SocialStates{}
