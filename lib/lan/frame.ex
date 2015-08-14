defmodule LIFX.LAN.Frame do
  defstruct size: <<0 :: size(16)>>,       # uint16_t  Size of entire message in bytes including this field
            origin: <<0 :: size(2)>>,      # uint8_t   Message origin indicator: must be zero (0)
            tagged: <<0 :: size(1)>>,      # bool      Determines usage of the Frame Address target field
            addressable: <<1 :: size(1)>>, # bool      Message includes a target address: must be one (1)
            protocol: <<0 :: size(12)>>,   # uint16_t  Protocol number: must be 1024 (decimal)
            source: <<0 :: size(32)>>      # uint32_t  Source identifier: unique value set by the client, used by responses
end
