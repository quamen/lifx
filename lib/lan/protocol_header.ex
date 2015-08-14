defmodule LIFX.LAN.ProtocolHeader do
  defstruct reserved:  <<0 :: size(64)>>,  # uint64_t  Reserved
            type:      <<0 :: size(16)>>,  # uint16_t  Message type determines the payload being used
            reserved2: <<0 :: size(16)>>   #           Reserved
end
