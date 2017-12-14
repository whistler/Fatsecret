class FatSecret
  module Food

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

      def autocomplete_food(expression, max_results=4)
        query = {
          :method => 'foods.autocomplete',
          :expression => expression.esc,
          :max_results => max_results
        }
        get(query)
      end

      def food_id_for_barcode(barcode)
        query = {
          :method => 'food.find_id_for_barcode',
          :barcode => barcode,
          :region => 'GB'
        }
        get(query)
      end

      def search_food(expression, page_number=0, max_results=20)
        query = {
          :method => 'foods.search',
          :search_expression => expression.esc,
          :page_number => page_number,
          :max_results => max_results,
          :region => 'GB'
        }
        get(query)
      end

      def food(id)
        query = {
          :method => 'food.get',
          :food_id => id,
          :region => 'GB',
          :flag_default_serving => true
        }
        get(query)
      end

    end

  end
end
