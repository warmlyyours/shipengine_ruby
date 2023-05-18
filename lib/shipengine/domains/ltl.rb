# frozen_string_literal: true

require "hashie"

module ShipEngine
  module Domain
    class Ltl
      def initialize
        @client = ShipEngine::Client.new
      end

      def carrier_by_carrier_id(carrier_id:, params: {})
        response = @client.get(
          path: "#{ShipEngine::Constants::PATHS.vbeta.ltl.carriers}/#{carrier_id}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def shipping_quote(carrier_id:, params: {})
        response = @client.post(
          path: "#{ShipEngine::Constants::PATHS.vbeta.ltl.quotes}/#{carrier_id}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end


      def schedule_pickup_by_quote_id(quote_id:, params: {})
        response = @client.post(
          path: "#{ShipEngine::Constants::PATHS.vbeta.ltl.quotes}/#{quote_id}/pickup",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def bill_of_lading_by_quote_id(quote_id:, params: {})
        response = @client.post(
          path: "#{ShipEngine::Constants::PATHS.vbeta.ltl.quotes}/#{quote_id}/bill_of_lading",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def bill_of_lading_by_pickup_id(pickup_id:, params: {})
        response = @client.post(
          path: "#{ShipEngine::Constants::PATHS.vbeta.ltl.pickups}/#{pickup_id}/bill_of_lading",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def tracking(params: {})
        response = @client.get(
          path: "#{ShipEngine::Constants::PATHS.vbeta.ltl.tracking}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

    end
  end
end
