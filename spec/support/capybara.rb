# frozen_string_literal: true

Capybara.automatic_label_click = true
Capybara.default_max_wait_time = 8

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  config.before(:each, type: :system) do
    puts "KEY: #{ENV['DEBUG']}"
    if ENV['DEBUG'] == 'true'
      driven_by :selenium, using: :chrome, screen_size: [1600, 900]
    else
      driven_by :selenium, using: :headless_chrome, screen_size: [1600, 900]
    end
  end

  config.before(:each, type: :system, debug: true) do
    driven_by :selenium, using: :chrome, screen_size: [1600, 900]
  end

  # Use Rails System Specs for feature specs
  config.define_derived_metadata(file_path: %r{/spec/features/}) do |metadata|
    metadata[:type] = :system
  end

  # Do not show "booting puma" message in the middle of the specs
  config.before(:all, type: :system) do
    Capybara.server = :puma, { Silent: true }
  end
end
