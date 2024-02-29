class MenuModel {
  int index;
  String title;
  String icon;
  MenuModel({this.index=0,this.title="",this.icon=""});

 static List<MenuModel> initialMenu=[
    MenuModel(index: 0,title:"Header",icon:"logo.svg"),
    MenuModel(index: 1,title:"Dashboard",icon:"home.svg"),
    MenuModel(index: 2,title:"Estudiantes",icon:"student.svg"),
    MenuModel(index: 3,title:"Maestros",icon:"teacher.svg"),
    MenuModel(index: 4,title:"Eventos",icon:"event.svg"),
    MenuModel(index: 5,title:"Finanzas",icon:"finance.svg"),
    MenuModel(index: 6,title:"Usuarios",icon:"user.svg"),
    MenuModel(index: 7,title:"Configuracion",icon:"setting.svg"),
  ];
}