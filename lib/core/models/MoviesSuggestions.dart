import 'package:movie_app/core/models/MovieList.dart';

class MoviesSuggestions {
  MoviesSuggestions({
      this.status, 
      this.statusMessage, 
      this.data, 
      this.meta,});

  MoviesSuggestions.fromJson(dynamic json) {
    status = json['status'];
    statusMessage = json['status_message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    meta = json['@meta'] != null ? Meta.fromJson(json['@meta']) : null;
  }
  String? status;
  String? statusMessage;
  Data? data;
  Meta? meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['status_message'] = statusMessage;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    if (meta != null) {
      map['@meta'] = meta?.toJson();
    }
    return map;
  }

}


class Meta {
  Meta({
      this.serverTime, 
      this.serverTimezone, 
      this.apiVersion, 
      this.executionTime,});

  Meta.fromJson(dynamic json) {
    serverTime = json['server_time'];
    serverTimezone = json['server_timezone'];
    apiVersion = json['api_version'];
    executionTime = json['execution_time'];
  }
  int? serverTime;
  String? serverTimezone;
  int? apiVersion;
  String? executionTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['server_time'] = serverTime;
    map['server_timezone'] = serverTimezone;
    map['api_version'] = apiVersion;
    map['execution_time'] = executionTime;
    return map;
  }

}

