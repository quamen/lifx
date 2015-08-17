defmodule LIFX.LAN.ProtocolHeader do
  defstruct reserved:  0,  # uint64_t  Reserved
            type:      0,  # uint16_t  Message type determines the payload being used
            reserved2: 0   #           Reserved

  def binary(protocol_header) do
      <<protocol_header.reserved::little-unsigned-integer-size(64),
        protocol_header.type::little-unsigned-integer-size(16),
        protocol_header.reserved2::little-unsigned-integer-size(16)
      >>
  end
end
