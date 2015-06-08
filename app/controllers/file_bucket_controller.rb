
class FileBucketController < ApplicationController

  before_filter :find_project_by_project_id, :only => [:index]
  before_filter :authorize

  def index

    respond_to do |format|
      format.html
      format.json { render :json => [] }
    end
  end

end

