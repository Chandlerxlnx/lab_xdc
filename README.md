# lab_xdc
this lab is to demo how to write xdc in some paricular case

## order of constraints

The order in which IP XDC files could be processed are, as follows:

1. User XDC set to EARLY
2. IP XDC set to EARLY
3. User XDC set to NORMAL (default)
4. IP XDC set to LATE
5. User XDC set to LATE

## how to set false path in IP constraint

the normal falsepath is from clock to clock. but the clock name in IP might not be same as top design. the constraints will disapear when `get_clock` return null.
*to walk around* the clock can be gotten with command
```TCL
  set_false_path -from [get_clocks -of_object [get_ports src_clk_port]] \
       -to [get_clocks -of_object [get_ports dest_clk_port]]
```
