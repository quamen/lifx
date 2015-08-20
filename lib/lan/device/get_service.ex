# http://lan.developer.lifx.com/v2.0/docs/device-messages#section-getservice-2
defmodule LIFX.LAN.Device.GetService do
  require LIFX.LAN.Header

  def binary do
    header = %LIFX.LAN.Header{tagged: 1, type: 2}

    LIFX.LAN.Header.binary(header)
  end
end
