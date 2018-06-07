class LizardsController < ApplicationController
  before_action :find_lizard, except: [:new, :index, :create]

  def new
    @lizard = Lizard.new
  end

  def index
    @lizards = Lizard.all 
  end

  def create
    @lizard = Lizard.new(lizard_params)

    if @lizard.save
      redirect_to @lizard
    else
      render 'new'
    end
  end

  def update
    if @lizard.update_attributes(lizard_params)
      redirect_to @lizard
    else
      render 'edit'
    end
  end

  def destroy
    @lizard.destroy
    redirect_to '/'
  end

  def show
    
  end

  def edit

  end

  private

    def lizard_params
      params.require(:lizard).permit(:name, :age, :level,
                                     :armor)
    end

    def find_lizard
      @lizard = Lizard.find(params[:id])
    end 
end