/// movie_count : 0
/// movies : [{"id":503,"url":"https://yts.mx/movies/blade-runner-1982","imdb_code":"tt0083658","title":"Blade Runner","title_english":"Blade Runner","title_long":"Blade Runner (1982)","slug":"blade-runner-1982","year":1982,"rating":8.1,"runtime":117,"genres":["Action","Drama","Mystery","Sci-Fi","Thriller"],"summary":"In the early twenty-first century, the Tyrell Corporation, during what was called the Nexus phase, developed robots, called \"replicants\", that were supposed to aid society, the replicants which looked and acted like humans. When the superhuman generation Nexus 6 replicants, used for dangerous off-Earth endeavors, began a mutiny on an off-Earth colony, replicants became illegal on Earth. Police units, called \"blade runners\", have the job of destroying - or in their parlance \"retiring\" - any replicant that makes its way back to or created on Earth, with anyone convicted of aiding or assisting a replicant being sentenced to death. It's now November, 2019 in Los Angeles, California. Rick Deckard, a former blade runner, is called out of retirement when four known replicants, most combat models, have made their way back to Earth, with their leader being Roy Batty. One, Leon Kowalski, tried to infiltrate his way into the Tyrell Corporation as an employee, but has since been able to escape. Beyond following Leon's trail in hopes of finding and retiring them all, Deckard believes part of what will help him is figuring out what the replicants wanted with the Tyrell Corporation in trying to infiltrate it. The answer may lie with Tyrell's fail-safe backup mechanism. Beyond tracking the four, Deckard faces a possible dilemma in encountering a fifth replicant: Rachael, who works as Tyrell's assistant. The issue is that Dr. Elden Tyrell is experimenting with her, to provide her with fake memories so as to be able to better control her. With those memories, Rachael has no idea that she is not human. The problem is not only Rachael's assistance to Deckard, but that he is beginning to develop feelings for her.—Huggo","description_full":"In the early twenty-first century, the Tyrell Corporation, during what was called the Nexus phase, developed robots, called \"replicants\", that were supposed to aid society, the replicants which looked and acted like humans. When the superhuman generation Nexus 6 replicants, used for dangerous off-Earth endeavors, began a mutiny on an off-Earth colony, replicants became illegal on Earth. Police units, called \"blade runners\", have the job of destroying - or in their parlance \"retiring\" - any replicant that makes its way back to or created on Earth, with anyone convicted of aiding or assisting a replicant being sentenced to death. It's now November, 2019 in Los Angeles, California. Rick Deckard, a former blade runner, is called out of retirement when four known replicants, most combat models, have made their way back to Earth, with their leader being Roy Batty. One, Leon Kowalski, tried to infiltrate his way into the Tyrell Corporation as an employee, but has since been able to escape. Beyond following Leon's trail in hopes of finding and retiring them all, Deckard believes part of what will help him is figuring out what the replicants wanted with the Tyrell Corporation in trying to infiltrate it. The answer may lie with Tyrell's fail-safe backup mechanism. Beyond tracking the four, Deckard faces a possible dilemma in encountering a fifth replicant: Rachael, who works as Tyrell's assistant. The issue is that Dr. Elden Tyrell is experimenting with her, to provide her with fake memories so as to be able to better control her. With those memories, Rachael has no idea that she is not human. The problem is not only Rachael's assistance to Deckard, but that he is beginning to develop feelings for her.—Huggo","synopsis":"In the early twenty-first century, the Tyrell Corporation, during what was called the Nexus phase, developed robots, called \"replicants\", that were supposed to aid society, the replicants which looked and acted like humans. When the superhuman generation Nexus 6 replicants, used for dangerous off-Earth endeavors, began a mutiny on an off-Earth colony, replicants became illegal on Earth. Police units, called \"blade runners\", have the job of destroying - or in their parlance \"retiring\" - any replicant that makes its way back to or created on Earth, with anyone convicted of aiding or assisting a replicant being sentenced to death. It's now November, 2019 in Los Angeles, California. Rick Deckard, a former blade runner, is called out of retirement when four known replicants, most combat models, have made their way back to Earth, with their leader being Roy Batty. One, Leon Kowalski, tried to infiltrate his way into the Tyrell Corporation as an employee, but has since been able to escape. Beyond following Leon's trail in hopes of finding and retiring them all, Deckard believes part of what will help him is figuring out what the replicants wanted with the Tyrell Corporation in trying to infiltrate it. The answer may lie with Tyrell's fail-safe backup mechanism. Beyond tracking the four, Deckard faces a possible dilemma in encountering a fifth replicant: Rachael, who works as Tyrell's assistant. The issue is that Dr. Elden Tyrell is experimenting with her, to provide her with fake memories so as to be able to better control her. With those memories, Rachael has no idea that she is not human. The problem is not only Rachael's assistance to Deckard, but that he is beginning to develop feelings for her.—Huggo","yt_trailer_code":"qoEyZoOTtss","language":"en","mpa_rating":"","background_image":"https://yts.mx/assets/images/movies/Blade_Runner_1982/background.jpg","background_image_original":"https://yts.mx/assets/images/movies/Blade_Runner_1982/background.jpg","small_cover_image":"https://yts.mx/assets/images/movies/Blade_Runner_1982/small-cover.jpg","medium_cover_image":"https://yts.mx/assets/images/movies/Blade_Runner_1982/medium-cover.jpg","state":"ok","torrents":[{"url":"https://yts.mx/torrent/download/3A1281BC8E91DA65D5DCF511EE82BCD7DA518333","hash":"3A1281BC8E91DA65D5DCF511EE82BCD7DA518333","quality":"720p","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":0,"peers":0,"size":"702.41 MB","size_bytes":736530268,"date_uploaded":"2015-10-31 22:02:10","date_uploaded_unix":1446325330},{"url":"https://yts.mx/torrent/download/46378EA47454427D4D2B7A7A0D903F1E3B5732F2","hash":"46378EA47454427D4D2B7A7A0D903F1E3B5732F2","quality":"1080p","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":100,"peers":20,"size":"1.91 GB","size_bytes":2050846884,"date_uploaded":"2019-01-08 09:58:51","date_uploaded_unix":1546937931},{"url":"https://yts.mx/torrent/download/795B07711DC643000DDEDAB501DC92916C87D825","hash":"795B07711DC643000DDEDAB501DC92916C87D825","quality":"2160p","is_repack":"0","video_codec":"x265","bit_depth":"10","audio_channels":"5.1","seeds":100,"peers":18,"size":"5.6 GB","size_bytes":6012954214,"date_uploaded":"2022-04-28 22:49:42","date_uploaded_unix":1651178982}],"date_uploaded":"2015-10-31 22:02:10","date_uploaded_unix":1446325330},{"id":576,"url":"https://yts.mx/movies/bring-it-on-2000","imdb_code":"tt0204946","title":"Bring It On","title_english":"Bring It On","title_long":"Bring It On (2000)","slug":"bring-it-on-2000","year":2000,"rating":6.2,"runtime":98,"genres":["Action","Comedy","Romance","Sport"],"summary":"Torrance Shipman has been chosen to lead the Rancho Carne High cheer team in Big Red's place. Aaron thinks that Torrance can't lead the team to the championships, but she is determined to prove her so-called boyfriend wrong. During practice, Carver gets injured and she must find another teammate. Torrance picks Missy Pantone to take Carver's place, due to her athletic prowess. Missy soon notices the moves her team are performing during the game actually belongs to the Clovers, a rival high school she attended years ago. The Clovers team is lead by Isis, who is hell-bent on defeating Rancho Carne Toros. It is soon discovered that Big Red is responsible for stealing the Clovers' cheer routine by filming their moves secretly and claiming them as their original routine, causing Torrance to make a new cheerleading performance so they can qualify for the upcoming national championships. Torrance soon develops a romantic attraction for Cliff Pantone, an aspiring musician and Missy's brother.—dawsonpersi","description_full":"Torrance Shipman has been chosen to lead the Rancho Carne High cheer team in Big Red's place. Aaron thinks that Torrance can't lead the team to the championships, but she is determined to prove her so-called boyfriend wrong. During practice, Carver gets injured and she must find another teammate. Torrance picks Missy Pantone to take Carver's place, due to her athletic prowess. Missy soon notices the moves her team are performing during the game actually belongs to the Clovers, a rival high school she attended years ago. The Clovers team is lead by Isis, who is hell-bent on defeating Rancho Carne Toros. It is soon discovered that Big Red is responsible for stealing the Clovers' cheer routine by filming their moves secretly and claiming them as their original routine, causing Torrance to make a new cheerleading performance so they can qualify for the upcoming national championships. Torrance soon develops a romantic attraction for Cliff Pantone, an aspiring musician and Missy's brother.—dawsonpersi","synopsis":"Torrance Shipman has been chosen to lead the Rancho Carne High cheer team in Big Red's place. Aaron thinks that Torrance can't lead the team to the championships, but she is determined to prove her so-called boyfriend wrong. During practice, Carver gets injured and she must find another teammate. Torrance picks Missy Pantone to take Carver's place, due to her athletic prowess. Missy soon notices the moves her team are performing during the game actually belongs to the Clovers, a rival high school she attended years ago. The Clovers team is lead by Isis, who is hell-bent on defeating Rancho Carne Toros. It is soon discovered that Big Red is responsible for stealing the Clovers' cheer routine by filming their moves secretly and claiming them as their original routine, causing Torrance to make a new cheerleading performance so they can qualify for the upcoming national championships. Torrance soon develops a romantic attraction for Cliff Pantone, an aspiring musician and Missy's brother.—dawsonpersi","yt_trailer_code":"4Fza-ZDQE6c","language":"en","mpa_rating":"","background_image":"https://yts.mx/assets/images/movies/Bring_It_On_2000/background.jpg","background_image_original":"https://yts.mx/assets/images/movies/Bring_It_On_2000/background.jpg","small_cover_image":"https://yts.mx/assets/images/movies/Bring_It_On_2000/small-cover.jpg","medium_cover_image":"https://yts.mx/assets/images/movies/Bring_It_On_2000/medium-cover.jpg","state":"ok","torrents":[{"url":"https://yts.mx/torrent/download/9F338DB25D36452A6FD345F796AAA1012F6E2922","hash":"9F338DB25D36452A6FD345F796AAA1012F6E2922","quality":"720p","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":33,"peers":8,"size":"757.74 MB","size_bytes":794547978,"date_uploaded":"2015-10-31 22:12:42","date_uploaded_unix":1446325962},{"url":"https://yts.mx/torrent/download/30EDD3BDB0713F60F8254A498C749B8C82C55BB2","hash":"30EDD3BDB0713F60F8254A498C749B8C82C55BB2","quality":"1080p","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":0,"peers":0,"size":"1.44 GB","size_bytes":1546188227,"date_uploaded":"2015-10-31 22:12:46","date_uploaded_unix":1446325966},{"url":"https://yts.mx/torrent/download/F3BF1ED69652A00FD241BAA086C9D5CD87CF58D3","hash":"F3BF1ED69652A00FD241BAA086C9D5CD87CF58D3","quality":"2160p","is_repack":"0","video_codec":"x265","bit_depth":"10","audio_channels":"5.1","seeds":46,"peers":18,"size":"4.45 GB","size_bytes":4778151117,"date_uploaded":"2025-07-15 22:03:06","date_uploaded_unix":1752609786}],"date_uploaded":"2015-10-31 22:12:42","date_uploaded_unix":1446325962},{"id":8543,"url":"https://yts.mx/movies/risky-business-1983","imdb_code":"tt0086200","title":"Risky Business","title_english":"Risky Business","title_long":"Risky Business (1983)","slug":"risky-business-1983","year":1983,"rating":6.8,"runtime":99,"genres":["Action","Comedy","Crime","Drama","Romance"],"summary":"Trustworthy son Joel Goodsen, an industrious, college-bound Chicago high school senior struggling to live up to his parents' expectations, has more than enough on his plate. But when mum and dad go off on vacation, the inexperienced teenager seizes the golden opportunity to live a little: Joel breaks one rule after another, indulging his wide-eyed curiosity and unspoken desires. And now, there's no turning back--Joel's risky business has already thrown his life into complete disarray. What happens if Joel's parents return home earlier than expected? Will Joel learn a thing or two about life, consequences, and love?—Nick Riganas","description_full":"Trustworthy son Joel Goodsen, an industrious, college-bound Chicago high school senior struggling to live up to his parents' expectations, has more than enough on his plate. But when mum and dad go off on vacation, the inexperienced teenager seizes the golden opportunity to live a little: Joel breaks one rule after another, indulging his wide-eyed curiosity and unspoken desires. And now, there's no turning back--Joel's risky business has already thrown his life into complete disarray. What happens if Joel's parents return home earlier than expected? Will Joel learn a thing or two about life, consequences, and love?—Nick Riganas","synopsis":"Trustworthy son Joel Goodsen, an industrious, college-bound Chicago high school senior struggling to live up to his parents' expectations, has more than enough on his plate. But when mum and dad go off on vacation, the inexperienced teenager seizes the golden opportunity to live a little: Joel breaks one rule after another, indulging his wide-eyed curiosity and unspoken desires. And now, there's no turning back--Joel's risky business has already thrown his life into complete disarray. What happens if Joel's parents return home earlier than expected? Will Joel learn a thing or two about life, consequences, and love?—Nick Riganas","yt_trailer_code":"zPZafey1fyk","language":"en","mpa_rating":"","background_image":"https://yts.mx/assets/images/movies/risky_business_1983/background.jpg","background_image_original":"https://yts.mx/assets/images/movies/risky_business_1983/background.jpg","small_cover_image":"https://yts.mx/assets/images/movies/risky_business_1983/small-cover.jpg","medium_cover_image":"https://yts.mx/assets/images/movies/risky_business_1983/medium-cover.jpg","state":"ok","torrents":[{"url":"https://yts.mx/torrent/download/842B2388CADFE9539988741EF88B12AD733AD415","hash":"842B2388CADFE9539988741EF88B12AD733AD415","quality":"720p","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":18,"peers":3,"size":"838.02 MB","size_bytes":878727660,"date_uploaded":"2018-08-09 12:26:40","date_uploaded_unix":1533810400},{"url":"https://yts.mx/torrent/download/C2AE423C9F6300D063CF83CDACD06C941DE7F5C8","hash":"C2AE423C9F6300D063CF83CDACD06C941DE7F5C8","quality":"1080p","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":67,"peers":3,"size":"1.58 GB","size_bytes":1696512082,"date_uploaded":"2018-08-09 14:48:54","date_uploaded_unix":1533818934},{"url":"https://yts.mx/torrent/download/636E894D67A22FC3819094FE3BE164DB891D797B","hash":"636E894D67A22FC3819094FE3BE164DB891D797B","quality":"2160p","is_repack":"0","video_codec":"x265","bit_depth":"10","audio_channels":"5.1","seeds":27,"peers":3,"size":"4.45 GB","size_bytes":4778151117,"date_uploaded":"2024-07-31 02:49:35","date_uploaded_unix":1722386975}],"date_uploaded":"2018-08-09 12:26:40","date_uploaded_unix":1533810400},{"id":27549,"url":"https://yts.mx/movies/swept-away-1974","imdb_code":"tt0073817","title":"Swept Away","title_english":"Swept Away","title_long":"Swept Away (1974)","slug":"swept-away-1974","year":1974,"rating":7.5,"runtime":114,"genres":["Action","Adventure","Comedy","Drama"],"summary":"A rich woman, Raffaella, and some friends rent a yacht to sail the Mediterranean Sea during summer. The sailor, Gennarino, who is a communist, does not like this woman but has to bear with her bad mood. One day she wakes up late in the afternoon and asks to be taken to land where everyone had gone earlier. Gennarino sets up a boat but during the trip, the boat breaks down. They spend the night in the middle of the sea.—Michel Rudoy","description_full":"A rich woman, Raffaella, and some friends rent a yacht to sail the Mediterranean Sea during summer. The sailor, Gennarino, who is a communist, does not like this woman but has to bear with her bad mood. One day she wakes up late in the afternoon and asks to be taken to land where everyone had gone earlier. Gennarino sets up a boat but during the trip, the boat breaks down. They spend the night in the middle of the sea.—Michel Rudoy","synopsis":"A rich woman, Raffaella, and some friends rent a yacht to sail the Mediterranean Sea during summer. The sailor, Gennarino, who is a communist, does not like this woman but has to bear with her bad mood. One day she wakes up late in the afternoon and asks to be taken to land where everyone had gone earlier. Gennarino sets up a boat but during the trip, the boat breaks down. They spend the night in the middle of the sea.—Michel Rudoy","yt_trailer_code":"3rz8zh7tBro","language":"it","mpa_rating":"","background_image":"https://yts.mx/assets/images/movies/swept_away_1974/background.jpg","background_image_original":"https://yts.mx/assets/images/movies/swept_away_1974/background.jpg","small_cover_image":"https://yts.mx/assets/images/movies/swept_away_1974/small-cover.jpg","medium_cover_image":"https://yts.mx/assets/images/movies/swept_away_1974/medium-cover.jpg","state":"ok","torrents":[{"url":"https://yts.mx/torrent/download/EFC7DFF8F087B5EC2D7E3979552904DF65203C5F","hash":"EFC7DFF8F087B5EC2D7E3979552904DF65203C5F","quality":"720p","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":2,"peers":1,"size":"1.02 GB","size_bytes":1095216660,"date_uploaded":"2021-02-18 03:59:33","date_uploaded_unix":1613617173},{"url":"https://yts.mx/torrent/download/BD8A257B69D69B06A62A09681BC3E1B23DDEE7DD","hash":"BD8A257B69D69B06A62A09681BC3E1B23DDEE7DD","quality":"1080p","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":17,"peers":2,"size":"1.9 GB","size_bytes":2040109466,"date_uploaded":"2021-02-18 05:27:49","date_uploaded_unix":1613622469}],"date_uploaded":"2021-02-18 03:59:33","date_uploaded_unix":1613617173}]

