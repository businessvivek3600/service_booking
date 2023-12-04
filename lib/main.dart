import 'package:firebase_app_check/firebase_app_check.dart';

import '/app_theme.dart';
import '/locale/app_localizations.dart';
import '/locale/language_en.dart';
import '/locale/languages.dart';
import '/model/booking_detail_model.dart';
import '/model/get_my_post_job_list_response.dart';
import '/model/material_you_model.dart';
import '/model/notification_model.dart';
import '/model/provider_info_response.dart';
import '/model/remote_config_data_model.dart';
import '/model/service_data_model.dart';
import '/model/service_detail_response.dart';
import '/model/user_data_model.dart';
import '/model/user_wallet_history.dart';
import '/screens/blog/model/blog_detail_response.dart';
import '/screens/blog/model/blog_response_model.dart';
import '/screens/splash_screen.dart';
import '/services/auth_services.dart';
import '/services/chat_services.dart';
import '/services/user_services.dart';
import '/store/app_store.dart';
import '/store/filter_store.dart';
import '/utils/colors.dart';
import '/utils/common.dart';
import '/utils/configs.dart';
import '/utils/constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import 'model/booking_data_model.dart';
import 'model/booking_status_model.dart';
import 'model/category_model.dart';
import 'model/dashboard_model.dart';

//region Mobx Stores
AppStore appStore = AppStore();
FilterStore filterStore = FilterStore();
//endregion

//region Global Variables
BaseLanguage language = LanguageEn();
//endregion

//region Services
UserService userService = UserService();
AuthService authService = AuthService();
ChatServices chatServices = ChatServices();
RemoteConfigDataModel remoteConfigDataModel = RemoteConfigDataModel();
//endregion

//region Cached Response Variables for Dashboard Tabs
DashboardResponse? cachedDashboardResponse;
List<BookingData>? cachedBookingList;
List<CategoryData>? cachedCategoryList;
List<BookingStatusResponse>? cachedBookingStatusDropdown;
List<PostJobData>? cachedPostJobList;
List<WalletDataElement>? cachedWalletHistoryList;

