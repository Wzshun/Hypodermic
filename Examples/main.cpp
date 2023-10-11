#include "Hypodermic/Hypodermic.h"
#include <iostream>
#include <string>

using namespace std;

class ILogger {
public:
  virtual ~ILogger() = default;
  virtual void log(const string &msg) = 0;
};

class Logger : public ILogger {
public:
  void log(const string &msg) {
    cout << "[time]:" << msg << endl;
  }
};

int main(int argc, char *argv[]) {
  Hypodermic::ContainerBuilder builder;
  builder.registerType<Logger>().as<ILogger>();

  auto container = builder.build();

  auto logger = container->resolve<ILogger>();
  logger->log("Hello world, dependency injection.");

  return 0;
}