defmodule LIFX do
  def discover do
    {_, socket} = :gen_udp.open(56700, [:binary, active: true, broadcast: true])
    bin = LIFX.LAN.Device.GetService.binary
    :gen_udp.send(socket, {255,255,255,255}, 56700, bin)

    check_mailbox
    :gen_udp.close(socket)
  end

  def check_mailbox do
    receive do
      {:udp, _, _, 56700, bin} -> parse_binary(bin)
    after
      2_000 -> "done"
    end
  end

  def parse_binary(bin) do
    <<h::size(288), payload::binary>> = bin
    header = <<h::size(288)>>

    IO.inspect header
    IO.inspect payload

    check_mailbox
  end
end
