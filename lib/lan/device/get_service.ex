# http://lan.developer.lifx.com/v2.0/docs/device-messages#section-getservice-2
defmodule LIFX.LAN.Device.GetService do
  require LIFX.LAN.Frame
  require LIFX.LAN.FrameAddress
  require LIFX.LAN.ProtocolHeader

  def binary do
    frame = %LIFX.LAN.Frame{tagged: 1}
    frame_address = %LIFX.LAN.FrameAddress{}
    protocol_header = %LIFX.LAN.ProtocolHeader{type: 2}

    binary_frame = LIFX.LAN.Frame.binary(frame)
    binary_frame_address = LIFX.LAN.FrameAddress.binary(frame_address)
    binary_protocol_header = LIFX.LAN.ProtocolHeader.binary(protocol_header)
    binary_frame <> binary_frame_address <> binary_protocol_header
  end
end
