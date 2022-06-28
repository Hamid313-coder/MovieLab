import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movielab/constants/colors.dart';
import 'package:movielab/pages/show/show_box/imdb_list_show_box.dart';
import 'get_company.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({Key? key, required this.company}) : super(key: key);
  final Map company;

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  dynamic companyData;
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                FontAwesomeIcons.arrowLeft,
                color: widget.company['color'] ?? kPrimaryColor,
                size: 22.5,
              )),
          backgroundColor: Colors.white,
          title: Text(widget.company['name'],
              style: GoogleFonts.poppins(
                  color: widget.company['color'] ?? kPrimaryColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: companyData != null
                    ? ListView.builder(
                        itemCount: companyData['movies'].length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return IMDBListShowBox(
                              showPreview: companyData['movies'][index]);
                        },
                      )
                    : const Center(
                        child: SpinKitThreeBounce(
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
              )
            ],
          ),
        ));
  }

  Future _loadData() async {
    await getCompanyInfo(id: widget.company['id']).then((response) {
      if (response != null) {
        setState(() {
          companyData = response;
        });
      }
    });
  }
}
