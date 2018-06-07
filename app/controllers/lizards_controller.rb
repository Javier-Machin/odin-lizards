class LizardsController < ApplicationController
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
    @lizard = Lizard.find(params[:id])

    if @lizard.update_attributes(lizard_params)
      redirect_to @lizard
    else
      render 'edit'
    end
  end

  def destroy
    Lizard.find(params[:id]).destroy
    redirect_to '/'
  end

  def show
    @lizard = Lizard.find(params[:id])
  end

  def edit
    @lizard = Lizard.find(params[:id])
  end

  private

    def lizard_params
      params.require(:lizard).permit(:name, :age, :level,
                                     :armor)
    end


end
