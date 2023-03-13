// ignore_for_file: override_on_non_overriding_member

void createOrderMessage() {
  fetchUserOrder();
  print('fetching order');
}
//this is the asynchronous function (Future.delayed to simulate asynchronous nature returning value after 2 seconds) - 
void fetchUserOrder() =>
    // Imagine that this function is more complex and slow.
    Future.delayed(
      const Duration(seconds: 2),
      () => print('Large Latte'),
    );

// Now try to return the String from the asynchronous function - 
void createOrderMessage2() async {
  print('fetching order');
  print( await fetchUserOrder2());
}

// return object from async function
Future<String> createOrderMessage3() async {
  var order = await fetchUserOrder2();
  print ('Your order is: $order');
  return "Customer ordered $order";
}

// error handling in async communication w/ Future
Future<void> printOrderMessage4() async {
  try {
    print('Awaiting user order...');
    var order = await fetchUserOrder2();
    print(order);
  } catch (err) {
    print('Caught error: $err');
  }
}


//async function running the long process - but will not work since the String value cannot be 
//returned directly - must be included in a Future object - see next solution
Future<String> fetchUserOrder2() =>
    // Imagine that this function is more complex and slow.
    Future.delayed(
      const Duration(seconds: 2),
      () => 'Large Latte',
    );

void main() async {
  createOrderMessage();
  createOrderMessage2();
  var msg = await createOrderMessage3();
  print(msg);
}
// Syntax error :(


// FUTURE BUILDER
// this code shows a 'loading' spinner whie waiting for the async function
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 2),
    () => 'Data Loaded',
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.displayMedium!,
      textAlign: TextAlign.center,
      child: FutureBuilder<String>(
        future: _calculation, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) { // the future builder does error handling for us, so try-catch is not needed
            children = <Widget>[
              const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Result: ${snapshot.data}'),
              ),
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              ),
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              ),
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }
}

// STREAMS
// Following is an example from dart site - 

// async and return type since we are referencing an async function that returns a stream
Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  await for (final value in stream) {
    print("Received $value");
    sum += value;
  }
  return sum;
}

//the async function with stream
Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    yield i; // adds to the output stream - does not stop execution of function, unlike return
  }
}
void main2() async {
  var stream = countStream(10);
  var sum = await sumStream(stream);
  print(sum); // 55
}

// Notice, the sumStream function is a future but it uses a Stream based function (countStream) to get its data

// ERROR HANDLING W/ STREAM
Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  try {
    await for (final value in stream) {
      //print(“value received is $value”); - this hangs, why?  Research!
      sum += value;
    }
  } catch (e) {
    return -1;
  }
  return sum;
}

Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    if (i == 4) {
      throw Exception('Intentional exception');
    } else {
      yield i;
    }
  }
}

void main() async {
  var stream = countStream(10);
  var sum = await sumStream(stream);
  print(sum); // -1
}

// example countDown app w/ StreamController & StreamBuilder
void main() {
  runApp(MyApp());
}
  
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
  
        primarySwatch: Colors.blue,
      ),
      home: CounterApp()
    );
  }
}
  
class CounterApp extends StatefulWidget {
  const CounterApp({Key? key}) : super(key: key);
  
  @override
  _CounterAppState createState() => _CounterAppState();
}
  
class _CounterAppState extends State<CounterApp> {
  
  // create instance of streamcontroller class
  StreamController _controller = StreamController();
  int _counter = 10;
  
  void StartTimer() async{
      
    // Timer Method that runs every second
    Timer.periodic(Duration(seconds: 1), (timer) {
      _counter--;
  
      // add event/data to stream controller using sink
      _controller.sink.add(_counter);
  
      // will stop Count Down Timer when _counter value is 0
      if(_counter<=0){
        timer.cancel();
        _controller.close();
      }
    });
  }
  
  @override
  void dispose() {
    super.dispose();
      
     // Destroy the Stream Controller when use exit the app
    _controller.close();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              initialData: _counter,
              stream: _controller.stream,
                builder: (context,snapshot){
                return Text('${snapshot.data}');
                }
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){
                
              // start the timer
              StartTimer();
            }, child: Text('Start Count Down'))
          ],
        ),
      ),
    );
  }
}