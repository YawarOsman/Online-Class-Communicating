import 'package:flutter/material.dart';

class SearchDetails extends StatefulWidget {
  const SearchDetails({Key? key}) : super(key: key);

  @override
  State<SearchDetails> createState() => _SearchDetailState();
}

class _SearchDetailState extends State<SearchDetails> {
  @override
  Widget build(BuildContext context) {
    bool _searchType = false;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
              iconTheme: Theme.of(context).iconTheme,
              leadingWidth: 0,
              leading: SizedBox(width: 0),
              elevation: 0,
              titleSpacing: 0,
              title: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 3),
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: 38,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Theme.of(context).cardColor),
                          child: TextField(
                            onChanged: (value) {
                              if (value.isEmpty) {
                                _searchType = true;
                                setState(() {});
                                print('11111111111111${_searchType}');
                              } else {
                                _searchType = false;
                                setState(() {});
                                print('222222222222${_searchType}');
                              }
                            },
                            cursorColor: Colors.green.shade600,
                            decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.search,
                                  color: Colors.green.shade600,
                                ),
                                hintText: 'Search',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 13)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.close),
                        )
                      ],
                    ),
                  ),
                ],
              )),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: _searchType,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 27,
                  child: TabBar(
                      padding: EdgeInsets.zero,
                      indicatorColor: Colors.green.shade600,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelStyle: TextStyle(fontSize: 12),
                      tabs: [
                        Tab(
                          child: Text('All'),
                        ),
                        Tab(
                          child: Text('Rooms'),
                        ),
                        Tab(
                          child: Text('People'),
                        ),
                      ]),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 15),
                  child: _searchType
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          child: TabBarView(children: [
                            Center(child: Text('All')),
                            Center(child: Text('Video')),
                            Center(child: Text('Audio'))
                          ]))
                      : Column(children: [
                          Text('Recent Searches',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor)),
                        ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
