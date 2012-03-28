# encoding: utf-8

module IceNine
  class Freezer

    # A freezer class for handling Struct objects
    class Struct < Object

      # Deep Freeze a Struct
      #
      # @example
      #   struct = IceNine:Freezer::Struct.deep_freeze(klass.new('1'))
      #   struct.values.select(&:frozen?)  # => ['1']
      #
      # @param [Struct] struct
      #
      # @return [Struct]
      #
      # @todo use super on Struct#each once it returns self in Rubinius
      #
      # @api public
      def self.deep_freeze(struct)
        struct.each { |value| IceNine.deep_freeze(value) }
        super struct
      end

    end # class Struct
  end # class Freezer
end # module IceNine
