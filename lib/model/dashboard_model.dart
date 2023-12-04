import '/model/category_model.dart';
import '/model/user_data_model.dart';

import 'booking_data_model.dart';
import 'country_list_model.dart';
import 'service_data_model.dart';

class DashboardResponse {
  List<CategoryData>? category;
  List<UserData>? provider;
  List<ServiceData>? service;
  List<ServiceData>? featuredServices;
  List<SliderModel>? slider;
  List<DashboardCustomerReview>? dashboardCustomerReview;
  bool? status;
  BookingData? bookingData;
  List<BookingData>? upcomingData;
  List<Configuration>? configurations;
  int? notificationUnreadCount;
  Configuration? privacyPolicy;
  AppDownload? appDownload;
  Configuration? termConditions;
  String? inquiryEmail;
  String? helplineNumber;
  List<LanguageOption>? languageOption;
  String? isAdvancedPaymentAllowed;
  bool? enableUserWallet;
  GeneralSettingModel? generalSetting;

  DashboardResponse({
    this.category,
    this.featuredServices,
    this.provider,
    this.service,
    this.slider,
    this.status,
    this.dashboardCustomerReview,
    this.bookingData,
    this.upcomingData,
    this.configurations,
    this.notificationUnreadCount,
    this.privacyPolicy,
    this.appDownload,
    this.termConditions,
    this.inquiryEmail,
    this.helplineNumber,
    this.languageOption,
    this.isAdvancedPaymentAllowed,
    this.enableUserWallet,
    this.generalSetting,
  });

  factory DashboardResponse.fromJson(Map<String, dynamic> json) {
    return DashboardResponse(
      category: json['category'] != null
          ? (json['category'] as List)
              .map((i) => CategoryData.fromJson(i))
              .toList()
          : null,
      provider: json['provider'] != null
          ? (json['provider'] as List).map((i) => UserData.fromJson(i)).toList()
          : null,
      service: json['service'] != null
          ? (json['service'] as List)
              .map((i) => ServiceData.fromJson(i))
              .toList()
          : null,
      featuredServices: json['featured_service'] != null
          ? (json['featured_service'] as List)
              .map((i) => ServiceData.fromJson(i))
              .toList()
          : null,
      slider: json['slider'] != null
          ? (json['slider'] as List)
              .map((i) => SliderModel.fromJson(i))
              .toList()
          : null,
      dashboardCustomerReview: json['customer_review'] != null
          ? (json['customer_review'] as List)
              .map((i) => DashboardCustomerReview.fromJson(i))
              .toList()
          : null,
      status: json['status'],
      bookingData: json['booking_data'] != null
          ? BookingData.fromJson(json['booking_data'])
          : null,
      upcomingData: json['upcomming_booking'] != null
          ? (json['upcomming_booking'] as List)
              .map((i) => BookingData.fromJson(i))
              .toList()
          : null,
      configurations: json['configurations'] != null
          ? (json['configurations'] as List)
              .map((i) => Configuration.fromJson(i))
              .toList()
          : null,
      notificationUnreadCount: json['notification_unread_count'],
      privacyPolicy: json['privacy_policy'] != null
          ? Configuration.fromJson(json['privacy_policy'])
          : null,
      appDownload: json['app_download'] != null
          ? AppDownload.fromJson(json['app_download'])
          : null,
      termConditions: json['term_conditions'] != null
          ? Configuration.fromJson(json['term_conditions'])
          : null,
      generalSetting: json['generalsetting'] != null
          ? GeneralSettingModel.fromJson(json['generalsetting'])
          : null,
      inquiryEmail: json['inquriy_email'],
      helplineNumber: json['helpline_number'],
      languageOption: json['language_option'] != null
          ? (json['language_option'] as List)
              .map((i) => LanguageOption.fromJson(i))
              .toList()
          : null,
      isAdvancedPaymentAllowed: json['is_advanced_payment_allowed'],
      enableUserWallet: json['enable_user_wallet'] == '1',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (category != null) {
      data['category'] = category!.map((v) => v.toJson()).toList();
    }
    if (provider != null) {
      data['provider'] = provider!.map((v) => v.toJson()).toList();
    }
    if (service != null) {
      data['service'] = service!.map((v) => v.toJson()).toList();
    }
    if (featuredServices != null) {
      data['featured_service'] = service!.map((v) => v.toJson()).toList();
    }
    if (slider != null) {
      data['slider'] = slider!.map((v) => v.toJson()).toList();
    }
    if (dashboardCustomerReview != null) {
      data['customer_review'] =
          dashboardCustomerReview!.map((v) => v.toJson()).toList();
    }
    if (upcomingData != null) {
      data['upcomming_booking'] = upcomingData!.map((v) => v.toJson()).toList();
    }
    if (configurations != null) {
      data['configurations'] = configurations!.map((v) => v.toJson()).toList();
    }

    if (privacyPolicy != null) {
      data['privacy_policy'] = privacyPolicy;
    }
    if (appDownload != null) {
      data['app_download'] = appDownload;
    }
    if (termConditions != null) {
      data['term_conditions'] = termConditions;
    }
    if (generalSetting != null) {
      data['generalsetting'] = generalSetting;
    }
    data['inquriy_email'] = inquiryEmail;
    data['helpline_number'] = helplineNumber;

    if (languageOption != null) {
      data['language_option'] = languageOption!.map((v) => v.toJson()).toList();
    }

    data['is_advanced_payment_allowed'] = isAdvancedPaymentAllowed;
    data['enable_user_wallet'] = enableUserWallet;

    return data;
  }
}

class SliderModel {
  String? description;
  int? id;
  String? serviceName;
  String? sliderImage;
  int? status;
  String? title;
  String? type;
  int? typeId;

