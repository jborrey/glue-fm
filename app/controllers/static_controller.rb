class StaticController < ApplicationController
  skip_before_action :authenticate!, only: :health

  def health; end
end
