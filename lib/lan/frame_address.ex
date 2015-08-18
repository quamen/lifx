defmodule LIFX.LAN.FrameAddress do
  defstruct target:       0, # uint64_t   6 byte device address (MAC address) or zero (0) means all devices
            reserved:     0, # uint8_t[6] Must all be zero (0)
            reserved2:    0, #            Reserved
            ack_required: 0, # bool       Acknowledgement message required
            res_required: 0, # bool       Response message required
            sequence:     0  # uint8_t    Wrap around message sequence number

  def binary(frame_address) do
    <<rrar::unsigned-integer-size(56)>> = <<frame_address.reserved::unsigned-integer-size(48),
                                            frame_address.reserved2::unsigned-integer-size(6),
                                            frame_address.ack_required::unsigned-integer-size(1),
                                            frame_address.res_required::unsigned-integer-size(1)>>

    <<frame_address.target::little-unsigned-integer-size(64),
      rrar::little-unsigned-integer-size(56),
      frame_address.sequence::little-unsigned-integer-size(8)>>
  end
end