  SliderModel({
    this.description,
    this.id,
    this.serviceName,
    this.sliderImage,
    this.status,
    this.title,
    this.type,
    this.typeId,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      description: json['description'],
      id: json['id'],
      serviceName: json['service_name'],
      sliderImage: json['slider_image'],
      status: json['status'],
      title: json['title'],
      type: json['type'],
      typeId: json['type_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['id'] = id;
    data['service_name'] = serviceName;
    data['slider_image'] = sliderImage;
    data['status'] = status;
    data['title'] = title;
    data['type'] = type;
    data['type_id'] = typeId;
    return data;
  }
}

class DashboardCustomerReview {
  List<String>? attchments;
  int? bookingId;
  String? createdAt;
  int? customerId;
  String? customerName;
  int? id;
  String? profileImage;
  num? rating;
  String? review;
  int? serviceId;
  String? serviceName;

  DashboardCustomerReview(
      {this.attchments,
      this.bookingId,
      this.createdAt,
      this.customerId,
      this.customerName,
      this.id,
      this.profileImage,
      this.rating,
      this.review,
      this.serviceId,
      this.serviceName});

  factory DashboardCustomerReview.fromJson(Map<String, dynamic> json) {
    return DashboardCustomerReview(
      attchments: json['attchments'] != null
          ? List<String>.from(json['attchments'])
          : null,
      bookingId: json['booking_id'],
      createdAt: json['created_at'],
      customerId: json['customer_id'],
      customerName: json['customer_name'],
      id: json['id'],
      profileImage: json['profile_image'],
      rating: json['rating'],
      review: json['review'],
      serviceId: json['service_id'],
      serviceName: json['service_name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['booking_id'] = bookingId;
    data['created_at'] = createdAt;
    data['customer_id'] = customerId;
    data['customer_name'] = customerName;
    data['id'] = id;
    data['profile_image'] = profileImage;
    data['rating'] = rating;
    data['review'] = review;
    data['service_id'] = serviceId;
    data['service_name'] = serviceName;
    if (attchments != null) {
      data['attchments'] = attchments;
    }
    return data;
  }
}

class Configuration {
  CountryListResponse? country;
  int? id;
  String? key;
  String? type;
  String? value;

  Configuration({this.country, this.id, this.key, this.type, this.value});

  factory Configuration.fromJson(Map<String, dynamic> json) {
    return Configuration(
      country: json['country'] != null
          ? CountryListResponse.fromJson(json['country'])
          : null,
      id: json['id'],
      key: json['key'],
      type: json['type'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['key'] = key;
    data['type'] = type;
    data['value'] = value;
    if (country != null) {
      data['country'] = country!.toJson();
    }
    return data;
  }
}

class LanguageOption {
  String? flagImage;
  String? id;
  String? title;

  LanguageOption({this.flagImage, this.id, this.title});

  factory LanguageOption.fromJson(Map<String, dynamic> json) {
    return LanguageOption(
      flagImage: json['flag_image'],
      id: json['id'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['flag_image'] = flagImage;
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}

class AppDownload {
  String? appstore_url;
  String? created_at;
  String? description;
  int? id;
  String? playstore_url;
  String? provider_appstore_url;
  String? provider_playstore_url;
  String? title;
  String? updated_at;

  AppDownload({
    this.appstore_url,
    this.created_at,
    this.description,
    this.id,
    this.playstore_url,
    this.provider_appstore_url,
    this.provider_playstore_url,
    this.title,
    this.updated_at,
  });

  factory AppDownload.fromJson(Map<String, dynamic> json) {
    return AppDownload(
      appstore_url: json['appstore_url'],
      created_at: json['created_at'],
      description: json['description'],
      id: json['id'],
      playstore_url: json['playstore_url'],
      provider_appstore_url: json['provider_appstore_url'],
      provider_playstore_url: json['provider_playstore_url'],
      title: json['title'],
      updated_at: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appstore_url'] = appstore_url;
    data['created_at'] = created_at;
    data['description'] = description;
    data['id'] = id;
    data['playstore_url'] = playstore_url;
    data['provider_appstore_url'] = provider_appstore_url;
    data['provider_playstore_url'] = provider_playstore_url;
    data['title'] = title;
    data['updated_at'] = updated_at;
    return data;
  }
}

class GeneralSettingModel {
  String? earningType;
  String? facebookUrl;
  String? helplineNumber;
  String? inquriyEmail;
  String? instagramUrl;
  List<String>? languageOption;
  String? linkedinUrl;
  String? rememberToken;
  String? siteCopyright;
  String? siteDescription;
  String? siteEmail;
  String? siteFavicon;
  String? siteLogo;
  String? siteName;
  String? timeZone;
  String? twitterUrl;
  String? youtubeUrl;

  GeneralSettingModel({
    this.earningType,
    this.facebookUrl,
    this.helplineNumber,
    this.inquriyEmail,
    this.instagramUrl,
    this.languageOption,
    this.linkedinUrl,
    this.rememberToken,
    this.siteCopyright,
    this.siteDescription,
    this.siteEmail,
    this.siteFavicon,
    this.siteLogo,
    this.siteName,
    this.timeZone,
    this.twitterUrl,
    this.youtubeUrl,
  });

  factory GeneralSettingModel.fromJson(Map<String, dynamic> json) {
    return GeneralSettingModel(
      earningType: json['earning_type'],
      facebookUrl: json['facebook_url'],
      helplineNumber: json['helpline_number'],
      inquriyEmail: json['inquriy_email'],
      instagramUrl: json['instagram_url'],
      linkedinUrl: json['linkedin_url'],
      //rememberToken: json['remember_token'],
      siteCopyright: json['site_copyright'],
      siteDescription: json['site_description'],
      //siteEmail: json['site_email'],
      //siteFavicon: json['site_favicon'],
      siteLogo: json['site_logo'],
      //siteName: json['site_name'],
      //timeZone: json['time_zone'],
      twitterUrl: json['twitter_url'],
      youtubeUrl: json['youtube_url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['earning_type'] = earningType;
    data['facebook_url'] = facebookUrl;
    data['helpline_number'] = helplineNumber;
    data['inquriy_email'] = inquriyEmail;
    data['instagram_url'] = instagramUrl;
    data['linkedin_url'] = linkedinUrl;
    data['remember_token'] = rememberToken;
    data['site_copyright'] = siteCopyright;
    data['site_description'] = siteDescription;
    data['site_email'] = siteEmail;
    data['site_favicon'] = siteFavicon;
    data['site_logo'] = siteLogo;
    data['site_name'] = siteName;
    data['time_zone'] = timeZone;
    data['twitter_url'] = twitterUrl;
    data['youtube_url'] = youtubeUrl;
    if (languageOption != null) {
      data['language_option'] = languageOption;
    }
    return data;
  }
}
