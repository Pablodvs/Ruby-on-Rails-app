require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
    test 'render a list of products ' do
        get products_path

        assert_response :success
        assert_select '.product', 2
    end

    test 'render a detailed product page' do
        get product_path(products(:Xiaomi_10))
        assert_response :success
        assert_select '.title', 'Xiaomi 10'
        assert_select '.description', '256GB'
        assert_select '.price', '850$'

    end
end