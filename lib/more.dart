import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:email_launcher/email_launcher.dart';

class More extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MoreState();
  }
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(125),
        child: AppBar(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(45),
              bottomRight: Radius.circular(45)),
        ),
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: EdgeInsets.only(left: 15, bottom: 50),
          title: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "Más",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 32.0),
                ),
              ],
            ),
          ),
        ),
      ),
      ), 
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("Calificar"),
              leading: Icon(Icons.rate_review, color: Colors.grey),
              onTap: _launchURL,
            ),
            ListTile(
              title: Text("Compartir App"),
              leading: Icon(Icons.share, color: Colors.grey),
              onTap: () {
                Share.share("¡Descarga Television Dominicana y disfruta de muchos canales en la mejor calidad! Descargala ya en este enlace: https://play.google.com/store/apps/details?id=com.aarondev.tvdominicana");
              },
            ),
                        ListTile(
              title: Text("Sugerir Canal"),
              leading: Icon(Icons.add_circle_outline, color: Colors.grey),
              onTap: _launchSuggestion,
            ),
            ListTile(
              title: Text("Contacta al Desarrollador"),
              leading: Icon(Icons.mail_outline, color: Colors.grey),
              onTap: _launchMail,
            ),
            ListTile(
              title: Text("Politicas"),
              leading: Icon(Icons.lock_outline, color: Colors.grey),
              onTap: _showprivacy,
            ),

          ],
        ),
      ),

    );
  }


  //Contacto dev
  void _launchMail() async {
    Email email = Email(
      to: ['aarondev98@gmail.com'],
      subject: "Contacto al desarrollador",
    );
    await EmailLauncher.launch(email);
  }
  // Sugerencia canal
   void _launchSuggestion() async {
    Email email = Email(
      to: ['aarondev98@gmail.com'],
      subject: "Sugerencia de canal",
    );
    await EmailLauncher.launch(email);
  }

//lanzar rese;as
  _launchURL() async {
    const url = 'https://play.google.com/store/apps/details?id=com.aarondev.tvdominicana';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

//Politica de privacidad
  void _showprivacy() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: AlertDialog(
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(45))),
            title: new Text("Politicas de Privacidad"),
            content: SingleChildScrollView(
              child: new Text(""" 
Este App utiliza canales de television que transmiten su contenido por señal abierta o por medio de su pagina web. 

Si es propietario de uno de estos canales y desea contactarse con el desarrollador puede hacerlo escribiendo a este correo: aarondev98@gmail.com


Privacy Policy

built the Televisión Dominicana app as a Freemium app. This SERVICE is provided by at no cost and is intended for use as is.

This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service.

If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy.

The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at Televisión Dominicana unless otherwise defined in this Privacy Policy.

Information Collection and Use

For a better experience, while using our Service, I may require you to provide us with certain personally identifiable information. The information that I request will be retained on your device and is not collected by me in any way.

The app does use third party services that may collect information used to identify you.

Link to privacy policy of third party service providers used by the app

Google Play Services
AdMob
Log Data

I want to inform you that whenever you use my Service, in a case of an error in the app I collect data and information (through third party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing my Service, the time and date of your use of the Service, and other statistics.

Cookies

Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory.

This Service does not use these “cookies” explicitly. However, the app may use third party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.

Service Providers

I may employ third-party companies and individuals due to the following reasons:

To facilitate our Service;
To provide the Service on our behalf;
To perform Service-related services; or
To assist us in analyzing how our Service is used.
I want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.

Security

I value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and I cannot guarantee its absolute security.

Links to Other Sites

This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by me. Therefore, I strongly advise you to review the Privacy Policy of these websites. I have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.

Children’s Privacy

These Services do not address anyone under the age of 13. I do not knowingly collect personally identifiable information from children under 13. In the case I discover that a child under 13 has provided me with personal information, I immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact me so that I will be able to do necessary actions.

Changes to This Privacy Policy

I may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Privacy Policy on this page.

This policy is effective as of 2020-07-14

Contact Us

If you have any questions or suggestions about my Privacy Policy, do not hesitate to contact me at aarondev98@gmail.com. """),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Cerrar"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
