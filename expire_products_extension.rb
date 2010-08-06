# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class ExpireProductsExtension < Spree::Extension
  version "1.0"
  description "Extend Products by expire method"
  url "http://github.com/fishman/spree-expire-products"

  # Please use expire_products/config/routes.rb instead for extension routes.

  # def self.require_gems(config)
  #   config.gem "gemname-goes-here", :version => '1.2.3'
  # end
  
  def activate
    # extend product
    Product.class_eval do
      named_scope :available,   lambda { |*args| { :conditions => ["products.available_on <= ? and (products.expires_on is null or products.expires_on >= ?)", args.first || Time.zone.now, args.first || Time.zone.now] } }
      end
  end
end
