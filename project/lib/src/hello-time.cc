#include "hello-time.h"
#include <iostream>
#include <chrono>
#include <iomanip>

void print_localtime()
{
  const auto now = std::chrono::system_clock::now();
  std::time_t result = std::chrono::system_clock::to_time_t(now);

  // Convert to local time using std::localtime_r
  struct std::tm tm;
  if (localtime_r(&result, &tm) == nullptr)
  {
    std::cerr << "Error: localtime_r failed!" << std::endl;
    return;
  }

  // Print formatted time using std::put_time
  std::cout << std::put_time(&tm, "%Y-%m-%d %H:%M:%S") << std::endl;
}
