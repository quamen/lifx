# http://lan.developer.lifx.com/v2.0/docs/device-messages#section-getservice-2
defmodule LIFX.LAN.Device.GetService do
  require LIFX.LAN.Frame
  require LIFX.LAN.FrameAddress
  require LIFX.LAN.ProtocolHeader

  def binary do
    frame = %LIFX.LAN.Frame{}
    frame_address = %LIFX.LAN.FrameAddress{}
    protocol_header = %LIFX.LAN.ProtocolHeader{}

    binary_frame = LIFX.LAN.Frame.binary(frame.size, frame.origin, frame.tagged, frame.addressable, frame.protocol, frame.source)
    binary_frame_address = LIFX.LAN.FrameAddress.binary(frame_address.target, frame_address.reserved, frame_address.reserved2, frame_address.ack_required, frame_address.res_required, frame_address.sequence)
    binary_protocol_header = LIFX.LAN.ProtocolHeader.binary(protocol_header.reserved, protocol_header.type, protocol_header.reserved2)
    binary_frame <> binary_frame_address <> binary_protocol_header
  end
end
