import "dart:convert";

QueryUserPlist queryUserPlistFromJson(String str) =>
    QueryUserPlist.fromJson(json.decode(str));

String queryUserPlistToJson(QueryUserPlist data) => json.encode(data.toJson());

class QueryUserPlist {
  String version;
  bool more;
  List<Playlist> playlist;
  int code;

  QueryUserPlist({
    required this.version,
    required this.more,
    required this.playlist,
    required this.code,
  });

  factory QueryUserPlist.fromJson(Map<String, dynamic> json) => QueryUserPlist(
        version: json["version"],
        more: json["more"],
        playlist: List<Playlist>.from(
            json["playlist"].map((x) => Playlist.fromJson(x))),
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "version": version,
        "more": more,
        "playlist": List<dynamic>.from(playlist.map((x) => x.toJson())),
        "code": code,
      };
}

class Playlist {
  List<dynamic> subscribers;
  bool subscribed;
  Creator creator;
  dynamic artists;
  dynamic tracks;
  bool top;
  String? updateFrequency;
  double backgroundCoverId;
  String? backgroundCoverUrl;
  double titleImage;
  String? titleImageUrl;
  String? englishTitle;
  bool opRecommend;
  RecommendInfo? recommendInfo;
  int subscribedCount;
  int cloudTrackCount;
  int userId;
  int totalDuration;
  double coverImgId;
  int privacy;
  int trackUpdateTime;
  int trackCount;
  int updateTime;
  String commentThreadId;
  String coverImgUrl;
  int specialType;
  bool anonimous;
  int createTime;
  bool highQuality;
  bool newImported;
  int trackNumberUpdateTime;
  int playCount;
  int adType;
  String? description;
  List<String> tags;
  bool ordered;
  int status;
  String name;
  int id;
  String? coverImgIdStr;
  List<SharedUser>? sharedUsers;
  dynamic shareStatus;
  bool copied;

