module CryptKeeper
  module Type
    class Crypt < ActiveRecord::Type::String
      attr_reader :encryptor

      def type
        :crypt
      end

      def changed?(old_value, new_value, _new_value_before_type_cast)
        Rails.logger.info ">> old_value"
        Rails.logger.info old_value
        Rails.logger.info ">> new_value"
        Rails.logger.info new_value
        Rails.logger.info ">> before_type_cast"
        Rails.logger.info _new_value_before_type_cast

        old_value != new_value
      end

      def initialize(encryptor:)
        @encryptor = encryptor
      end

      def serialize(value)
        encryptor.dump value
      end

      def deserialize(value)
        encryptor.load value
      end
    end
  end
end

