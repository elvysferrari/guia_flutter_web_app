import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guia_flutter_web_app/constants/app_themes.dart';
import 'package:guia_flutter_web_app/constants/responsive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _scrollController = TrackingScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey[400],
        body: Responsive(
          mobile: HomeMobile(scrollController: _scrollController,),
          desktop: HomeDesktop(scrollController: _scrollController,),
        ),
      ),
    );
  }
}

class HomeMobile extends StatelessWidget {

  final TrackingScrollController scrollController;

  const HomeMobile({
    Key? key,
    required this.scrollController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          expandedHeight: 100,
          floating: false,
          centerTitle: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Column(
              children: <Widget>[
                const SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 6.0, 24.0, 18.0),
                  child: SizedBox(
                    height: 50.0,
                    width: double.infinity,
                    child: CupertinoTextField(
                      keyboardType: TextInputType.text,
                      placeholder: 'Para onde você quer ir?',
                      placeholderStyle: const TextStyle(
                        color: Color(0xffC4C6CC),
                        fontSize: 14.0,
                        fontFamily: 'Brutal',
                      ),
                      prefix: const Padding(
                        padding:
                        EdgeInsets.fromLTRB(9.0, 6.0, 9.0, 6.0),
                        child: Icon(
                          Icons.search,
                          color: Color(0xffC4C6CC),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: const Color(0xffF0F1F5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 80,
            color: Colors.white,
            child: const Padding(
              padding: EdgeInsets.only(left: 18, right: 18),
              child: Text("Explore destinos perto de você", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            ),
          )
        ),

        //Lista de Explorar destinos
        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            height: 150.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 150.0,
                  child: Card(
                    elevation: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)), child: CachedNetworkImage(imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDZMsLbi05ZNE2JEkQpIXPLdpSZtk-YL6dIA&usqp=CAU")),
                          flex: 2,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Expanded(child: Text("Pato Branco", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),)),
                                Expanded(child:Text("5 minutos de carro", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 10),)),
                              ],
                            ),
                          ),
                          flex: 1,
                        ),
                        
                      ],
                    ),

                  ),
                );
              },
            ),
          ),
        ),

        //Lista More em qualquer lugar
        SliverList(
            delegate: SliverChildBuilderDelegate((context, indice){
              return Container(color: Colors.white, height: 50,);
            },
                childCount: 1
            )
        ),

        //Lista Fique por dentro
        SliverList(
            delegate: SliverChildBuilderDelegate((context, indice){
              return Container(color: Colors.white, height: 50,);
            },
                childCount: 1
            )
        ),
      ],
    );
  }
}

class HomeDesktop extends StatelessWidget {

  final TrackingScrollController scrollController;

  const HomeDesktop({
    Key? key,
    required this.scrollController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(12),
              /*child: ListaOpcoes(
                usuario: usuarioAtual,
              ),*/
            )
        ),
        const Spacer(),
        Flexible(
            flex: 5,
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                const SliverPadding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                  sliver: SliverToBoxAdapter(
                    /*child: AreaStoria(
                      usuario: usuarioAtual,
                      estorias: estorias,
                    ),*/
                  ),
                ),
                const SliverToBoxAdapter(
                  /*child: AreaCriarPostagem(
                    usuario: usuarioAtual,
                  ),*/
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                            (context, indice){
                          Container();
                        },
                        childCount: 1
                    )
                )
              ],
            )
        ),
        const Spacer(),
        const Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(12),
              /*child: ListaContatos(
                usuarios: usuariosOnline,
              ),*/
            )
        ),
      ],
    );
  }
}