  Playlist({
    required this.subscribers,
    required this.subscribed,
    required this.creator,
    required this.artists,
    required this.tracks,
    required this.top,
    required this.updateFrequency,
    required this.backgroundCoverId,
    required this.backgroundCoverUrl,
    required this.titleImage,
    required this.titleImageUrl,
    required this.englishTitle,
    required this.opRecommend,
    required this.recommendInfo,
    required this.subscribedCount,
    required this.cloudTrackCount,
    required this.userId,
    required this.totalDuration,
    required this.coverImgId,
    required this.privacy,
    required this.trackUpdateTime,
    required this.trackCount,
    required this.updateTime,
    required this.commentThreadId,
    required this.coverImgUrl,
    required this.specialType,
    required this.anonimous,
    required this.createTime,
    required this.highQuality,
    required this.newImported,
    required this.trackNumberUpdateTime,
    required this.playCount,
    required this.adType,
    required this.description,
    required this.tags,
    required this.ordered,
    required this.status,
    required this.name,
    required this.id,
    required this.coverImgIdStr,
    required this.sharedUsers,
    required this.shareStatus,
    required this.copied,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) => Playlist(
        subscribers: List<dynamic>.from(json["subscribers"].map((x) => x)),
        subscribed: json["subscribed"],
        creator: Creator.fromJson(json["creator"]),
        artists: json["artists"],
        tracks: json["tracks"],
        top: json["top"],
        updateFrequency: json["updateFrequency"],
        backgroundCoverId: json["backgroundCoverId"]?.toDouble(),
        backgroundCoverUrl: json["backgroundCoverUrl"],
        titleImage: json["titleImage"]?.toDouble(),
        titleImageUrl: json["titleImageUrl"],
        englishTitle: json["englishTitle"],
        opRecommend: json["opRecommend"],
        recommendInfo: json["recommendInfo"] == null
            ? null
            : RecommendInfo.fromJson(json["recommendInfo"]),
        subscribedCount: json["subscribedCount"],
        cloudTrackCount: json["cloudTrackCount"],
        userId: json["userId"],
        totalDuration: json["totalDuration"],
        coverImgId: json["coverImgId"]?.toDouble(),
        privacy: json["privacy"],
        trackUpdateTime: json["trackUpdateTime"],
        trackCount: json["trackCount"],
        updateTime: json["updateTime"],
        commentThreadId: json["commentThreadId"],
        coverImgUrl: json["coverImgUrl"],
        specialType: json["specialType"],
        anonimous: json["anonimous"],
        createTime: json["createTime"],
        highQuality: json["highQuality"],
        newImported: json["newImported"],
        trackNumberUpdateTime: json["trackNumberUpdateTime"],
        playCount: json["playCount"],
        adType: json["adType"],
        description: json["description"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        ordered: json["ordered"],
        status: json["status"],
        name: json["name"],
        id: json["id"],
        coverImgIdStr: json["coverImgId_str"],
        sharedUsers: json["sharedUsers"] == null
            ? []
            : List<SharedUser>.from(
                json["sharedUsers"]!.map((x) => SharedUser.fromJson(x))),
        shareStatus: json["shareStatus"],
        copied: json["copied"],
      );

  Map<String, dynamic> toJson() => {
        "subscribers": List<dynamic>.from(subscribers.map((x) => x)),
        "subscribed": subscribed,
        "creator": creator.toJson(),
        "artists": artists,
        "tracks": tracks,
        "top": top,
        "updateFrequency": updateFrequency,
        "backgroundCoverId": backgroundCoverId,
        "backgroundCoverUrl": backgroundCoverUrl,
        "titleImage": titleImage,
        "titleImageUrl": titleImageUrl,
        "englishTitle": englishTitle,
        "opRecommend": opRecommend,
        "recommendInfo": recommendInfo?.toJson(),
        "subscribedCount": subscribedCount,
        "cloudTrackCount": cloudTrackCount,
        "userId": userId,
        "totalDuration": totalDuration,
        "coverImgId": coverImgId,
        "privacy": privacy,
        "trackUpdateTime": trackUpdateTime,
        "trackCount": trackCount,
        "updateTime": updateTime,
        "commentThreadId": commentThreadId,
        "coverImgUrl": coverImgUrl,
        "specialType": specialType,
        "anonimous": anonimous,
        "createTime": createTime,
        "highQuality": highQuality,
        "newImported": newImported,
        "trackNumberUpdateTime": trackNumberUpdateTime,
        "playCount": playCount,
        "adType": adType,
        "description": description,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "ordered": ordered,
        "status": status,
        "name": name,
        "id": id,
        "coverImgId_str": coverImgIdStr,
        "sharedUsers": sharedUsers == null
            ? []
            : List<dynamic>.from(sharedUsers!.map((x) => x.toJson())),
        "shareStatus": shareStatus,
        "copied": copied,
      };
}

class Creator {
  bool defaultAvatar;
  int province;
  int authStatus;
  bool followed;
  String avatarUrl;
  int accountStatus;
  int gender;
  int city;
  int birthday;
  int userId;
  int userType;
  String nickname;
  String signature;
  String description;
  String detailDescription;
  double avatarImgId;
  double backgroundImgId;
  String backgroundUrl;
  int authority;
  bool mutual;
  List<String>? expertTags;
  Map<String, String>? experts;
  int djStatus;
  int vipType;
  dynamic remarkName;
  int authenticationTypes;
  dynamic avatarDetail;
  String avatarImgIdStr;
  String backgroundImgIdStr;
  bool anchor;
  String creatorAvatarImgIdStr;

  Creator({
    required this.defaultAvatar,
    required this.province,
    required this.authStatus,
    required this.followed,
    required this.avatarUrl,
    required this.accountStatus,
    required this.gender,
    required this.city,
    required this.birthday,
    required this.userId,
    required this.userType,
    required this.nickname,
    required this.signature,
    required this.description,
    required this.detailDescription,
    required this.avatarImgId,
    required this.backgroundImgId,
    required this.backgroundUrl,
    required this.authority,
    required this.mutual,
    required this.expertTags,
    required this.experts,
    required this.djStatus,
    required this.vipType,
    required this.remarkName,
    required this.authenticationTypes,
    required this.avatarDetail,
    required this.avatarImgIdStr,
    required this.backgroundImgIdStr,
    required this.anchor,
    required this.creatorAvatarImgIdStr,
  });

  factory Creator.fromJson(Map<String, dynamic> json) => Creator(
        defaultAvatar: json["defaultAvatar"],
        province: json["province"],
        authStatus: json["authStatus"],
        followed: json["followed"],
        avatarUrl: json["avatarUrl"],
        accountStatus: json["accountStatus"],
        gender: json["gender"],
        city: json["city"],
        birthday: json["birthday"],
        userId: json["userId"],
        userType: json["userType"],
        nickname: json["nickname"],
        signature: json["signature"],
        description: json["description"],
        detailDescription: json["detailDescription"],
        avatarImgId: json["avatarImgId"]?.toDouble(),
        backgroundImgId: json["backgroundImgId"]?.toDouble(),
        backgroundUrl: json["backgroundUrl"],
        authority: json["authority"],
        mutual: json["mutual"],
        expertTags: json["expertTags"] == null
            ? []
            : List<String>.from(json["expertTags"]!.map((x) => x)),
        experts: Map.from(json["experts"]!)
            .map((k, v) => MapEntry<String, String>(k, v)),
        djStatus: json["djStatus"],
        vipType: json["vipType"],
        remarkName: json["remarkName"],
        authenticationTypes: json["authenticationTypes"],
        avatarDetail: json["avatarDetail"],
        avatarImgIdStr: json["avatarImgIdStr"],
        backgroundImgIdStr: json["backgroundImgIdStr"],
        anchor: json["anchor"],
        creatorAvatarImgIdStr: json["avatarImgId_str"],
      );

  Map<String, dynamic> toJson() => {
        "defaultAvatar": defaultAvatar,
        "province": province,
        "authStatus": authStatus,
        "followed": followed,
        "avatarUrl": avatarUrl,
        "accountStatus": accountStatus,
        "gender": gender,
        "city": city,
        "birthday": birthday,
        "userId": userId,
        "userType": userType,
        "nickname": nickname,
        "signature": signature,
        "description": description,
        "detailDescription": detailDescription,
        "avatarImgId": avatarImgId,
        "backgroundImgId": backgroundImgId,
        "backgroundUrl": backgroundUrl,
        "authority": authority,
        "mutual": mutual,
        "expertTags": expertTags == null
            ? []
            : List<dynamic>.from(expertTags!.map((x) => x)),
        "experts":
            Map.from(experts!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "djStatus": djStatus,
        "vipType": vipType,
        "remarkName": remarkName,
        "authenticationTypes": authenticationTypes,
        "avatarDetail": avatarDetail,
        "avatarImgIdStr": avatarImgIdStr,
        "backgroundImgIdStr": backgroundImgIdStr,
        "anchor": anchor,
        "avatarImgId_str": creatorAvatarImgIdStr,
      };
}

class RecommendInfo {
  String alg;
  String logInfo;

  RecommendInfo({
    required this.alg,
    required this.logInfo,
  });

  factory RecommendInfo.fromJson(Map<String, dynamic> json) => RecommendInfo(
        alg: json["alg"],
        logInfo: json["logInfo"],
      );

  Map<String, dynamic> toJson() => {
        "alg": alg,
        "logInfo": logInfo,
      };
}

class SharedUser {
  int userId;

  SharedUser({
    required this.userId,
  });

  factory SharedUser.fromJson(Map<String, dynamic> json) => SharedUser(
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
      };
}
