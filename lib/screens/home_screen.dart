import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guia_flutter_web_app/constants/app_themes.dart';
import 'package:guia_flutter_web_app/constants/controllers.dart';
import 'package:guia_flutter_web_app/constants/responsive.dart';
import 'package:guia_flutter_web_app/controllers/app_controller.dart';

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
        backgroundColor: Colors.white,
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

  HomeMobile({
    Key? key,
    required this.scrollController
  }) : super(key: key);

  final List<FiquePorDentro> _itemsFiquePorDentro = appController.getListMobileItemsBottom();

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
                      placeholder: 'O que procuras amigo?',
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
                          color: AppColors.primary,
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
            height: 60,
            color: Colors.white,
            child: const Padding(
              padding: EdgeInsets.only(left: 18, right: 18),
              child: Text("Guia Comercial", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            ),
          )
        ),

        //Lista de Explorar destinos
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Container(
              color: Colors.white,
              height: 250.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 200.0,
                    child: Card(
                      elevation: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: CachedNetworkImage(
                                imageUrl: "https://blog.lexos.com.br/wp-content/uploads/2018/07/como-montar-uma-loja-de-roupas-1280x720.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            flex: 2,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Expanded(child: Text("Lojas", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),)),
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
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 30),
          sliver: SliverToBoxAdapter(
              child: Container(
                height: 30,
                color: Colors.white,
                child: const Padding(
                  padding: EdgeInsets.only(left: 20, right: 18),
                  child: Text("Turismo e Coisas para Fazer", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                ),
              )
          ),
        ),
        //Lista de Experiencias
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Container(
              color: Colors.white,
              height: 250.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 200.0,
                    child: Card(
                      elevation: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: CachedNetworkImage(
                                  imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbtwvthT6W_4lJ_r6vyrtA-yjpb9FWrtcLxQ&usqp=CAU",
                                fit: BoxFit.cover,
                              ),
                            ),
                            flex: 2,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Expanded(child: Text("Cachoeiras", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),)),
                                  Expanded(child:Text("Lindas cachoeiras", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),)),
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
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 30),
          sliver: SliverToBoxAdapter(
              child: Container(
                height: 30,
                color: Colors.white,
                child: const Padding(
                  padding: EdgeInsets.only(left: 20, right: 18),
                  child: Text("Serviços", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                ),
              )
          ),
        ),
        //Lista de Experiencias
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Container(
              color: Colors.white,
              height: 250.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 200.0,
                    child: Card(
                      elevation: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: CachedNetworkImage(
                                imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRH47XTnCklo9A8z9wisrPHojkx0xaFbwAnCg&usqp=CAU",
                                fit: BoxFit.cover,
                              ),
                            ),
                            flex: 2,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Expanded(child: Text("Eletricista", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),)),
                                  Expanded(child:Text("Encontre um profissional", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),)),
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
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 30),
          sliver: SliverToBoxAdapter(
              child: Container(
                height: 30,
                color: Colors.white,
                child: const Padding(
                  padding: EdgeInsets.only(left: 20, right: 18),
                  child: Text("Anúncios dos Usuários", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                ),
              )
          ),
        ),
        //Lista de Experiencias
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Container(
              color: Colors.white,
              height: 250.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 200.0,
                    child: Card(
                      elevation: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: CachedNetworkImage(
                                imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMnz2sgXiJRIPzj66kGL9NPnWE5K0tVqMQgg&usqp=CAU",
                                fit: BoxFit.cover,
                              ),
                            ),
                            flex: 2,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Expanded(child: Text("Automóveis", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),)),
                                  Expanded(child:Text("Carros e motos", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),)),
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
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 30),
          sliver: SliverToBoxAdapter(
              child: Container(
                height: 60,
                color: Colors.grey[100],
                child: const Padding(
                  padding: EdgeInsets.only(left: 20, right: 18, top: 18),
                  child: Text("Fique por dentro", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                ),
              )
          ),
        ),
        //Lista Fique por dentro
        SliverToBoxAdapter(
          child: Container(
            color: Colors.grey[100],
            height: 250.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _itemsFiquePorDentro.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 250.0,
                  child: Card(
                    color: Colors.grey[100],
                    elevation: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: SizedBox(
                            height: 30,
                            child: Text(_itemsFiquePorDentro[index].titulo, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),)
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _itemsFiquePorDentro[index].items.map((item) {
                            return ListTile(
                              title: Text(item.titulo),
                              subtitle: Text(item.descricao),
                            );
                          }).toList()
                      ),
                    ]
                    ),

                  ),
                );
              },
            ),
          ),
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

