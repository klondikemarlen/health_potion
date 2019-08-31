# frozen_string_literal: true

class RackSafeResponse
  attr_reader :data

  def initialize(data)
    @data = data
    @data = build_valid_response_from_data
  end

  def call
    data
  end

  def default_headers
    { 'Content-Type' => 'text/html' }
  end

  def default_status
    '200'
  end

  #######
  private
  #######

  def build_valid_response_from_data
    return data if valid_response?

    return [default_status, default_headers, [data]] if only_a_body?

    return [data[1].to_s, default_headers, [data]] if body_and_status?

    [data[1], data[2], [data[0]]]
  end

  def body_and_status?
    eachable? && valid_status? && data.length == 2
  end

  def eachable?
    data.respond_to?(:each)
  end

  def only_a_body?
    data.is_a? String
  end

  def valid_response?
    eachable? && valid_status? && data.length == 3
  end

  def valid_status?
    status = data[0]
    100 <= status && status <= 599
  end
end
