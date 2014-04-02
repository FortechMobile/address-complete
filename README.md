Fortech Mobile Address Search	
=====================

In acest repository gasiti proiectele prezentate in cadrul **JobShop** (02.04.2014) **Code less, do more**. 

----------


Resurse
---------

Pentru API-urile serviciului web, aveti nevoie de un cont de trial la site-ul de mai jos, ca tema se poate incerca modificarea aplicatiei si sa folositi alte API-uri ca unele pentru [vreme][1].
Serviciul web: [CanadaPost][2] 

**Tool pentru testat servicii web:** 
- [Postman][3] plugin pentru browser-ul Chrome
- [Fiddler][4] pentru Windows

**Nota:** Pentru aplicatia android, am folosit noul sistem de build packaging Gradle asa ca va fi nevoie de un IDE care sa suporte asta (eu am folosit [Android Studio][5]).

Librarii
----------

**Android**
- [Volley][6] este libraria folosita pentru a efectua request-uri web, documentatie sa gaseste mai putina la momentul de fata dar puteti incerca link-urile din [acest][7] post.
- [Gson][8] este libraria folosita la parsarea JSON
- [Genymotion][9] este unul din alternativele rapide pentru emulatorul din android sdk

**iOS**
- [AFNetworking][10] este libraria folosita pentru a efectua request-uri web
- [Objectify][11] este tool-ul folosit la convertirea unui obiect JSON in clasa ObjectiveC



  [1]: http://developer.worldweatheronline.com/io-docs
  [2]: https://www.canadapost.ca/pca/
  [3]: https://chrome.google.com/webstore/detail/postman-rest-client/fdmmgilgnpjigdojojpjoooidkmcomcm?hl=en
  [4]: http://www.telerik.com/download/fiddler
  [5]: http://developer.android.com/sdk/installing/studio.html
  [6]: https://github.com/mcxiaoke/android-volley
  [7]: http://stackoverflow.com/questions/17571759/looking-for-a-documentation-for-the-android-volley-api
  [8]: https://code.google.com/p/google-gson/
  [9]: http://www.genymotion.com/
  [10]: https://github.com/AFNetworking/AFNetworking
  [11]: http://tigerbears.com/objectify/
