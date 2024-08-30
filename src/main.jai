// Global imports
#import "Basic";
#import "Window_Creation";

// Named global imports
Simp :: #import "Simp";
Input :: #import "Input";

// Global constants
WINDOW_WIDTH : s32 = 1920;
WINDOW_HEIGHT : s32 = 1080;

// Entry point
main :: () {
  print("Welcome to Fabrinomics!\n");

  #if OS == .WINDOWS {
    Windows :: #import "Windows";
    Windows.SetProcessDPIAware();

    Windows.timeBeginPeriod(1);
  }

  my_window := create_window(WINDOW_WIDTH, WINDOW_HEIGHT, "Fabrinomics - alpha build.");

  Simp.set_render_target(my_window); // @TODO check handesness

  quit := false;
  while (!quit) {
    Input.update_window_events();

  }

}
