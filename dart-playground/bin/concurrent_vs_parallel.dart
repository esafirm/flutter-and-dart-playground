import 'dart:io';
import 'dart:isolate';

void main(List<String> arguments) async {
  final firstTime = await concurrentSingleThreadTasks();
  print('Elapsed duration for single thread: ${firstTime.elapsed.inMilliseconds}');

  final secondTime = await concurrentMultiThreadTasks();
  print('Elapsed duration for multi thread: ${secondTime.elapsed.inMilliseconds}');
}

/// The time taken for this will be the accumulate of the two tasks because
/// they are running in the same thread.
Future<Stopwatch> concurrentMultiThreadTasks() async {
  final stopwatch = Stopwatch()..start();

  // await all
  final firstTask = Isolate.run(() => runTask(const Duration(seconds: 1)));
  final secondTask = Isolate.run(() => runTask(const Duration(seconds: 3)));

  await Future.wait([firstTask, secondTask]);

  stopwatch.stop();

  return stopwatch;
}

/// The time taken for this will be the longest task because they are running
/// in different threads.
Future<Stopwatch> concurrentSingleThreadTasks() async {
  final stopwatch = Stopwatch()..start();

  // await all
  final firstTask = runTask(const Duration(seconds: 1));
  final secondTask = runTask(const Duration(seconds: 3));

  await Future.wait([firstTask, secondTask]);

  stopwatch.stop();

  return stopwatch;
}

Future runTask(Duration taskDuration) async {
  // Simulate a long blocking running task
  sleep(taskDuration);

  // print current thread
  print('Current thread: ${Isolate.current.debugName}');
}
