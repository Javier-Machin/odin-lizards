class LizardsController < ApplicationController
  before_action :find_lizard, except: [:new, :index, :create]

  def new
    @lizard = Lizard.new
  end

  def index
    @lizards = Lizard.all
    respond_to do |format|
      format.html 
      format.json { render :json => @lizards }
    end 
  end

  def create
    @lizard = Lizard.new(lizard_params)

    if @lizard.save
      flash[:notice] = "Lizard successfully created"
      redirect_to @lizard
    else
      render 'new'
    end
  end

  def update
    if @lizard.update_attributes(lizard_params)
      flash[:notice] = "Lizard successfully updated"
      redirect_to @lizard
    else
      render 'edit'
    end
  end

  def destroy
    if @lizard.destroy
      flash[:notice] = "Lizard destroyed"
      redirect_to '/'
    end
  end

  def show
    respond_to do |format|
      format.html 
      format.json { render :json => @lizard }
    end    
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
