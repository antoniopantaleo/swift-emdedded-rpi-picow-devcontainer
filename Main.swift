//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift open source project
//
// Copyright (c) 2024 Apple Inc. and the Swift project authors.
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

@main
struct Main {

  private static let led = UInt32(CYW43_WL_GPIO_LED_PIN)

  static func main() {

    guard cyw43_arch_init() == 0 else {
      return print("Wi-Fi init failed")
    }

    while true {
      dot()
      dot()
      dot()

      dash()
      dash()
      dash()

      dot()
      dot()
      dot()
    }
  }

  private static func dot() {
    cyw43_arch_gpio_put(led, true)
    sleep_ms(250)
    cyw43_arch_gpio_put(led, false)
    sleep_ms(250)
  }

  private static func dash() {
    cyw43_arch_gpio_put(led, true)
    sleep_ms(500)
    cyw43_arch_gpio_put(led, false)
    sleep_ms(250)
  }
  
}