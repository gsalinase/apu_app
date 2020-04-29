class BreastfeedingsController < ApplicationController
  before_action :find_baby

  def index
    @breastfeedings = @baby.breastfeedings
  end

  def new
    @breastfeeding = Breastfeeding.new
  end

  def create
    @breastfeeding = Breastfeeding.new(breastfeeding_params)
    @breastfeeding.baby = @baby
    
    respond_to do |format|
      if @breastfeeding.save
        format.html { redirect_to baby_breastfeedings_path(@baby, @breastfeeding), notice: 'El alimento fue dado al bebé correctamente.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @breastfeeding = Breastfeeding.find(params[:id])
  end

  def edit
    @breastfeeding = Breastfeeding.find params[:id]
  end

  def update
    @breastfeeding = Breastfeeding.find params[:id]
    respond_to do |format|
      if @breastfeeding.update(breastfeeding_params.merge(baby: @baby))
        format.html { redirect_to baby_breastfeeding_path(@baby, @breastfeeding), notice: 'El alimento fue actualizado con éxito.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @breastfeeding = Breastfeeding.find params[:id]
    @breastfeeding.destroy
    respond_to do |format|
      format.html { redirect_to baby_breastfeedings_url, notice: 'El alimento fue eliminado.' }
    end
  end

  private
  def breastfeeding_params
    params.require(:breastfeeding).permit(:date, :time, :quantity)
  end

  def find_baby
    @baby = Baby.find params[:baby_id]
  end
end
