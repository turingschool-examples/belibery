class FansController < ApplicationController
  def index
    @fans = Fan.all
  end

  def show
    @fan = Fan.find(params[:id])
  end

  def create
    @fan = Fan.new(fan_params)

    if @fan.save
      redirect_to fan_path(@fan), notice: "You have created a fan."
    else
      flash.now[:alert] = "The fan was not created. Please try again."
      render :new
    end
  end

  def new
    @fan = Fan.new
  end

  def edit
    @fan = Fan.find(params[:id])
  end

  def update
    @fan = Fan.find(params[:id])

    if @fan.update_attributes(fan_params)
      redirect_to fan_path(@fan), notice: "You have updated a fan."
    else
      flash.now[:alert] = "The fan was not updated. Please try again."
      render :edit
    end
  end

  def destroy
    fan = Fan.find(params[:id])
    fan.destroy

    redirect_to fans_path, notice: "The fan was deleted."
  end

  private

  def fan_params
    params.require(:fan).permit(:name, :email)
  end
end
