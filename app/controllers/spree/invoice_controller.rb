module Spree
  class InvoiceController < Spree::BaseController
    def show
      template = params[:template]
      instance_variable_set('@' + template, true)
      @order = Spree::Order.find_by(number: params[:id])
      render template, layout: false
    end
  end
end