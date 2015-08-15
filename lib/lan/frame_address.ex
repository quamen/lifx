defmodule LIFX.LAN.FrameAddress do
  defstruct target:       0, # uint64_t   6 byte device address (MAC address) or zero (0) means all devices
            reserved:     0, # uint8_t[6] Must all be zero (0)
            reserved2:    0, #            Reserved
            ack_required: 0, # bool       Acknowledgement message required
            res_required: 0, # bool       Response message required
            sequence:     0  # uint8_t    Wrap around message sequence number

  defmacro binary(target, reserved, reserved2, ack_required, res_required, sequence) do
    quote do
      <<unquote(target)::little-unsigned-integer-size(64),
        unquote(reserved)::little-unsigned-integer-size(48),
        unquote(reserved2)::little-unsigned-integer-size(6),
        unquote(ack_required)::little-unsigned-integer-size(1),
        unquote(res_required)::little-unsigned-integer-size(1),
        unquote(sequence)::little-unsigned-integer-size(8)
      >>
    end
  end
end
