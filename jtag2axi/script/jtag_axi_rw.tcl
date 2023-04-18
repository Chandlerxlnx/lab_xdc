# Chandler, this provides the api to read/write data  API
#
proc jtag_rd {offset {base 0x44000000}} {
   create_hw_axi_txn rd_txn [lindex [get_hw_axis] 0] -address \
      [format %08x [expr $base + \
       $offset ]] \
    -len 1 -type read  -force
   run_hw_axi [get_axi_txns rd_txn]
   set rd_report [report_hw_axi_txn rd_txn -w 32]
   return $rd_report
}
proc jtag_wr {data offset {base 0x44000000}} {
   create_hw_axi_txn rd_txn [lindex [get_hw_axis] 0] -address \
      [format %08x [expr $base + \
       $offset ]] \
    -len 1 -type write  -force
   run_hw_axi [get_axi_txns rd_txn]
   #set rd_report [report_hw_axi_txn rd_txn -w 32]
   #return $rd_report
    return 0x[get_property DATA [get_hw_axi_txn rd_txn]]
}

proc write {address value} {
    set address [string range $address 2 [expr {[string length $address]-1}]]
    create_hw_axi_txn -quiet -force wr_tx [get_hw_axis hw_axi_1] -address $address -data $value -len 1 -size 32 -type write
    run_hw_axi -quiet wr_tx
}
 
proc read {address} {
    set address [string range $address 2 [expr {[string length $address]-1}]]
    create_hw_axi_txn -quiet -force rd_tx [get_hw_axis hw_axi_1] -address $address -len 1 -size 32 -type read
    run_hw_axi -quiet rd_tx
    return 0x[get_property DATA [get_hw_axi_txn rd_tx]]
}
