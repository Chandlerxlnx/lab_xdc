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
   create_hw_axi_txn wr_txn [lindex [get_hw_axis] 0] -address \
      [format %08x [expr $base + \
       $offset ]] \
    -len 1 -type write  -force
   run_hw_axi [get_axi_txns wr_txn]
   set rd_report [report_hw_axi_txn wr_txn -w 32]
   return $rd_report
}

