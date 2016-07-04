# rust_win32error

Error like wrapper for GetLastError for Rust.

## Example


cargo.toml

**0.8.0**
```toml
...

[dependencies]
kernel32-sys = "*"
rust-win32error = "0.8.0"
```

main.rs
```rust
extern crate kernel32;
extern crate rust_win32error;

use rust_win32error::*;
use kernel32::OpenProcess;
// needs to be brought so `description` function can be used
use std::error::Error;

fn main() {
    func();
}

fn func() {
    let process_terminate = 0x0001;
    let h = unsafe { OpenProcess(process_terminate, 0, 4) }; 
    let err = Win32Error::new();
    println!("{}", err); // => 5: Access is denied (or localized):

    let err = Win32Error::from(6); // => 6: Handle is invalid (or localized):
    println!("{}", err);

    println!("{}", err.description()); // => Handle is invalid (or localized)
    println!("Error code is {}", err.get_error_code()); // => Error code is 6

    // pass some crazy error
    let err = Win32Error::from(885848);
    println!("{}", err); // => 885848: Unknown error
}

// From 0.8.0 and above
fn get_result_ok() -> Win32Result<u32> {
    Err(Win32Error::new())
}
```

## License
```
    Copyright (c) 2015 Jozef Novák
    Copyright (c) 2016 Jean Pierre Dudey

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
```
