// arkenfox overrides
user_pref("browser.cache.disk.enable", true);
user_pref("browser.startup.page", 3);
user_pref("browser.urlbar.suggest.engines", false);
user_pref("browser.urlbar.suggest.topsites", false);
user_pref("dom.security.https_only_mode_send_http_background_request", true);
user_pref("extensions.formautofill.addresses.enabled", false);
user_pref("extensions.formautofill.creditCards.enabled", false);
user_pref("extensions.webextensions.restrictedDomains", "");
user_pref("network.auth.subresource-http-auth-allow", 0);
user_pref("network.trr.mode", 3);
user_pref("network.trr.uri", "https://firefox.dns.nextdns.io/");
user_pref("privacy.antitracking.enableWebcompat", false);
user_pref("signon.formlessCapture.enabled", true);

// non-arkenfox hardening
user_pref("security.certerrors.permanentOverride", false);

// various UI/UX prefs
user_pref("browser.compactmode.show", true);
user_pref("browser.preferences.moreFromMozilla", false);
user_pref("browser.tabs.firefox-view", false);
user_pref("browser.tabs.tabmanager.enabled", false);
user_pref("browser.tabs.warnOnClose", true);
user_pref("browser.urlbar.suggest.calculator", true);
user_pref("extensions.pocket.enabled", false);
user_pref("full-screen-api.warning.delay", 0);
user_pref("full-screen-api.warning.timeout", 0);
user_pref("identity.fxaccounts.enabled", false);
user_pref("media.autoplay.default", 0);
user_pref("media.hardwaremediakeys.enabled", false);
user_pref("media.videocontrols.picture-in-picture.video-toggle.enabled", false);
user_pref("signon.firefoxRelay.feature", "disabled");
user_pref("signon.generation.enabled", false);
user_pref("signon.management.page.fileImport.enabled", true);
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
user_pref("ui.key.menuAccessKey", 0);

user_pref("_user.js.parrot", "Fukyeah™, I survived the overrides and got this T-Shirt");
