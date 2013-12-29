module Sniffles
  module Sniffers
    class Chartbeat
      include Text

      attr_accessor :doc
      attr_reader :output

      def initialize(response_body)
        @output = {}
        parse(response_body) && process_document
      end

      def process_document
        @output[:found] = found?
      end

      private
      def found?
        match? /\/chartbeat\.js/
      end
    end
  end
end
