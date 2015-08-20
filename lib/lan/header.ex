defmodule LIFX.LAN.Header do
  defstruct size:         36,   # uint16_t   Size of entire message in bytes including this field
            origin:       0,    # uint8_t    Message origin indicator: must be zero (0)
            tagged:       0,    # bool       Determines usage of the Frame Address target field
            addressable:  1,    # bool       Message includes a target address: must be one (1)
            protocol:     1024, # uint16_t   Protocol number: must be 1024 (decimal)
            source:       0,    # uint32_t   Source identifier: unique value set by the client, used by responses
            target:       0,    # uint64_t   6 byte device address (MAC address) or zero (0) means all devices
            reserved:     0,    # uint8_t[6] Must all be zero (0)
            reserved2:    0,    #            Reserved
            ack_required: 0,    # bool       Acknowledgement message required
            res_required: 0,    # bool       Response message required
            sequence:     0,    # uint8_t    Wrap around message sequence number
            reserved:     0,    # uint64_t   Reserved
            type:         0,    # uint16_t   Message type determines the payload being used
            reserved2:    0     #            Reserved


  def binary(header) do
    <<otap::integer-size(16)>> = <<header.origin::integer-size(2),
                                            header.tagged::integer-size(1),
                                            header.addressable::integer-size(1),
                                            header.protocol::integer-size(12)>>

    <<rrar::integer-size(56)>> = <<header.reserved::integer-size(48),
                                            header.reserved2::integer-size(6),
                                            header.ack_required::integer-size(1),
                                            header.res_required::integer-size(1)>>

    <<header.size::little-integer-size(16),
      otap::little-integer-size(16),
      header.source::little-integer-size(32),
      header.target::little-integer-size(64),
      rrar::little-integer-size(56),
      header.sequence::little-integer-size(8),
      header.reserved::little-integer-size(64),
      header.type::little-integer-size(16),
      header.reserved2::little-integer-size(16)>>
  end
end
