defmodule LIFX.LAN.Frame do
  defstruct size:        36, # uint16_t  Size of entire message in bytes including this field
            origin:      0,   # uint8_t   Message origin indicator: must be zero (0)
            tagged:      0,   # bool      Determines usage of the Frame Address target field
            addressable: 1,   # bool      Message includes a target address: must be one (1)
            protocol:    1024,  # uint16_t  Protocol number: must be 1024 (decimal)
            source:      0   # uint32_t  Source identifier: unique value set by the client, used by responses


  defmacro binary(size, origin, tagged, addressable, protocol, source) do
    quote do
      <<unquote(size)::little-unsigned-integer-size(16),
        unquote(origin)::little-unsigned-integer-size(2),
        unquote(tagged)::little-unsigned-integer-size(1),
        unquote(addressable)::little-unsigned-integer-size(1),
        unquote(protocol)::little-unsigned-integer-size(12),
        unquote(source)::little-unsigned-integer-size(32)
      >>
    end
  end
end
