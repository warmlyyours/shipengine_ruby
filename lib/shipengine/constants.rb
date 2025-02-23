# frozen_string_literal: true

require "ostruct"

module ShipEngine
  module Constants
    API_KEY = ENV.fetch("API_KEY", "")

    PROD_URL = "https://api.shipengine.com"

    Paths = Struct.new(
      :v1,
      :vbeta,
      keyword_init: true
    )
    NamespaceV1 = Struct.new(
      :addresses,
      :batches,
      :carriers_accounts,
      :carriers,
      :shipsurance,
      :labels,
      :manifests,
      :package_pickups,
      :package_types,
      :rates,
      :service_points,
      :shipments,
      :tags,
      :tokens,
      :tracking,
      :warehouses,
      :webhooks,
      keyword_init: true
    )
    NamespaceVBeta = Struct.new(
      :ltl,
      keyword_init: true
    )
    Addresses = Struct.new(
      :parse_address,
      :validate_address,
      keyword_init: true
    )
    Batches = Struct.new(
      :root,
      :batch_by_external_id,
      keyword_init: true
    )
    CarriersAccounts = Struct.new(
      :root,
      keyword_init: true
    )
    Carriers = Struct.new(
      :root,
      keyword_init: true
    )
    Shipsurance = Struct.new(
      :root,
      :add_funds,
      :balance,
      keyword_init: true
    )
    Labels = Struct.new(
      :root,
      :label_by_external_shipment_id,
      :purchase_label_with_rate_id,
      :purchase_label_with_shipment_id,
      keyword_init: true
    )
    Ltl = Struct.new(
      :carriers,
      :quotes,
      :spot_quotes,
      :pickups,
      :tracking,
      keyword_init: true
    )
    Manifests = Struct.new(
      :root,
      :manifest_request,
      keyword_init: true
    )
    PackagePickups = Struct.new(
      :root,
      keyword_init: true
    )
    PackageTypes = Struct.new(
      :root,
      keyword_init: true
    )
    Rates = Struct.new(
      :root,
      keyword_init: true
    )
    ServicePoints = Struct.new(
      :root,
      keyword_init: true
    )
    Shipments = Struct.new(
      :root,
      :shipment_by_external_id,
      :parse_shipping_info,
      keyword_init: true
    )
    Tags = Struct.new(
      :root,
      keyword_init: true
    )
    Tokens = Struct.new(
      :root,
      keyword_init: true
    )
    Tracking = Struct.new(
      :root,
      keyword_init: true
    )
    Warehouses = Struct.new(
      :root,
      keyword_init: true
    )
    Webhooks = Struct.new(
      :root,
      keyword_init: true
    )

    PATHS = Paths.new(
      v1: NamespaceV1.new(
        addresses: Addresses.new(
          parse_address: "/v1/addresses/recognize",
          validate_address: "/v1/addresses/validate",
        ),
        batches: Batches.new(
          root: "/v1/batches",
          batch_by_external_id: "/v1/batches/external_batch_id",
        ),
        carriers_accounts: CarriersAccounts.new(
          root: "/v1/connections/carriers",
        ),
        carriers: Carriers.new(
          root: "/v1/carriers",
        ),
        shipsurance: Shipsurance.new(
          root: "/v1/connections/insurance/shipsurance",
          add_funds: "/v1/insurance/shipsurance/add_funds",
          balance: "/v1/insurance/shipsurance/balance",
        ),
        labels: Labels.new(
          root: "/v1/labels",
          label_by_external_shipment_id: "/v1/labels/external_shipment_id",
          purchase_label_with_rate_id: "/v1/labels/rates",
          purchase_label_with_shipment_id: "/v1/labels/shipment",
        ),
        manifests: Manifests.new(
          root: "/v1/manifests",
          manifest_request: "/v1/manifests/requests",
        ),
        package_pickups: PackagePickups.new(
          root: "/v1/pickups",
        ),
        package_types: PackageTypes.new(
          root: "/v1/packages",
        ),
        rates: Rates.new(
          root: "/v1/rates",
        ),
        service_points: ServicePoints.new(
          root: "/v1/service_points",
        ),
        shipments: Shipments.new(
          root: "/v1/shipments",
          shipment_by_external_id: "/v1/shipments/external_shipment_id",
          parse_shipping_info: "/v1/shipments/recognize",
        ),
        tags: Tags.new(
          root: "/v1/tags",
        ),
        tokens: Tokens.new(
          root: "/v1/tokens/ephemeral",
        ),
        tracking: Tracking.new(
          root: "/v1/tracking",
        ),
        warehouses: Warehouses.new(
          root: "/v1/warehouses",
        ),
        webhooks: Webhooks.new(
          root: "/v1/environment/webhooks",
        )
      ),
      vbeta: NamespaceVBeta.new(
        ltl: Ltl.new(
          carriers: "/v-beta/ltl/carriers",
          quotes: "/v-beta/ltl/quotes",
          spot_quotes: "/v-beta/ltl/spot-quotes",
          pickups: "/v-beta/ltl/pickups",
          tracking: "/v-beta/ltl/tracking",
        )
      )
    )

    RETRIES = 1

    TIMEOUT = 30_000

    PAGE_SIZE = 50

    # Regex pattern to match a valid *ISO-8601* string with timezone.
    VALID_ISO_STRING = /^(-?(?:[1-9][0-9]*)?[0-9]{4})-(1[0-2]|0[1-9])-(3[01]|0[1-9]|[12][0-9])T(2[0-3]|[01][0-9]):([0-5][0-9]):([0-5][0-9])(\.[0-9]+)?(Z|[+-](?:2[0-3]|[01][0-9]):[0-5][0-9])?$/.freeze

    # Regex pattern to match a valid *ISO-8601* string with no timezone.
    VALID_ISO_STRING_WITH_NO_TZ = /^(-?(?:[1-9][0-9]*)?[0-9]{4})-(1[0-2]|0[1-9])-(3[01]|0[1-9]|[12][0-9])T(2[0-3]|[01][0-9]):([0-5][0-9]):([0-5][0-9])(\.[0-9]+)?([+-](?:2[0-3]|[01][0-9]):[0-5][0-9])?$/.freeze

    module Country
      # rubocop:disable Layout/LineLength
      @countries = ["AF", "AX", "AL", "DZ", "AS", "AD", "AO", "AI", "AQ", "AG", "AR", "AM", "AW", "AU", "AT", "AZ", "BS", "BH", "BD", "BB", "BY", "BE", "BZ", "BJ", "BM", "BT", "BO", "BA", "BW", "BV", "BR", "IO", "BN", "BG", "BF", "BI", "KH", "CM", "CA", "CV", "KY", "CF", "TD", "CL", "CN", "CX", "CC", "CO", "KM", "CG", "CD", "CK", "CR", "CI", "HR", "CU", "CY", "CZ", "DK", "DJ", "DM", "DO", "EC", "EG", "SV", "GQ", "ER", "EE", "ET", "FK", "FO", "FJ", "FI", "FR", "GF", "PF", "TF", "GA", "GM", "GE", "DE", "GH", "GI", "GR", "GL", "GD", "GP", "GU", "GT", "GG", "GN", "GW", "GY", "HT", "HM", "VA", "HN", "HK", "HU", "IS", "IN", "ID", "IR", "IQ", "IE", "IM", "IL", "IT", "JM", "JP", "JE", "JO", "KZ", "KE", "KI", "KR", "KW", "KG", "LA", "LV", "LB", "LS", "LR", "LY", "LI", "LT", "LU", "MO", "MK", "MG", "MW", "MY", "MV", "ML", "MT", "MH", "MQ", "MR", "MU", "YT", "MX", "FM", "MD", "MC", "MN", "ME", "MS", "MA", "MZ", "MM", "NA", "NR", "NP", "NL", "NC", "NZ", "NI", "NE", "NG", "NU", "NF", "MP", "NO", "OM", "PK", "PW", "PS", "PA", "PG", "PY", "PE", "PH", "PN", "PL", "PT", "PR", "QA", "RE", "RO", "RU", "RW", "BL", "SH", "KN", "LC", "MF", "PM", "VC", "WS", "SM", "ST", "SA", "SN", "RS", "SC", "SL", "SG", "SK", "SI", "SB", "SO", "ZA", "GS", "ES", "LK", "SD", "SR", "SJ", "SZ", "SE", "CH", "SY", "TW", "TJ", "TZ", "TH", "TL", "TG", "TK", "TO", "TT", "TN", "TR", "TM", "TC", "TV", "UG", "UA", "AE", "GB", "US", "UM", "UY", "UZ", "VU", "VE", "VN", "VG", "VI", "WF", "EH", "YE", "ZM", "ZW"].freeze
      # rubocop:enable Layout/LineLength

      # @param [String] country - 2 letter country code
      def self.valid?(country)
        @countries.include?(country.upcase)
      end
    end
  end
end
