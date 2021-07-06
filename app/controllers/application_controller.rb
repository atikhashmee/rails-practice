class ApplicationController < ActionController::Base
    add_flash_types  :error, :info, :danger, :success
end
