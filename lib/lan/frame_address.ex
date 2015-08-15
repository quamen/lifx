defmodule LIFX.LAN.FrameAddress do
  defstruct target:       <<0 :: little-unsigned-integer-size(64)>>, # uint64_t   6 byte device address (MAC address) or zero (0) means all devices
            reserved:     <<0 :: little-unsigned-integer-size(48)>>, # uint8_t[6] Must all be zero (0)
            reserved2:    <<0 :: little-unsigned-integer-size(6)>>,  #            Reserved
            ack_required: <<0 :: little-unsigned-integer-size(1)>>,  # bool       Acknowledgement message required
            res_required: <<0 :: little-unsigned-integer-size(1)>>,  # bool       Response message required
            sequence:     <<0 :: little-unsigned-integer-size(8)>>   # uint8_t    Wrap around message sequence number
end
