Deface::Override.new(
  virtual_path: 'spree/admin/products/_form',
  name: 'Home Check To Product',
  insert_before: 'div[data-hook="admin_product_form_price"]',
  text: <<-HTML
          <% if current_spree_user.respond_to?(:has_spree_role?) && current_spree_user.has_spree_role?(:admin) %>
            <div data-hook="admin_product_form_to_home">
              <%= f.field_container :to_home, class: ['form-group'] do %>
                To Home
                <%= f.error_message_on :to_home %>
                <%= f.check_box :to_home, class: 'form-control' %>
              <% end %>
            </div>
          <% end %>
        HTML
)






