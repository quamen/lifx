defmodule LIFX.LAN.ProtocolHeader do
  defstruct reserved:  0,  # uint64_t  Reserved
            type:      0,  # uint16_t  Message type determines the payload being used
            reserved2: 0   #           Reserved

  defmacro binary(reserved, type, reserved2) do
    quote do
      <<unquote(reserved)::little-unsigned-integer-size(64),
        unquote(type)::little-unsigned-integer-size(16),
        unquote(reserved2)::little-unsigned-integer-size(16)
      >>
    end
  end
end
