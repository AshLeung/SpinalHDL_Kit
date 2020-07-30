package test

import spinal.core._

class and_gate extends Component {
  val io = new Bundle {
    val a = in Bool
    val b = in Bool
    val c = out Bool
  }

  io.c := io.a & io.b
}

object myVerilogTop {
  def main(args: Array[String]) {
    SpinalVerilog(new and_gate)
  }
}
