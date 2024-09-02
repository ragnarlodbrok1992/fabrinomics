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

  // Initialize the window
  my_window := create_window(WINDOW_WIDTH, WINDOW_HEIGHT, "Fabrinomics - alpha build.");
  WINDOW_WIDTH, WINDOW_HEIGHT = Simp.get_render_dimensions(my_window);

  Simp.set_render_target(my_window); // @TODO check handesness

  quit := false;
  while (!quit) {
    Input.update_window_events();
    
    // Resizing of the window - might be useful
    for Input.get_window_resizes() {
      Simp.update_window(it.window);

      if it.window == my_window {
        should_reinit := (it.width != WINDOW_WIDTH) || (it.height != WINDOW_HEIGHT);

        WINDOW_WIDTH = it.width;
        WINDOW_HEIGHT = it.height;

        // Font reinitialization - not using right now
        // check Simp module examples
      }
    }

    // Cheking input events
    for Input.events_this_frame {
      if it.type == .QUIT then quit = true;

      if it.type == {
        case .KEYBOARD;
          if it.key_pressed && it.key_code == .ESCAPE {
            quit = true;
          }
      }
    }

    // Last thing in frame
    reset_temporary_storage();
  }

}
