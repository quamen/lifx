defmodule LIFX.LAN.Frame do
  defstruct size:        36,   # uint16_t  Size of entire message in bytes including this field
            origin:      0,    # uint8_t   Message origin indicator: must be zero (0)
            tagged:      0,    # bool      Determines usage of the Frame Address target field
            addressable: 1,    # bool      Message includes a target address: must be one (1)
            protocol:    1024, # uint16_t  Protocol number: must be 1024 (decimal)
            source:      0     # uint32_t  Source identifier: unique value set by the client, used by responses

  def binary(frame) do
    <<otap::unsigned-integer-size(16)>> = <<frame.origin::unsigned-integer-size(2),
                                            frame.tagged::unsigned-integer-size(1),
                                            frame.addressable::unsigned-integer-size(1),
                                            frame.protocol::unsigned-integer-size(12)>>

    IO.puts otap
    <<frame.size::little-unsigned-integer-size(16),
      otap::little-unsigned-integer-size(16),
      frame.source::little-unsigned-integer-size(32)>>
  end
end