List<ServiceData>? cachedServiceFavList;
List<UserData>? cachedProviderFavList;
List<BlogData>? cachedBlogList;
List<RatingData>? cachedRatingList;
List<NotificationData>? cachedNotificationList;
List<(int blogId, BlogDetailResponse list)?> cachedBlogDetail = [];
List<(int serviceId, ServiceDetailResponse list)?> listOfCachedData = [];
List<(int providerId, ProviderInfoResponse list)?> cachedProviderList = [];
List<(int categoryId, List<CategoryData> list)?> cachedSubcategoryList = [];
List<(int bookingId, BookingDetailResponse list)?> cachedBookingDetailList = [];
//endregion

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  passwordLengthGlobal = 6;
  appButtonBackgroundColorGlobal = primaryColor;
  defaultAppButtonTextColorGlobal = Colors.white;
  defaultRadius = 12;
  defaultBlurRadius = 0;
  defaultSpreadRadius = 0;
  textSecondaryColorGlobal = appTextPrimaryColor;
  textPrimaryColorGlobal = appTextSecondaryColor;
  defaultAppButtonElevation = 0;
  pageRouteTransitionDurationGlobal = 400.milliseconds;
  textBoldSizeGlobal = 14;
  textPrimarySizeGlobal = 14;
  textSecondarySizeGlobal = 12;

  await initialize();
  localeLanguageList = languageList();

  ///firebase
  Firebase.initializeApp().then((value) async {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    await FirebaseAppCheck.instance.activate(
      webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
      androidProvider: AndroidProvider.debug,
      appleProvider: AppleProvider.deviceCheck,
    );
    setupFirebaseRemoteConfig();
  });

  ///check for login
  await appStore.setLoggedIn(getBoolAsync(IS_LOGGED_IN), isInitializing: true);

  ///check for theme mode
  int themeModeIndex =
      getIntAsync(THEME_MODE_INDEX, defaultValue: THEME_MODE_SYSTEM);
  if (themeModeIndex == THEME_MODE_LIGHT) {
    appStore.setDarkMode(false);
  } else if (themeModeIndex == THEME_MODE_DARK) {
    appStore.setDarkMode(true);
  }

  ///check for material you theme
  await appStore.setUseMaterialYouTheme(getBoolAsync(USE_MATERIAL_YOU_THEME),
      isInitializing: true);

  ///initialize user data
  if (appStore.isLoggedIn) {
    await appStore.setUserId(getIntAsync(USER_ID), isInitializing: true);
    await appStore.setFirstName(getStringAsync(FIRST_NAME),
        isInitializing: true);
    await appStore.setLastName(getStringAsync(LAST_NAME), isInitializing: true);
    await appStore.setUserEmail(getStringAsync(USER_EMAIL),
        isInitializing: true);
    await appStore.setUserName(getStringAsync(USERNAME), isInitializing: true);
    await appStore.setContactNumber(getStringAsync(CONTACT_NUMBER),
        isInitializing: true);
    await appStore.setUserProfile(getStringAsync(PROFILE_IMAGE),
        isInitializing: true);
    await appStore.setCountryId(getIntAsync(COUNTRY_ID), isInitializing: true);
    await appStore.setStateId(getIntAsync(STATE_ID), isInitializing: true);
    await appStore.setCityId(getIntAsync(COUNTRY_ID), isInitializing: true);
    await appStore.setUId(getStringAsync(UID), isInitializing: true);
    await appStore.setToken(getStringAsync(TOKEN), isInitializing: true);
    await appStore.setAddress(getStringAsync(ADDRESS), isInitializing: true);
    await appStore.setCurrencyCode(getStringAsync(CURRENCY_COUNTRY_CODE),
        isInitializing: true);
    await appStore.setCurrencyCountryId(getStringAsync(CURRENCY_COUNTRY_ID),
        isInitializing: true);
    await appStore.setCurrencySymbol(getStringAsync(CURRENCY_COUNTRY_SYMBOL),
        isInitializing: true);
    await appStore.setPrivacyPolicy(getStringAsync(PRIVACY_POLICY),
        isInitializing: true);
    await appStore.setLoginType(getStringAsync(LOGIN_TYPE),
        isInitializing: true);
    await appStore.setPlayerId(getStringAsync(PLAYERID), isInitializing: true);
    await appStore.setTermConditions(getStringAsync(TERM_CONDITIONS),
        isInitializing: true);
    await appStore.setInquiryEmail(getStringAsync(INQUIRY_EMAIL),
        isInitializing: true);
    await appStore.setHelplineNumber(getStringAsync(HELPLINE_NUMBER),
        isInitializing: true);
    await appStore.setEnableUserWallet(getBoolAsync(ENABLE_USER_WALLET),
        isInitializing: true);
  }

  ///run app
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RestartAppWidget(
      child: Observer(
        builder: (_) => FutureBuilder<Color>(
          future: getMaterialYouData(),
          builder: (_, snap) {
            return Observer(
              builder: (_) => MaterialApp(
                debugShowCheckedModeBanner: false,
                navigatorKey: navigatorKey,
                home: SplashScreen(),
                theme: AppTheme.lightTheme(color: snap.data),
                darkTheme: AppTheme.darkTheme(color: snap.data),
                themeMode:
                    appStore.isDarkMode ? ThemeMode.dark : ThemeMode.light,
                title: APP_NAME,
                supportedLocales: LanguageDataModel.languageLocales(),
                localizationsDelegates: const [
                  AppLocalizations(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                localeResolutionCallback: (locale, supportedLocales) => locale,
                locale: Locale(appStore.selectedLanguageCode),
              ),
            );
          },
        ),
      ),
    );
  }
}