class Data {
  Data({
      this.movieCount, 
      this.movies,});

  Data.fromJson(dynamic json) {
    movieCount = json['movie_count'];
    if (json['movies'] != null) {
      movies = [];
      json['movies'].forEach((v) {
        movies?.add(Movies.fromJson(v));
      });
    }
  }
  int? movieCount;
  List<Movies>? movies;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['movie_count'] = movieCount;
    if (movies != null) {
      map['movies'] = movies?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}





/// url : "https://yts.mx/torrent/download/3A1281BC8E91DA65D5DCF511EE82BCD7DA518333"
/// hash : "3A1281BC8E91DA65D5DCF511EE82BCD7DA518333"
/// quality : "720p"
/// is_repack : "0"
/// video_codec : "x264"
/// bit_depth : "8"
/// audio_channels : "2.0"
/// seeds : 0
/// peers : 0
/// size : "702.41 MB"
/// size_bytes : 736530268
/// date_uploaded : "2015-10-31 22:02:10"
/// date_uploaded_unix : 1446325330

class Torrents {
  Torrents({
      this.url, 
      this.hash, 
      this.quality, 
      this.isRepack, 
      this.videoCodec, 
      this.bitDepth, 
      this.audioChannels, 
      this.seeds, 
      this.peers, 
      this.size, 
      this.sizeBytes, 
      this.dateUploaded, 
      this.dateUploadedUnix,});

  Torrents.fromJson(dynamic json) {
    url = json['url'];
    hash = json['hash'];
    quality = json['quality'];
    isRepack = json['is_repack'];
    videoCodec = json['video_codec'];
    bitDepth = json['bit_depth'];
    audioChannels = json['audio_channels'];
    seeds = json['seeds'];
    peers = json['peers'];
    size = json['size'];
    sizeBytes = json['size_bytes'];
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];
  }
  String? url;
  String? hash;
  String? quality;
  String? isRepack;
  String? videoCodec;
  String? bitDepth;
  String? audioChannels;
  int? seeds;
  int? peers;
  String? size;
  int? sizeBytes;
  String? dateUploaded;
  int? dateUploadedUnix;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['hash'] = hash;
    map['quality'] = quality;
    map['is_repack'] = isRepack;
    map['video_codec'] = videoCodec;
    map['bit_depth'] = bitDepth;
    map['audio_channels'] = audioChannels;
    map['seeds'] = seeds;
    map['peers'] = peers;
    map['size'] = size;
    map['size_bytes'] = sizeBytes;
    map['date_uploaded'] = dateUploaded;
    map['date_uploaded_unix'] = dateUploadedUnix;
    return map;
  }

}