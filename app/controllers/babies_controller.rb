class BabiesController < ApplicationController
  def index
    @babies = Baby.all
  end

  def new
    @baby = Baby.new
  end

  def create
    @baby = Baby.new(baby_params)
    if @baby.save
     redirect_to baby_path(@baby)
    else
     render 'new'
    end
  end

  def show
    @baby = Baby.find params[:id]
  end

  def edit
    @baby = Baby.find params[:id]
  end

  def update
    @baby = Baby.find params[:id]
    respond_to do |format|
      if @baby.update_attributes(baby_params)
        format.html { redirect_to baby_path(@baby), notice: 'El bebé fue creado exitosamente.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @baby = Baby.find params[:id]
    @baby.destroy
    respond_to do |format|
      format.html { redirect_to babies_url, notice: 'El bebé fue eliminado exitosamente.' }
    end
  end
end

private
  def baby_params
    params.require(:baby).permit(:name, breastfeedings_attributes: [:date, :time, :quantity])
  end