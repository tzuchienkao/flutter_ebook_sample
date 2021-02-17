import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //! 2. ChangeNotifierProvider. 在Widget Tree中插入ChangeNotifierProvider，以便Consumer可以获取到数据

    //创建顶层共享数据。这里使用MultiProvider可以创建多个共享数据，因为实际的应用不可能只有一个数据模型

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: FirstPage(),
      ),
    );
  }
}

class Counter with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第一个页面"),
        actions: <Widget>[
          FlatButton(
            child: Text("下一页"),
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SecondPage();
            })),
          ),
        ],
      ),
      body: Center(
        child: Consumer<Counter>(builder: (ctx, counterPro, child) {
          return Text(
            "当前计数:${counterPro.count}",
            style: TextStyle(fontSize: 20, color: Colors.red),
          );
        }),
      ),
      //! 3. Consumer：Widget树中需要使用数据（状态）的地方
      floatingActionButton: Consumer<Counter>(
        builder: (ctx, counterPro, child) {
          //* ctx: context,上下文,目的是知道当前树的对象
          //* counterPro: ChangeNotifier对应的实例，也是我们在builder函数中主要使用的对象
          //* child: 目的是进行优化，如果builder下面有一颗庞大的子树，当模型发生改变的时候，我们并不希望重新build这颗子树，那么就可以将这颗子树放到Consumer的child中，在这里直接引入即可.
          return FloatingActionButton(
            child: child,
            onPressed: () {
              counterPro.increment();
            },
          );
        },
        child: Icon(Icons.add), //! Icon放在builder外面,防止每次跟着一起刷新
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第二个页面"),
        actions: <Widget>[
          FlatButton(
            child: Text("上一页"),
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FirstPage();
            })),
          ),
        ],
      ),
      body: Center(
        child: Consumer<Counter>(builder: (ctx, counterPro, child) {
          return Text(
            "当前计数:${counterPro.count}",
            style: TextStyle(fontSize: 20, color: Colors.red),
          );
        }),
      ),
      floatingActionButton: Consumer<Counter>(
        builder: (ctx, counterPro, child) {
          return FloatingActionButton(
            child: child,
            onPressed: () {
              counterPro.increment();
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
